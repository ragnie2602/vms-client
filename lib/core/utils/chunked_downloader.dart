import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';

// -----------------------------------------------------
// Các Định nghĩa Phụ Trợ (Enums và Models)
// -----------------------------------------------------

/// Trạng thái của một phiên tải xuống
enum ChunkedDownloaderStatus { idle, downloading, paused, merging, completed, cancelled, failed }

/// Dữ liệu tiến độ tải xuống
class ChunkedDownloaderProgress {
  final int receivedBytes;
  final int totalBytes;
  final double progress;
  final ChunkedDownloaderStatus status;
  final String? filePath;

  ChunkedDownloaderProgress({
    required this.receivedBytes,
    required this.totalBytes,
    required this.progress,
    required this.status,
    this.filePath,
  });

  @override
  String toString() =>
      'Status: $status, Progress: ${(progress * 100).toStringAsFixed(2)}%, Received: $receivedBytes/$totalBytes';
}

// -----------------------------------------------------
// Lớp ChunkedDownloader
// -----------------------------------------------------

class ChunkedDownloader {
  static const String _TAG = 'Chunked Downloader';
  static const String _FOLDER_NAME = 'ChunkedDownloads';

  /* CONFIG CÓ THỂ ĐƯỢC TRUYỀN VÀO CONSTRUCTOR */
  final int chunkSize; // Giá trị này có thể là 0 (cờ hiệu)
  final Dio _dio;

  final String _currentUrl;
  final String _currentFilename;

  /* QUẢN LÝ ĐƯỜNG DẪN */
  String? _saveDirPath; // <=> _chunkDirPath nếu null
  String? _chunkDirPath; // <=> getTemporaryDirectory()/ChunkedDownloads

  /* QUẢN LÝ TRẠNG THÁI */
  CancelToken? _cancelToken;
  ChunkedDownloaderStatus _currentStatus = ChunkedDownloaderStatus.idle;
  int _fileSize = 0;
  // Dùng để lưu tiến độ của từng chunk (hoặc chunk 0 cho single download)
  final Map<int, int> _chunkProgressMap = {};

  final _progressController = StreamController<ChunkedDownloaderProgress>.broadcast();
  Stream<ChunkedDownloaderProgress> get progressStream => _progressController.stream;

  /* QUẢN LÝ TIMER TOÀN CỤC */
  Timer? _globalProgressTimer;
  final Duration _globalUpdateInterval;

  // ------------------------------------------------------------------
  // CONSTRUCTOR: Nếu chunkSize là null, gán 0 để báo hiệu chế độ Single Chunk
  // ------------------------------------------------------------------
  ChunkedDownloader({
    required String url,
    required String filename,
    String? savedPath,
    int? chunkSize,
    Dio? dio,
    Duration progressUpdateInterval = const Duration(milliseconds: 500),
  }) : _currentUrl = url,
       _currentFilename = filename,
       // Nếu chunkSize là null, gán 0 làm cờ hiệu cho "Single Chunk Mode"
       chunkSize = chunkSize ?? 0,
       _dio =
           dio ??
           Dio(
             BaseOptions(
               receiveTimeout: const Duration(seconds: 20),
               connectTimeout: const Duration(seconds: 20),
             ),
           ),
       _saveDirPath = savedPath,
       _globalUpdateInterval = progressUpdateInterval;

  /// ------------------------------------------------------------------
  /// HÀM DISPOSE() QUAN TRỌNG ĐỂ NGĂN CHẶN RÒ RỈ BỘ NHỚ
  /// ------------------------------------------------------------------
  Future<void> dispose({bool cleanup = false}) async {
    _globalProgressTimer?.cancel();
    if (_currentStatus == ChunkedDownloaderStatus.downloading) {
      await cancel();
    } else if (cleanup) {
      await _cleanupTemp();
    }
    _progressController.close();
  }

  // Hàm tính tổng tiến độ realtime
  int _calculateRealtimeProgress() {
    return _chunkProgressMap.values.fold(0, (sum, bytes) => sum + bytes);
  }

  // Cập nhật trạng thái và tiến độ
  void _updateProgress({int? total, ChunkedDownloaderStatus? status, String? finalPath}) {
    if (_progressController.isClosed) return;

    _fileSize = total ?? _fileSize;
    _currentStatus = status ?? _currentStatus;

    final receivedBytes = _calculateRealtimeProgress();

    double progress = 0.0;
    if (_fileSize > 0) {
      progress = receivedBytes / _fileSize;
    }

    final progressUpdate = ChunkedDownloaderProgress(
      receivedBytes: receivedBytes,
      totalBytes: _fileSize,
      progress: progress.clamp(0.0, 1.0),
      status: _currentStatus,
      filePath: finalPath,
    );

    _progressController.add(progressUpdate);
  }

  // Hàm này được gọi để thiết lập Timer, chỉ dùng cho trạng thái 'downloading'
  void _startProgressTimer() {
    if (_globalProgressTimer != null && _globalProgressTimer!.isActive) return;

    _globalProgressTimer = Timer.periodic(_globalUpdateInterval, (timer) {
      if (_currentStatus == ChunkedDownloaderStatus.downloading) {
        _updateProgress(total: _fileSize, status: ChunkedDownloaderStatus.downloading);
      } else {
        _stopProgressTimer();
      }
    });
  }

  // Hàm này được gọi để dừng Timer
  void _stopProgressTimer() {
    _globalProgressTimer?.cancel();
    _globalProgressTimer = null;
  }

  // Lấy kích thước file
  Future<int?> _getFileSize(String url) async {
    try {
      var response = await _dio.head(url);
      final lengthHeader = response.headers.value('content-length');
      return int.tryParse(lengthHeader ?? '0');
    } on DioException catch (e) {
      Logger.error('Error getting file size: ${e.message}', tag: _TAG, writeLog: true);
      return null;
    } catch (e) {
      Logger.error('Error getting file size: $e', tag: _TAG, writeLog: true);
      return null;
    }
  }

  // Khởi tạo Map tiến độ cho Resume (dùng cho Multi-chunk)
  Future<void> _initializeProgressMap(int totalChunks) async {
    _chunkProgressMap.clear();
    for (int i = 0; i < totalChunks; i++) {
      final filePath = _chunkDirPath!.joinPath('$_currentFilename.part$i');
      File file = File(filePath);
      if (await file.exists()) {
        _chunkProgressMap[i] = await file.length();
      } else {
        _chunkProgressMap[i] = 0;
      }
    }
  }

  /* CHỨC NĂNG TẢI XUỐNG ĐƠN (TOTAL CHUNKS <= 1) */
  Future<void> _singleDownload() async {
    final finalFilePath = _saveDirPath!.joinPath(_currentFilename);
    _updateProgress(total: _fileSize, status: ChunkedDownloaderStatus.downloading);

    // Chuẩn bị cho Single Chunk: sử dụng _chunkProgressMap[0] cho tiến độ
    _chunkProgressMap.clear();
    _chunkProgressMap[0] = 0;

    // BẮT ĐẦU TIMER ĐỊNH KỲ
    _startProgressTimer();

    try {
      // 1. Kiểm tra Resume/Partial Download
      File finalFile = File(finalFilePath);
      int downloadedBytes = 0;
      if (await finalFile.exists()) {
        downloadedBytes = await finalFile.length();
        if (downloadedBytes >= _fileSize) {
          _updateProgress(
            total: _fileSize,
            status: ChunkedDownloaderStatus.completed,
            finalPath: finalFilePath,
          );
          _stopProgressTimer();
          // Cập nhật trạng thái sau khi hoàn tất
          _currentStatus = ChunkedDownloaderStatus.idle;
          _chunkProgressMap.clear();
          _fileSize = 0;
          return;
        }
        _chunkProgressMap[0] = downloadedBytes;
      }

      // 2. Thiết lập Range và Download trực tiếp
      final int rangeStart = downloadedBytes;

      await _dio.download(
        _currentUrl,
        finalFilePath,
        options: Options(
          headers: rangeStart > 0 ? {'Range': 'bytes=$rangeStart-$_fileSize'} : null,
          receiveDataWhenStatusError: true,
        ),
        cancelToken: _cancelToken,
        deleteOnError: false, // Giữ lại file đang tải dở cho Resume
        onReceiveProgress: (received, total) {
          // CHỈ CẬP NHẬT MAP, TIMER SẼ TỰ PHÁT STREAM ĐỊNH KỲ
          int currentProgress = downloadedBytes + received;
          _chunkProgressMap[0] = currentProgress;
        },
        fileAccessMode: downloadedBytes > 0 ? FileAccessMode.append : FileAccessMode.write,
      );

      // DỪNG TIMER
      _stopProgressTimer();

      // Cập nhật trạng thái Hoàn thành
      _chunkProgressMap[0] = _fileSize;
      _updateProgress(
        total: _fileSize,
        status: ChunkedDownloaderStatus.completed,
        finalPath: finalFilePath,
      );

      _currentStatus = ChunkedDownloaderStatus.idle;
      _chunkProgressMap.clear();
      _fileSize = 0;
    } on DioException catch (e) {
      _stopProgressTimer();
      if (e.type == DioExceptionType.cancel) {
        // Tạm dừng/Hủy bỏ, trạng thái đã được đặt bởi pause()/cancel()
        _updateProgress(status: _currentStatus);
      } else {
        // Lỗi khác
        _updateProgress(status: ChunkedDownloaderStatus.failed);
        Logger.error(
          'Single download failed ($_currentUrl): ${e.message}',
          tag: _TAG,
          writeLog: true,
        );
      }
    } catch (e) {
      _stopProgressTimer();
      _updateProgress(status: ChunkedDownloaderStatus.failed);
      Logger.error('Single download failed ($_currentUrl): $e', tag: _TAG, writeLog: true);
    }
  }

  /* CHỨC NĂNG QUẢN LÝ TẢI XUỐNG */

  /// Bắt đầu hoặc tiếp tục tải xuống
  Future<void> download() async {
    if (_currentStatus == ChunkedDownloaderStatus.downloading ||
        _currentStatus == ChunkedDownloaderStatus.merging) {
      return;
    }

    if (_progressController.isClosed) {
      Logger.error('Cannot start download, object has been disposed.', tag: _TAG, writeLog: true);
      return;
    }

    // 1. Khởi tạo _chunkDirPath (Luôn là thư mục tạm thời của hệ thống)
    if (_chunkDirPath == null) {
      try {
        final tempDir = await getTemporaryDirectory();
        _chunkDirPath = tempDir.path.joinPath(_FOLDER_NAME);
        await FileUtil.ensureFolderExists(_chunkDirPath!);
      } catch (e) {
        _updateProgress(status: ChunkedDownloaderStatus.failed);
        Logger.error('Failed to resolve temporary directory path: $e', tag: _TAG, writeLog: true);
        return;
      }
    }

    // 2. Khởi tạo _saveDirPath (Nếu không truyền vào, mặc định là _chunkDirPath)
    if (_saveDirPath == null || _saveDirPath!.isEmpty) {
      _saveDirPath = _chunkDirPath;
    }

    try {
      // 3. Khởi tạo
      _cancelToken = CancelToken();

      // 4. Lấy kích thước File
      _fileSize = await _getFileSize(_currentUrl) ?? 0;
      if (_fileSize == 0) {
        _updateProgress(status: ChunkedDownloaderStatus.failed);
        return;
      }

      // 5. Tính toán chunkSize cuối cùng và totalChunks
      int calculatedChunkSize = chunkSize;
      if (calculatedChunkSize == 0 || calculatedChunkSize >= _fileSize) {
        calculatedChunkSize = _fileSize;
      }
      final totalChunks = (_fileSize / calculatedChunkSize).ceil();

      // *** ĐIỀU KIỆN TỐI ƯU ***
      if (totalChunks <= 1) {
        // Nếu là tải xuống đơn, chuyển sang luồng tối ưu
        return await _singleDownload();
      }

      // ----------------------------------------------------
      // BẮT ĐẦU LUỒNG MULTI-CHUNK
      // ----------------------------------------------------

      // 6. Khởi tạo và tính toán byte đã tải để tiếp tục (Resume)
      await _initializeProgressMap(totalChunks);
      _updateProgress(total: _fileSize, status: ChunkedDownloaderStatus.downloading);

      // BẮT ĐẦU TIMER ĐỊNH KỲ
      _startProgressTimer();

      // 7. Download chunks in parallel
      List<Future<bool>> downloadTasks = [];
      for (int i = 0; i < totalChunks; i++) {
        int start = i * calculatedChunkSize;
        int end = start + calculatedChunkSize - 1;
        if (end >= _fileSize) {
          end = _fileSize - 1;
        }

        downloadTasks.add(_chunkDownload(i, start, end));
      }

      final results = await Future.wait(downloadTasks);
      _cancelToken = null;

      // DỪNG TIMER SAU KHI TẢI XONG CÁC CHUNK
      _stopProgressTimer();

      // 8. Merge chunks
      if (results.every((ok) => ok) && _currentStatus == ChunkedDownloaderStatus.downloading) {
        // Cập nhật tiến độ lần cuối (đảm bảo 100% nếu thành công)
        _updateProgress(total: _fileSize, status: ChunkedDownloaderStatus.downloading);
        await _mergeChunks(totalChunks);
      } else if (_currentStatus != ChunkedDownloaderStatus.cancelled &&
          _currentStatus != ChunkedDownloaderStatus.paused) {
        _updateProgress(status: ChunkedDownloaderStatus.failed);
      }
    } catch (e) {
      _stopProgressTimer();
      if (_currentStatus != ChunkedDownloaderStatus.cancelled &&
          _currentStatus != ChunkedDownloaderStatus.paused) {
        _updateProgress(status: ChunkedDownloaderStatus.failed);
      }
      Logger.error('Download failed: $e', tag: _TAG, writeLog: true);
    }
  }

  Future<void> resume() async {
    if (_currentStatus == ChunkedDownloaderStatus.paused) {
      await download();
    }
  }

  void pause() {
    if (_currentStatus == ChunkedDownloaderStatus.downloading) {
      _currentStatus = ChunkedDownloaderStatus.paused;
      _cancelToken?.cancel('Download paused by user');
      _stopProgressTimer();
      _updateProgress(status: ChunkedDownloaderStatus.paused);
    }
  }

  Future<void> cancel() async {
    if (_currentStatus == ChunkedDownloaderStatus.downloading ||
        _currentStatus == ChunkedDownloaderStatus.paused) {
      _currentStatus = ChunkedDownloaderStatus.cancelled;
      _cancelToken?.cancel('Download cancelled by user');
      _stopProgressTimer();
      _updateProgress(status: ChunkedDownloaderStatus.cancelled);

      await _cleanupTemp();
    }
  }

  // Tải xuống từng chunk (Dành cho Multi-chunk)
  Future<bool> _chunkDownload(int chunkIndex, int start, int end) async {
    if (_currentStatus != ChunkedDownloaderStatus.downloading) return false;

    final path = _chunkDirPath!.joinPath('$_currentFilename.part$chunkIndex');

    File tempFile = File(path);
    int downloadedBytesInChunk = 0;
    if (await tempFile.exists()) {
      downloadedBytesInChunk = await tempFile.length();
      // Cập nhật map để tính toán progress tổng thể chính xác
      _chunkProgressMap[chunkIndex] = downloadedBytesInChunk;
    }
    final totalChunkSize = end - start + 1; // Kích thước thực tế của chunk này

    if (downloadedBytesInChunk >= totalChunkSize) {
      Logger.log('Chunk $chunkIndex is already fully downloaded, skipping.', tag: _TAG);
      return true;
    }

    int rangeStart = start + downloadedBytesInChunk;

    try {
      await _dio.download(
        _currentUrl,
        path,
        options: Options(
          headers: {'Range': 'bytes=$rangeStart-$end'},
          receiveDataWhenStatusError: true,
        ),
        cancelToken: _cancelToken,
        deleteOnError: false,
        onReceiveProgress: (received, total) {
          // CHỈ CẬP NHẬT MAP, TIMER SẼ TỰ PHÁT STREAM ĐỊNH KỲ
          int currentChunkProgress = downloadedBytesInChunk + received;
          _chunkProgressMap[chunkIndex] = currentChunkProgress;
        },
        fileAccessMode: downloadedBytesInChunk > 0 ? FileAccessMode.append : FileAccessMode.write,
      );

      // CẬP NHẬT NGAY LẬP TỨC KHI CHUNK HOÀN THÀNH
      _chunkProgressMap[chunkIndex] = totalChunkSize;
      _updateProgress(total: _fileSize, status: ChunkedDownloaderStatus.downloading);

      return true;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return false;
      }

      // Xử lý Timeout/Mất mạng
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.error is SocketException) {
        Logger.error(
          'Chunk $chunkIndex failed due to network loss/timeout: ${e.message}',
          tag: _TAG,
          writeLog: true,
        );
        return false;
      }

      Logger.error(
        'Failed to download chunk #$chunkIndex ($_currentUrl): ${e.message}',
        tag: _TAG,
        writeLog: true,
      );
      return false;
    } catch (e) {
      Logger.error(
        'An unexpected error occurred in chunk #$chunkIndex ($_currentUrl): $e',
        tag: _TAG,
        writeLog: true,
      );
      return false;
    }
  }

  // Gộp các chunk (Dành cho Multi-chunk)
  Future<void> _mergeChunks(int totalChunks) async {
    _updateProgress(status: ChunkedDownloaderStatus.merging);

    String finalFilePath = _saveDirPath!.joinPath(_currentFilename);
    File finalFile = File(finalFilePath);

    try {
      RandomAccessFile raf = await finalFile.open(mode: FileMode.write);

      for (int i = 0; i < totalChunks; i++) {
        String tempFilePath = _chunkDirPath!.joinPath('$_currentFilename.part$i');
        File tempFile = File(tempFilePath);

        if (await tempFile.exists()) {
          List<int> chunkBytes = await tempFile.readAsBytes();
          await raf.writeFrom(chunkBytes);
          await tempFile.delete();
        }
      }

      await raf.close();
      _updateProgress(
        total: _fileSize,
        status: ChunkedDownloaderStatus.completed,
        finalPath: finalFilePath,
      );

      _currentStatus = ChunkedDownloaderStatus.idle;
      _chunkProgressMap.clear();
      _fileSize = 0;
    } catch (e) {
      Logger.error('Error merging chunks: $e', tag: _TAG, writeLog: true);
      _updateProgress(status: ChunkedDownloaderStatus.failed);
      _currentStatus = ChunkedDownloaderStatus.failed;
    }
  }

  // Dọn dẹp các file temporary
  Future<void> _cleanupTemp() async {
    // Tính toán totalChunks để xác định loại download (Single/Multi-chunk)
    int calculatedChunkSize = chunkSize;
    if (calculatedChunkSize == 0 || calculatedChunkSize >= _fileSize) {
      calculatedChunkSize = _fileSize > 0 ? _fileSize : 1;
    }
    final totalChunks = (_fileSize / calculatedChunkSize).ceil();

    if (totalChunks <= 1 && _fileSize > 0) {
      // Single-chunk: Xóa file đích nếu nó nằm trong thư mục tạm
      if (_saveDirPath == _chunkDirPath) {
        final finalFilePath = _saveDirPath!.joinPath(_currentFilename);
        File finalFile = File(finalFilePath);
        if (await finalFile.exists()) {
          try {
            await finalFile.delete();
          } catch (e) {
            Logger.error('Could not delete single file $finalFilePath: $e', tag: _TAG);
          }
        }
      }
    } else {
      // Multi-chunk: Xóa các file .partX
      for (int i = 0; i < totalChunks; i++) {
        String tempFilePath = _chunkDirPath!.joinPath('$_currentFilename.part$i');
        File tempFile = File(tempFilePath);
        if (await tempFile.exists()) {
          try {
            await tempFile.delete();
          } catch (e) {
            Logger.error('Could not delete temp file $tempFilePath: $e', tag: _TAG);
          }
        }
      }
    }

    _chunkProgressMap.clear();
    _fileSize = 0;
  }

  //
  //
  //
  // -----------------------------------------------------
  // CHỨC NĂNG DỌN DẸP (Dọn dẹp các file .partX và file đích đang tải dở bị sót lại từ các phiên download trước đó)
  // -----------------------------------------------------
  static Future<void> cleanupResidualFiles() async {
    final Directory tempDir;
    try {
      tempDir = await getTemporaryDirectory();
    } catch (e) {
      Logger.error(
        'Failed to resolve temporary directory path for cleanup: $e',
        tag: 'ChunkedDownloader.Cleanup',
      );
      return;
    }

    final ReceivePort receivePort = ReceivePort();
    receivePort.listen((dynamic message) {
      if (message is Map<String, dynamic>) {
        final String logMessage = message['message'];
        final bool isError = message['isError'] ?? false;

        if (isError) {
          Logger.error(logMessage, tag: "ChunkedDownloader.Cleanup", writeLog: true);
        } else {
          Logger.log(logMessage, tag: "ChunkedDownloader.Cleanup");
        }
      }
    });

    try {
      await compute<Map<String, dynamic>, void>(_cleanupResidualFiles, {
        'tempDirPath': tempDir.path,
        'receivePort': receivePort.sendPort,
      });
    } catch (e) {
      Logger.error('Failed to start cleanup Isolate: $e', tag: _TAG);
    } finally {
      receivePort.close();
    }
  }

  static Future<void> _cleanupResidualFiles(Map<String, dynamic> params) async {
    final String tempDirPath = params['tempDirPath'] as String;
    final SendPort sendPort = params['receivePort'] as SendPort;

    // Helper function để gửi log về Isolate chính
    void _sendLog(String message, {bool isError = false}) {
      sendPort.send({'message': message, 'isError': isError});
    }

    // Xác định đường dẫn thư mục tạm chứa file của downloader
    final String downloaderTempPath = tempDirPath.joinPath(_FOLDER_NAME);
    final Directory downloaderTempDir = Directory(downloaderTempPath);

    if (!await downloaderTempDir.exists()) {
      _sendLog('Chunked Downloader temp directory not found. Cleanup skipped.');
      return;
    }

    _sendLog('=== Scanning Chunked Downloader directory ($downloaderTempPath) ===');
    await Future.delayed(const Duration(milliseconds: 50));

    try {
      // PHASE 1: Quét và xóa TẤT CẢ các file/thư mục con bên trong thư mục chuyên biệt
      // Việc này xử lý mọi thứ: file .partX dở dang, file single-chunk bị hủy,
      // và file final bị sót lại (nếu nó được lưu trong thư mục temp này).
      await for (final FileSystemEntity entity in downloaderTempDir.list()) {
        try {
          // Xóa entity (file hoặc thư mục) hiện tại. Dùng recursive: true cho thư mục
          await entity.delete(recursive: true);
          _sendLog('-> Deleted residual entity: ${entity.uri.pathSegments.last}');
        } catch (e) {
          _sendLog(
            'Could not delete residual entity ${entity.uri.pathSegments.last}: $e',
            isError: true,
          );
        }
      }
    } catch (e) {
      _sendLog('Error during residual cleanup scan: $e', isError: true);
    }
  }
}
