import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';

class MobileCameraItem extends StatefulWidget {
  final CameraEntity camera;

  const MobileCameraItem(this.camera, {super.key});

  @override
  State<MobileCameraItem> createState() => _MobileCameraItemState();
}

class _MobileCameraItemState extends State<MobileCameraItem> {
  late Future<String> thumbnailPath;

  @override
  void initState() {
    super.initState();
    thumbnailPath = getTemporaryDirectory().then((value) => '${value.path}/${widget.camera.camId}');
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 345 / 200,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.black),
        margin: const EdgeInsets.symmetric(vertical: 7.5),
        child: Stack(
          children: [
            FutureBuilder(
              future: thumbnailPath,
              builder: (context, snapshot) {
                final unhappyCaseWidget = Stack(
                  children: [
                    Opacity(
                      opacity: 0.82,
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.logoFull,
                          width: MediaQuery.widthOf(context) * 260 / 375,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.black.withValues(alpha: 0.45),
                        ),
                      ),
                    ),
                  ],
                );

                return snapshot.data != null
                    ? Positioned.fill(
                        child: Image.file(
                          File(snapshot.data!),
                          errorBuilder: (context, error, stackTrace) => unhappyCaseWidget,
                        ),
                      )
                    : unhappyCaseWidget;
              },
            ),
            InkWell(
              onTap: () async {
                final path = await context.pushNamed<String?>(
                  Routes.cameraDetail.name,
                  extra: CameraDetailScreenArgs(data: widget.camera),
                );

                if (path != null) {
                  await FileImage(File(path)).evict();
                  setState(() {});
                }
              },
              child: Center(
                child: widget.camera.isOnline
                    ? SvgPicture.asset(
                        AppAssets.icPlay01,
                        width: MediaQuery.widthOf(context) * 50 / 375,
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.icVideoOffline,
                            color: AppColors.white,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Camera đang ngoại tuyến',
                            style: AppTypography.style(
                              13,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Positioned(
              bottom: 7,
              left: 15,
              right: 15,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.camera.name,
                      style: AppTypography.style(
                        13,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppAssets.tabSettings,
                      color: AppColors.white,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
