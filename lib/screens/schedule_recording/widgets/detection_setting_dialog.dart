import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/region_marker.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class DetectionSettingDialog extends StatefulWidget {
  final DetectionSettingDialogType type;

  const DetectionSettingDialog({super.key, required this.type});

  @override
  State<DetectionSettingDialog> createState() => _DetectionSettingDialogState();
}

class _DetectionSettingDialogState extends State<DetectionSettingDialog> {
  final GlobalKey<RegionMarkerState> regionMarkerKey = GlobalKey<RegionMarkerState>();
  final GlobalKey<LineMarkerState> lineMarkerKey = GlobalKey<LineMarkerState>();

  bool on = true;
  bool recordEvent = false;
  bool sendWarning = true;

  TextEditingController? timeoutController;

  double _timeoutFieldWidth = 0;

  @override
  void initState() {
    super.initState();
    timeoutController = TextEditingController()..text = '15';

    final textStyle = AppTypography.style(14, fontWeight: FontWeight.w600);
    final painter = TextPainter(
      text: TextSpan(text: '000', style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    _timeoutFieldWidth = painter.width + 32;
  }

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
                    'Cài đặt ${widget.type.title.toLowerCase()}',
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
                child: CustomTable(
                  data: CustomTableData(
                    columnFlexes: [210, 357],
                    data: [
                      [
                        Text(
                          '${widget.type.title}:',
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                        Align(
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
                      ],
                      [
                        Text(
                          'Độ nhạy:',
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: MediaQuery.widthOf(context) * 270 / 1600,
                            child: EventFilterDropdown<String>(
                              initialValue: 'Trung bình',
                              isDense: true,
                              items: ['Rất thấp', 'Thấp', 'Trung bình', 'Cao', 'Rất cao'],
                              onChanged: (_) {},
                              padding: EdgeInsets.only(left: 0, right: 10, top: 6, bottom: 6),
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                      [
                        Text(
                          'Hành động:',
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: Checkbox(
                                    activeColor: AppColors.secondary,
                                    onChanged: (value) => setState(() => sendWarning = value!),
                                    side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                                    value: sendWarning,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Gửi cảnh báo',
                                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: Checkbox(
                                    activeColor: AppColors.secondary,
                                    onChanged: (value) => setState(() => recordEvent = value!),
                                    side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                                    value: recordEvent,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Ghi hình sự kiện',
                                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ],
                      if (widget.type == DetectionSettingDialogType.intrusion) ...[
                        [
                          Text(
                            'Thời gian:',
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Text(
                                'Thời gian xuất hiện trong khu vực quá ',
                                style: AppTypography.style(14, isItalic: true),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: _timeoutFieldWidth,
                                child: TextField(
                                  controller: timeoutController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                                    ),
                                    constraints: BoxConstraints(),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 15,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: AppTypography.style(14, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(s)',
                                style: AppTypography.style(14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ],
                      if (widget.type == DetectionSettingDialogType.lineCrossing) ...[
                        [
                          Text(
                            'Hướng di chuyển:',
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: MediaQuery.widthOf(context) * 270 / 1600,
                              child: EventFilterDropdown<String>(
                                initialValue: 'A -> B',
                                isDense: true,
                                items: ['A -> B', 'B -> A'],
                                onChanged: (_) {},
                                padding: EdgeInsets.only(left: 0, right: 10, top: 6, bottom: 6),
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                      [
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.type == DetectionSettingDialogType.lineCrossing ? 30 : 0,
                          ),
                          child: Text(
                            'Thiết lập vùng cảnh báo:',
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: widget.type == DetectionSettingDialogType.lineCrossing
                                  ? LineMarker(key: lineMarkerKey)
                                  : RegionMarker(key: regionMarkerKey),
                            ),
                            const SizedBox(height: 10),
                            if (widget.type == DetectionSettingDialogType.lineCrossing)
                              const SizedBox(height: 20),
                            InkWell(
                              onTap: _clearRegion,
                              child: Text(
                                'Xóa vùng cảnh báo',
                                style: AppTypography.style(
                                  14,
                                  color: AppColors.redFF2F2F,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.redFF2F2F,
                                  fontWeight: FontWeight.w400,
                                  isItalic: true,
                                ),
                              ),
                            ),
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
                                  const SizedBox(height: 8),
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
                      ],
                    ],
                    rowFlexes: _getRowFlexes(),
                  ),
                  rowSpacing: 10,
                  verticalAlignments: [
                    CrossAxisAlignment.center,
                    CrossAxisAlignment.center,
                    CrossAxisAlignment.start,
                    CrossAxisAlignment.start,
                    CrossAxisAlignment.start,
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

  void _clearRegion() {
    if (widget.type == DetectionSettingDialogType.lineCrossing) {
      lineMarkerKey.currentState?.clearRegion();
    } else {
      regionMarkerKey.currentState?.clearRegion();
    }
  }

  _getRowFlexes() {
    switch (widget.type) {
      case DetectionSettingDialogType.intrusion:
      case DetectionSettingDialogType.lineCrossing:
        return [0, 0, 0, 0, 1];
      default:
        return [0, 0, 0, 1];
    }
  }
}

enum DetectionSettingDialogType {
  dangerousObject,
  face,
  intrusion,
  lineCrossing,
  lostObject,
  motion;

  String get title {
    switch (this) {
      case DetectionSettingDialogType.motion:
        return 'Phát hiện chuyển động';
      case DetectionSettingDialogType.intrusion:
        return 'Phát hiện xâm nhập';
      case DetectionSettingDialogType.face:
        return 'Phân biệt đối tượng';
      case DetectionSettingDialogType.lineCrossing:
        return 'Phát hiện vượt hàng rào ảo';
      case DetectionSettingDialogType.lostObject:
        return 'Phát hiện vật bị bỏ quên';
      case DetectionSettingDialogType.dangerousObject:
        return 'Phát hiện vật nguy hiểm';
    }
  }
}
