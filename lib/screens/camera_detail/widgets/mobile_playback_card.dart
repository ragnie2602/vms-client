import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';

import 'playback_painter.dart';

class MobilePlaybackCard extends StatefulWidget {
  const MobilePlaybackCard({
    super.key,
    required this.playback,
    required this.backgroundColor,
    this.onTap,
  });
  final PlaybackVideo playback;
  final Color backgroundColor;
  final Function()? onTap;

  @override
  State<MobilePlaybackCard> createState() => _MobilePlaybackCardState();
}

class _MobilePlaybackCardState extends State<MobilePlaybackCard> {
  late final ValueNotifier<double?> _progress = ValueNotifier(null);

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  void _onDownload() {
    if (_progress.value != null) return;

    // context.read<PlaybackBloc>().add(
    //   DownloadPlayback(
    //     widget.playback,
    //     onProgress: (progress) => _progress.value = progress,
    //     onError: (error) {
    //       _progress.value = null;
    //       ToastUtil.toastFail(
    //         context: context,
    //         title: Text(error ?? 'Có lỗi xảy ra khi tải video'),
    //       );
    //     },
    //   ),
    // );
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
                color: AppColors.black.withValues(alpha: 0.5),
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
                      errorBuilder: (_, __, ___) => SizedBox(),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: AppColors.black.withValues(alpha: 0.25),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssets.icPlay,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
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
              onTap: _onDownload,
              child: Container(
                height: 36,
                width: 36,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: _progress,
                  builder: (context, value, child) => value == null
                      ? SvgPicture.asset(AppAssets.icDownload, width: 16, height: 16)
                      : CircularProgressIndicator(
                          padding: const EdgeInsets.all(11),
                          value: value,
                          color: Color(0xFF15ABFF),
                          backgroundColor: Color(0xFFC3D3D9),
                          strokeWidth: 2.5,
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
