import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/screens/event/components/custom_tab_bar.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';

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
        height: MediaQuery.heightOf(context) * 694 / 900,
        width: MediaQuery.widthOf(context) * 1142 / 1600,
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
                padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTabBar(
                      controller: tabController,
                      tabs: const ['Ảnh sự kiện', 'Video ghi hình'],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyF2F4FA, width: 1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 794,
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Align(alignment: Alignment.topCenter, child: _imageTab()),
                                  Align(alignment: Alignment.topCenter, child: _videoTab()),
                                ],
                              ),
                            ),
                            const SizedBox(width: 29),
                            Expanded(
                              flex: 248,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Table(
                                      columnWidths: const {
                                        0: IntrinsicColumnWidth(),
                                        1: FlexColumnWidth(),
                                      },
                                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                      children: [
                                        TableRow(
                                          children: [
                                            Text(
                                              'Loại sự kiện: ',
                                              style: AppTypography.style(
                                                16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child: Text(
                                                'Instrution detection',
                                                style: AppTypography.style(
                                                  16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              'Time:',
                                              style: AppTypography.style(
                                                16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child: Text(
                                                DateTime.now().format('HH:mm dd/MM/yyyy'),
                                                style: AppTypography.style(
                                                  16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              'Thiết bị:',
                                              style: AppTypography.style(
                                                16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child: Text(
                                                'Camera cổng 1',
                                                style: AppTypography.style(
                                                  16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              'Vị trí:',
                                              style: AppTypography.style(
                                                16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child: Text(
                                                'Cổng 1',
                                                style: AppTypography.style(
                                                  16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Ghi chú:',
                                      style: AppTypography.style(16, fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton.outline(
                          borderColor: AppColors.greyE2E8F0,
                          label: 'Hủy',
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 16),
                        AppButton.filled(label: 'Lưu', onPressed: () => Navigator.pop(context)),
                      ],
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
