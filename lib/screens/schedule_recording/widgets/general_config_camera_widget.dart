import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/item_camera_widget.dart';

class GeneralConfigCameraWidget extends StatelessWidget {
  const GeneralConfigCameraWidget({super.key, required this.camera});
  final CameraEntity camera;
  @override
  Widget build(BuildContext context) {
    final subStreamUrl =
        camera.stream.streamLinks
            .firstWhereOrNull((e) => e.isMainStream == false)
            ?.originStream ??
        '';
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LineInforWidget(title: 'Tên camera:', content: camera.name),
          LineInforWidget(
            title: 'Địa chỉ RTSP:',
            content: camera.stream.userOriginAddedUrl,
          ),
          subStreamUrl.isNotEmpty
              ? LineInforWidget(
                  title: 'Địa chỉ luồng phụ:',
                  content: subStreamUrl,
                )
              : const SizedBox(),
          LineInforWidget(
            title: 'Trạng thái kết nối',
            content: camera.isOnline ? 'Online' : 'Offline',
            isOnline: camera.isOnline,
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            height: 1,
            width: double.infinity,
            color: AppColors.greyE2E8F0,
          ),
          // lấy thông tin từ server
        ],
      ),
    );
  }
}

class LineInforWidget extends StatelessWidget {
  const LineInforWidget({
    super.key,
    required this.title,
    required this.content,
    this.isOnline,
  });
  final String title;
  final String content;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 6),
              child: Text(
                title,
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (isOnline != null) ...[
            Expanded(
              flex: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CameraStatusWidget(isOnline: isOnline!),
                  Spacer(),
                ],
              ),
            ),
          ] else ...[
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
