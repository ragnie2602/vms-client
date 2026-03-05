import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';
import 'package:vms_flutter_client/screens/camera_configuration/widgets/alarm_config_popup/alarm_config_popup.dart';

class SettingNotificationView extends StatefulWidget {
  const SettingNotificationView({super.key});

  @override
  State<SettingNotificationView> createState() =>
      _SettingNotificationViewState();
}

class _SettingNotificationViewState extends State<SettingNotificationView> {
  final _intervalController = TextEditingController(text: '10');
  String _selectedUnit = 'Giây';

  // Notification config data - loaded from SharedPreferences
  List<_NotificationConfigItem> _configItems = [];

  @override
  void initState() {
    super.initState();
    _loadConfigFromLocal();
  }

  void _loadConfigFromLocal() {
    // Load danh sách loại sự kiện từ SharedPreferences
    final typeEventsJson = AppData.instance.read<String>(
      AppKeys.SP_TYPE_EVENT_DETECT,
    );
    // Load cấu hình thông báo từ SharedPreferences
    final notificationSettingJson = AppData.instance.read<String>(
      AppKeys.SP_NOTIFICATION_SETTING,
    );

    NotificationSettingEntity? notificationSetting;
    if (notificationSettingJson != null) {
      notificationSetting = NotificationSettingEntity.fromJson(
        json.decode(notificationSettingJson),
      );
      // Cập nhật giá trị interval từ cấu hình đã lưu
      if (notificationSetting.cooldownValue != null) {
        _intervalController.text = notificationSetting.cooldownValue.toString();
      }
      if (notificationSetting.cooldownUnit != null) {
        _selectedUnit = notificationSetting.cooldownUnit == 'SECOND'
            ? 'Giây'
            : 'Phút';
      }
    }

    if (typeEventsJson != null) {
      final List<dynamic> jsonList = json.decode(typeEventsJson);
      final typeEvents = jsonList
          .map((e) => TypeEventDetectEntity.fromJson(e))
          .toList();

      setState(() {
        _configItems = typeEvents.map((typeEvent) {
          // Tìm cấu hình tương ứng trong notificationSetting
          final eventConfig = notificationSetting?.eventConfigs?.firstWhere(
            (config) => config.eventType == typeEvent.typeName,
            orElse: () =>
                EventConfigEntity(popupEnabled: false, soundEnabled: false),
          );

          return _NotificationConfigItem(
            label: typeEvent.name ?? typeEvent.typeName ?? '',
            typeName: typeEvent.typeName,
            autoPopup: eventConfig?.popupEnabled ?? false,
            sound: eventConfig?.soundEnabled ?? false,
          );
        }).toList();
      });
    }
  }

  @override
  void dispose() {
    _intervalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section 1: CÀI ĐẶT CHUNG ──
          Text(
            "CÀI ĐẶT CHUNG",
            style: AppTypography.style(
              16,
              fontWeight: FontWeight.w700,
              color: AppColors.grey0F172A,
            ),
          ),
          const SizedBox(height: 20),
          _buildIntervalRow(),

          const SizedBox(height: 25),

          // ── Section 2: CẤU HÌNH HIỂN THỊ THÔNG BÁO ──
          Text(
            "CẤU HÌNH HIỂN THỊ THÔNG BÁO",
            style: AppTypography.style(
              16,
              fontWeight: FontWeight.w700,
              color: AppColors.grey0F172A,
            ),
          ),
          const SizedBox(height: 16),
          _buildNotificationConfigTable(),

          const SizedBox(height: 50),

          // ── Buttons ──
          SizedBox(
            width: 700,
            child: Row(
              spacing: 12,
              children: <Widget>[
                _buildButton(
                  title: "Hủy",
                  borderColor: AppColors.greyE2E8F0,
                  bgColor: AppColors.white,
                  textColor: AppColors.black,
                  onPressed: _onCancel,
                ),
                _buildButton(
                  title: "Lưu",
                  borderColor: AppColors.secondary,
                  bgColor: AppColors.secondary,
                  textColor: AppColors.white,
                  onPressed: _onSave,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Row: "Giãn cách bật Popup cảnh báo (i)   [10] [Giây v]"
  Widget _buildIntervalRow() {
    return SizedBox(
      width: 700,
      child: Row(
        children: [
          TitleWithTooltip(
            title: 'Giãn cách bật Popup cảnh báo',
            tooltip: 'Khoảng thời gian tối thiểu giữa hai cửa sổ tự động',
          ),
          const Spacer(),

          Row(
            children: [
              SizedBox(
                width: 60,
                height: 40,
                child: TextField(
                  controller: _intervalController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                      borderSide: const BorderSide(color: AppColors.greyE2E8F0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                      borderSide: const BorderSide(color: AppColors.greyE2E8F0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                      borderSide: const BorderSide(color: AppColors.secondary),
                    ),
                  ),
                ),
              ),
              // Unit dropdown
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF8FAFC),
                  border: Border.all(color: AppColors.greyE2E8F0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedUnit,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: AppColors.grey64748B,
                    ),
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey64748B,
                    ),
                    items: ['Giây', 'Phút']
                        .map(
                          (unit) =>
                              DropdownMenuItem(value: unit, child: Text(unit)),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) setState(() => _selectedUnit = value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Table: Loại sự kiện | Cửa sổ tự động | Âm thanh
  Widget _buildNotificationConfigTable() {
    return Container(
      width: 700,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyE2E8F0),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          // Header row
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyF9FAFB.withValues(alpha: 0.5),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Loại sự kiện',
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey64748B,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Cửa sổ tự động',
                      style: AppTypography.style(
                        13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey64748B,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Âm thanh',
                      style: AppTypography.style(
                        13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey64748B,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.greyE2E8F0),

          // Data rows
          ...List.generate(_configItems.length, (index) {
            final item = _configItems[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          item.label,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: _buildCheckbox(
                            value: item.autoPopup,
                            onChanged: (val) {
                              setState(
                                () => _configItems[index].autoPopup = val,
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: _buildCheckbox(
                            value: item.sound,
                            onChanged: (val) {
                              setState(() => _configItems[index].sound = val);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (index < _configItems.length - 1)
                  const Divider(height: 1, color: AppColors.greyE2E8F0),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: value ? AppColors.secondary : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value ? AppColors.secondary : AppColors.greyD1D5DB,
            width: 1.5,
          ),
        ),
        child: value
            ? const Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }

  Widget _buildButton({
    required String title,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(color: borderColor, width: 1),
          textStyle: AppTypography.style(14, fontWeight: FontWeight.w700),
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text(title),
        ),
      ),
    );
  }

  void _onSave() {
    if (_intervalController.text.trim().isEmpty) {
      _intervalController.text = '10';
      setState(() => _selectedUnit = 'Giây');
    }
  }

  void _onCancel() {
    _intervalController.clear();
    setState(() => _selectedUnit = 'Giây');
  }
}

/// Model cho mỗi dòng trong bảng cấu hình
class _NotificationConfigItem {
  final String label;
  final String? typeName;
  bool autoPopup;
  bool sound;

  _NotificationConfigItem({
    required this.label,
    this.typeName,
    required this.autoPopup,
    required this.sound,
  });
}
