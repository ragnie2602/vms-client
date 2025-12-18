import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class CameraSelectionPopup extends StatefulWidget {
  final List<CameraEntity> cameras;
  final Function(CameraEntity) onCameraSelected;
  final VoidCallback onClose;
  final double? maxHeight;
  final double? maxWidth;

  const CameraSelectionPopup({
    super.key,
    required this.cameras,
    required this.onCameraSelected,
    required this.onClose,
    this.maxHeight,
    this.maxWidth,
  });

  @override
  State<CameraSelectionPopup> createState() => _CameraSelectionPopupState();
}

class _CameraSelectionPopupState extends State<CameraSelectionPopup> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: widget.maxWidth ?? 300,
          maxHeight: widget.maxHeight ?? 400,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: AppColors.grey92929D.withValues(alpha: 0.1),
              offset: Offset(0, 10),
            ),
          ],
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: widget.onClose,
                  icon: Icon(Icons.close, size: 20),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 8),
              child: SizedBox(
                height: 36,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Nhập tên camera',
                    hintStyle: AppTypography.style(
                      14,
                      color: Color(0xFF8F95B2),
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    prefixIcon: Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 16, left: 12),
                      child: SvgPicture.asset(AppAssets.icSearch),
                    ),
                    prefixIconConstraints: BoxConstraints.tight(
                      Size(20 + 16 + 12, 20),
                    ),
                    suffixIcon: ValueListenableBuilder(
                      valueListenable: searchController,
                      builder: (context, value, child) => value.text.isEmpty
                          ? const SizedBox.shrink()
                          : InkWell(
                              onTap: () => searchController.clear(),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: SvgPicture.asset(AppAssets.icClose),
                              ),
                            ),
                    ),
                    fillColor: Color(0xFFF2F4FA),
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.search,
                ),
              ),
            ),
            Flexible(
              child: ValueListenableBuilder(
                valueListenable: searchController,
                builder: (context, value, child) {
                  final cameras = widget.cameras
                      .where(
                        (camera) => removeDiacritics(
                          camera.name.toLowerCase(),
                        ).contains(removeDiacritics(value.text.toLowerCase())),
                      )
                      .toList();

                  if (cameras.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Không tìm thấy camera',
                          style: AppTypography.style(
                            14,
                            color: AppColors.grey64748B,
                          ),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        _cameraItem(cameras[index]),
                    itemCount: cameras.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraItem(CameraEntity camera) {
    return InkWell(
      onTap: () => widget.onCameraSelected(camera),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          children: [
            Container(
              height: 35,
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                AppAssets.icVideoOn,
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    camera.name,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    camera.isOnline ? "Đang hoạt động" : "Dừng hoạt động",
                    style: AppTypography.style(
                      12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey64748B,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            SizedBox.square(
              dimension: 8,
              child: CircleAvatar(
                backgroundColor: camera.isOnline
                    ? Color(0xFF21CCC3)
                    : Color(0xFF64748B),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
