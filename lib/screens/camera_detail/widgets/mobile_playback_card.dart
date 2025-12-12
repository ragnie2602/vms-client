// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/chunked_downloader.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';
import 'playback_painter.dart';

class MobilePlaybackCard extends StatefulWidget {
  const MobilePlaybackCard({
    super.key,
    required this.playback,
    required this.backgroundColor,
    this.onTap,
    required this.isSelected,
  });
  final PlaybackVideo playback;
  final Color backgroundColor;
  final Function()? onTap;
  final bool isSelected;

  @override
  State<MobilePlaybackCard> createState() => _MobilePlaybackCardState();
}

class _MobilePlaybackCardState extends State<MobilePlaybackCard> with WidgetsBindingObserver {
  late final ValueNotifier<double?> _progress = ValueNotifier(null);
  late final ValueNotifier<bool> _isError = ValueNotifier(false);
  ChunkedDownloader? _chunkedDownloader;

  String? _pendingToastMessage;
  bool _pendingToastIsSuccess = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _progress.dispose();
    _isError.dispose();
    _chunkedDownloader?.dispose(cleanup: true);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed && _pendingToastMessage != null) {
      while (!mounted) {}

      final message = Text(
        _pendingToastMessage!,
        style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
      );
      if (_pendingToastIsSuccess) {
        ToastUtil.toastSuccess(title: message);
      } else {
        ToastUtil.toastFail(title: message);
      }

      _pendingToastMessage = null;
    }
  }

  Future<bool> _continueIfUsingMobileData() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      final confirmed = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            'Bạn đang sử dụng dữ liệu di động. Tiếp tục tải?',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              lineHeight: 1.25,
            ),
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
          titlePadding: EdgeInsets.only(top: 22, left: 16, right: 16, bottom: 6),
          actionsPadding: EdgeInsets.fromLTRB(16, 9, 16, 16),
          actions: [
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => Navigator.pop(context, false),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Huỷ',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.redFF0000,
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => Navigator.pop(context, true),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Tiếp tục',
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      return confirmed ?? false;
    }

    return true;
  }

  Future<bool?> _confirmContinueDownload() async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Có lỗi xảy ra trong quá trình tải. Bạn muốn tiếp tục tải hay huỷ quá trình tải?',
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            lineHeight: 1.25,
          ),
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
        titlePadding: EdgeInsets.only(top: 22, left: 16, right: 16, bottom: 6),
        actionsPadding: EdgeInsets.fromLTRB(16, 9, 16, 16),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => Navigator.pop(context, false),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                'Huỷ bỏ',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.redFF0000,
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => Navigator.pop(context, true),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                'Tiếp tục',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetProgress() {
    _progress.value = null;
    _isError.value = false;
  }

  Future<void> _handleDownload() async {
    if (_progress.value == null) return _onDownload();

    if (_isError.value && _chunkedDownloader != null) {
      final confirmed = await _confirmContinueDownload();
      if (confirmed == true) {
        _chunkedDownloader!.download();
      } else {
        _resetProgress();
        _chunkedDownloader?.dispose(cleanup: true);
        _chunkedDownloader = null;
      }
    }
  }

  Future<void> _onDownload() async {
    if (_progress.value != null) return;
    _progress.value = 0.0; // Gán luôn để tránh click 2 lần

    String? savedPath;

    // Trên ios do codec của audio nên không lưu được vào thư viện ảnh --> chọn vị trí để lưu
    if (Platform.isIOS) {
      savedPath = await FileUtil.selectFolderLocation(needFullAccess: true);
      if (savedPath == null) return _resetProgress();
    } else {
      // Check quyền
      bool granted = await Gal.hasAccess();
      if (!granted) granted = await Gal.requestAccess();
      if (!granted) return _resetProgress();
    }

    // Warning khi sử dụng dữ liệu di động để tải
    if (await _continueIfUsingMobileData() == false) return _resetProgress();

    _chunkedDownloader ??= ChunkedDownloader(
      savedPath: savedPath,
      chunkSize: 10 * 1024 * 1024, // Chia đều ra các file 10 MB
      url: widget.playback.urlPlayback,
      filename:
          "${context.read<CameraDetailBloc>().state.camera!.name}_${widget.playback.startTime.format("yyyyMMdd_HHmmss")}.mp4",
    );
    _chunkedDownloader!.progressStream.listen((progress) {
      if (!mounted) return;

      _progress.value = progress.progress;

      switch (progress.status) {
        case ChunkedDownloaderStatus.downloading:
          _isError.value = false;
          break;
        case ChunkedDownloaderStatus.completed:
          _onCompleted(progress.filePath!, saveToGallery: !Platform.isIOS);
          break;
        case ChunkedDownloaderStatus.failed:
          _isError.value = true;
          break;
        default:
          break;
      }
    });
    _chunkedDownloader!.download();
  }

  Future<void> _onCompleted(String path, {bool saveToGallery = true}) async {
    try {
      // Lưu vào thư viện ảnh + toast + xoá file
      if (saveToGallery) await Gal.putVideo(path);

      if (mounted && WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        ToastUtil.toastSuccess(
          title: Text(
            'Tải xuống thành công',
            style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
          ),
        );
      } else {
        _pendingToastMessage = 'Tải xuống thành công';
        _pendingToastIsSuccess = true;
      }
    } catch (e) {
      Logger.error(e);

      if (mounted && WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        ToastUtil.toastFail(
          title: Text(
            'Có lỗi xảy ra trong quá trình lưu video vào thư viện',
            style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
          ),
        );
      } else {
        _pendingToastMessage = 'Có lỗi xảy ra trong quá trình lưu video vào thư viện';
        _pendingToastIsSuccess = false;
      }
    }

    _resetProgress();
    _chunkedDownloader?.dispose();
    _chunkedDownloader = null;

    if (saveToGallery) {
      // Xoá file
      File file = File(path);
      if (file.existsSync()) file.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          children: [
            CustomPaint(
              painter: PlaybackPainter(lineColor: AppColors.greyE5E5E5, circleSize: 7),
              size: Size(25, 72),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(3),
              ),
              height: 48,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.playback.urlThumbnail,
                      fit: BoxFit.cover,
                      loadingBuilder: (_, __, ___) => Center(child: CircularProgressIndicator()),
                      errorBuilder: (_, __, ___) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(AppAssets.logoFull),
                      ),
                    ),

                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.45)),
                      ),
                    ),

                    if (widget.isSelected == false)
                      Center(
                        child: SvgPicture.asset(
                          AppAssets.icPlay,
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.playback.startTime.format('HH:mm:ss'),
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey666666,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    formatMMSS(widget.playback.endTime.difference(widget.playback.startTime)),
                    style: AppTypography.style(
                      10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),

            /*  */
            Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: _handleDownload,
              child: Container(
                height: 36,
                width: 36,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: _progress,
                  builder: (context, value, child) => value == null
                      ? SvgPicture.asset(AppAssets.icDownload, width: 16, height: 16)
                      : Stack(
                          children: [
                            /* Error */
                            ValueListenableBuilder(
                              valueListenable: _isError,
                              builder: (context, value, child) => value
                                  ? Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        child: FittedBox(
                                          child: Icon(Icons.error, color: Colors.red),
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ),

                            /* Loading */
                            CircularProgressIndicator(
                              padding: const EdgeInsets.all(8),
                              value: value,
                              color: Color(0xFF15ABFF),
                              backgroundColor: Color(0xFFC3D3D9),
                              strokeWidth: 2.5,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(width: 17),
          ],
        ),
      ),
    );
  }

  String formatMMSS(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
