import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class EventDetailDialog extends StatefulWidget {
  const EventDetailDialog({super.key});

  @override
  State<EventDetailDialog> createState() => _EventDetailDialogState();
}

class _EventDetailDialogState extends State<EventDetailDialog> with TickerProviderStateMixin {
  late TabController tabController;

  bool imageMode = true;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: MediaQuery.heightOf(context) * 624 / 900,
        width: MediaQuery.widthOf(context) * 980 / 1600,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'Chi tiết sự kiện',
                    style: AppTypography.style(20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CustomTabBar(controller: tabController),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 555,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      Align(alignment: Alignment.topCenter, child: _imageTab()),
                                      Align(alignment: Alignment.topCenter, child: _videoTab()),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Ghi chú:',
                                  style: AppTypography.style(14, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 12),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: BorderSide(color: AppColors.greyE2E8F0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: BorderSide(color: AppColors.greyE2E8F0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: BorderSide(color: AppColors.secondary),
                                      ),
                                      hintStyle: AppTypography.style(
                                        14,
                                        color: AppColors.grey92929D,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Nhập ghi chú',
                                    ),
                                    expands: true,
                                    maxLines: null,
                                    textAlignVertical: TextAlignVertical.top,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: AppButton.outline(
                                        borderColor: AppColors.greyE2E8F0,
                                        label: 'Hủy',
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: AppButton.filled(
                                        label: 'Lưu',
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 365,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.greyE2E8F0),
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.greyF2F4FA,
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Phát hiện xâm nhập',
                                    style: AppTypography.style(16, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTable(
                                    columnSpacing: 10,
                                    data: CustomTableData(
                                      columnFlexes: [0, 1],
                                      data: [
                                        [
                                          SvgPicture.asset(AppAssets.icTimeCircle, height: 20),
                                          Text(
                                            '20:30 20/12/2025',
                                            style: AppTypography.style(
                                              16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                        [
                                          SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                                          Text(
                                            'Camera cổng 1',
                                            style: AppTypography.style(
                                              16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                        [
                                          SvgPicture.asset(AppAssets.icLocation2, height: 20),
                                          Text(
                                            'Cổng 1',
                                            style: AppTypography.style(
                                              16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                    rowSpacing: 8,
                                    verticalAlignments: [
                                      CrossAxisAlignment.center,
                                      CrossAxisAlignment.center,
                                      CrossAxisAlignment.center,
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageTab() {
    return Image.network(
      'https://assets.nintendo.com/image/upload/q_auto/f_auto/store/software/switch2/70010000105851/8787627be7f26ae7984456ffd9af17bea845032cebbf59fe6eeb596dea6bb20e',
      fit: BoxFit.contain,
    );
  }

  Widget _videoTab() {
    return Image.network(
      'https://cdn.wikimg.net/en/hkwiki/images/5/57/SoSpromo1.jpg',
      fit: BoxFit.contain,
    );
  }
}

class _CustomTabBar extends StatefulWidget {
  final TabController controller;

  const _CustomTabBar({required this.controller});

  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ink(
          decoration: BoxDecoration(
            border: widget.controller.index == 0 ? null : Border.all(color: AppColors.greyF2F4FA),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3),
              topLeft: Radius.circular(3),
            ),
            color: widget.controller.index == 0 ? AppColors.secondary : AppColors.greyFBFBFB,
          ),
          child: InkWell(
            onTap: () => widget.controller.animateTo(0),
            borderRadius: BorderRadius.circular(4),
            hoverColor: widget.controller.index == 0
                ? AppColors.secondary.withOpacity(0.9)
                : AppColors.greyF2F4FA.withOpacity(0.5),
            splashColor: widget.controller.index == 0
                ? Colors.white.withOpacity(0.2)
                : AppColors.grey64748B.withOpacity(0.1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.icImage,
                    color: widget.controller.index == 0 ? Colors.white : AppColors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Ảnh sự kiện',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: widget.controller.index == 0 ? Colors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Ink(
          decoration: BoxDecoration(
            border: widget.controller.index == 1 ? null : Border.all(color: AppColors.greyF2F4FA),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(3),
              topRight: Radius.circular(3),
            ),
            color: widget.controller.index == 1 ? AppColors.secondary : AppColors.greyFBFBFB,
          ),
          child: InkWell(
            onTap: () => widget.controller.animateTo(1),
            borderRadius: BorderRadius.circular(4),
            hoverColor: widget.controller.index == 1
                ? AppColors.secondary.withOpacity(0.9)
                : AppColors.greyF2F4FA.withOpacity(0.5),
            splashColor: widget.controller.index == 1
                ? Colors.white.withOpacity(0.2)
                : AppColors.grey64748B.withOpacity(0.1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.icVideoOn,
                    color: widget.controller.index == 1 ? Colors.white : AppColors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Video ghi hình',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: widget.controller.index == 1 ? Colors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueD7E5F1,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
              side: BorderSide(color: AppColors.secondary),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.icDownloadFile, color: AppColors.secondary),
              const SizedBox(width: 8),
              Text(
                'Tải xuống',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
