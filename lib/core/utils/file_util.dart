// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

extension PathExtension on String {
  String joinPath(
    String part1, [
    String? part2,
    String? part3,
    String? part4,
    String? part5,
  ]) => p.join(this, part1, part2, part3, part4, part5);
}

class FileUtil {
  const FileUtil._();

  static final Map<String, XTypeGroup> _typeGroupMapper = {
    'JPG': XTypeGroup(label: 'jpg', extensions: <String>['jpg']),
    'PNG': XTypeGroup(label: 'png', extensions: <String>['png']),
    'MP4': XTypeGroup(label: 'mp4', extensions: <String>['mp4']),
    'AVI': XTypeGroup(label: 'avi', extensions: <String>['avi']),
    'MOV': XTypeGroup(label: 'mov', extensions: <String>['mov']),
    'MKV': XTypeGroup(label: 'mkv', extensions: <String>['mkv']),
    'WEBM': XTypeGroup(label: 'webm', extensions: <String>['webm']),
    'M3U8': XTypeGroup(label: 'm3u8', extensions: <String>['m3u8']),
    'XLSX': XTypeGroup(label: 'xlsx', extensions: <String>['xlsx']),
  };

  static Future<String?> selectFolderLocation({
    String? title,
    String? initialPath,
  }) async {
    return await FilePicker.platform.getDirectoryPath(
      dialogTitle: title,
      initialDirectory: initialPath,
      lockParentWindow: true,
    );
  }

  static Future<String?> selectSaveLocation(
    String fileName,
    String extension,
  ) async {
    try {
      // Use file_picker for Windows to prevent UI freezing with lockParentWindow
      if (Platform.isWindows) {
        final cleanExtension = extension.replaceAll('.', '').toLowerCase();
        final result = await FilePicker.platform.saveFile(
          dialogTitle: 'Save file',
          fileName: fileName,
          allowedExtensions: [cleanExtension],
          type: FileType.custom,
          lockParentWindow: true, // Prevents UI freezing on Windows
        );
        if (result == null) return null;

        // Ensure file has extension
        return result.endsWith('.$cleanExtension')
            ? result
            : '$result.$cleanExtension';
      }

      // Use file_selector for other platforms (macOS, Linux)
      final result = await getSaveLocation(
        acceptedTypeGroups: [
          _typeGroupMapper[extension.toUpperCase()] ?? _typeGroupMapper['MP4']!,
        ],
        suggestedName: fileName,
      );
      if (result == null) return null;

      final _extension = result.activeFilter?.extensions?.firstOrNull ?? 'mp4';

      // MacOS thì result.path đã gắn extension luôn
      return result.path.endsWith(_extension)
          ? result.path
          : '${result.path}.$_extension';
    } catch (e) {
      // Handle any errors from the file dialog
      return null;
    }
  }

  static Future<bool> ensureFolderExists(String path) async {
    try {
      final isFilePath = p.extension(path).isNotEmpty;

      // Path là file → tạo folder chứa file
      if (isFilePath) {
        final dir = Directory(p.dirname(path));
        if (!await dir.exists()) await dir.create(recursive: true);
      }
      // Path là folder
      else {
        final dir = Directory(path);
        if (!await dir.exists()) await dir.create(recursive: true);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<ConfigurationFolders> ensureConfigurationFolders() async {
    final vmsLibraryPath = await getVMSLibraryDirectory();
    final videoFolderPath = p.join(vmsLibraryPath, "Video");
    final snapshotFolderPath = p.join(vmsLibraryPath, "Snapshots");

    await ensureFolderExists(videoFolderPath);
    await ensureFolderExists(snapshotFolderPath);

    return ConfigurationFolders(
      vmsLibrary: vmsLibraryPath,
      video: videoFolderPath,
      snapshots: snapshotFolderPath,
    );
  }

  static Future<String> getVMSLibraryDirectory() async {
    final documentDirectory =
        await getApplicationDocumentsDirectory(); // C:\Users\admin\Documents

    final vmsLibraryPath = p.join(documentDirectory.path, 'VMSLibrary');
    await ensureFolderExists(vmsLibraryPath);
    return vmsLibraryPath;
  }

  /// Trả về một đường dẫn an toàn trong thư mục Documents của user
  /// để lưu file khi vị trí do user chọn không ghi được (vd: /Users trên macOS).
  static Future<String> getSafeUserFilePath(String fileName) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final safePath = p.join(documentDirectory.path, fileName);
    await ensureFolderExists(safePath);
    return safePath;
  }
}

class ConfigurationFolders {
  final String vmsLibrary;
  final String video;
  final String snapshots;

  const ConfigurationFolders({
    required this.vmsLibrary,
    required this.video,
    required this.snapshots,
  });
  factory ConfigurationFolders.empty() =>
      ConfigurationFolders(vmsLibrary: '', video: '', snapshots: '');
}
