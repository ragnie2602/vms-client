import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/region_marker.dart';

class DetectionSettingDialog extends StatefulWidget {
  final String title;

  const DetectionSettingDialog({super.key, required this.title});

  @override
  State<DetectionSettingDialog> createState() => _DetectionSettingDialogState();
}

class _DetectionSettingDialogState extends State<DetectionSettingDialog> {
  bool on = true;
  bool recordEvent = false;
  bool sendWarning = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
        height: MediaQuery.heightOf(context) * 659.13 / 900,
        width: MediaQuery.widthOf(context) * 613 / 1600,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cài đặt ${widget.title.toLowerCase()}',
                    style: AppTypography.style(20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 210,
                          child: Text(
                            '${widget.title}:',
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          flex: 357,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Transform.rotate(
                              angle: math.pi,
                              child: Switch(
                                activeTrackColor: AppColors.blue005AA9,
                                activeThumbColor: AppColors.white,
                                inactiveTrackColor: AppColors.greyE4E4E4,
                                inactiveThumbColor: AppColors.white,
                                onChanged: (value) => setState(() => on = value),
                                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                                value: on,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 210,
                          child: Text(
                            'Độ nhạy:',
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          flex: 357,
                          child: SizedBox(
                            width: 270,
                            child: EventFilterDropdown<String>(
                              initialValue: 'Trung bình',
                              isDense: true,
                              items: ['Rất thấp', 'Thấp', 'Trung bình', 'Cao', 'Rất cao'],
                              onChanged: (_) {},
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              type: EventFilterDropdownType.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 210,
                          child: Text(
                            'Hành động:',
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          flex: 357,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: sendWarning,
                                    onChanged: (value) => setState(() => sendWarning = value!),
                                  ),
                                  Text(
                                    'Gửi cảnh báo',
                                    style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: recordEvent,
                                    onChanged: (value) => setState(() => recordEvent = value!),
                                  ),
                                  Text(
                                    'Ghi hình sự kiện',
                                    style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 210,
                            child: Text(
                              'Thiết lập vùng cảnh báo:',
                              style: AppTypography.style(14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            flex: 357,
                            child: Column(
                              children: [
                                Expanded(child: RegionMarker()),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.greyF2F4FA, width: 1),
                                    color: AppColors.yellowFFFBEB,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hướng dẫn',
                                        style: AppTypography.style(14, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '• Nhấn chuột trái để tạo điểm và vẽ vùng cảnh báo. Nhấn đúp chuột hoặc Enter để hoàn tất.',
                                        maxLines: 100,
                                        style: AppTypography.style(12, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton.outline(
                      label: 'Hủy',
                      onPressed: () => Navigator.pop(context, false),
                    ),
                  ),
                  const SizedBox(width: 31),
                  Expanded(
                    child: AppButton.filled(
                      label: 'Lưu',
                      onPressed: () => Navigator.pop(context, on),
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
