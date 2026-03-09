import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';
import 'package:vms_flutter_client/screens/camera_configuration/widgets/alarm_config_popup/alarm_config_popup.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/notification/notification_setting_bloc.dart';

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
  int? _notificationSettingId;

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
      _notificationSettingId = notificationSetting.id;
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
          .map((e) => EventType.fromJson(e))
          .toList();

      setState(() {
        _configItems = typeEvents.map((typeEvent) {
          // Tìm cấu hình tương ứng trong notificationSetting
          final eventConfig = notificationSetting?.eventConfigs?.firstWhere(
            (config) => config.eventType == typeEvent.eventKey,
            orElse: () =>
                EventConfigEntity(popupEnabled: false, soundEnabled: false),
          );

          return _NotificationConfigItem(
            id: eventConfig?.id,
            label: typeEvent.name,
            typeName: typeEvent.eventKey,
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
              IntrinsicWidth(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 60,
                    maxWidth: 200,
                    minHeight: 40,
                    maxHeight: 40,
                  ),
                  child: TextField(
                    controller: _intervalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      PositiveIntegerFormatter(),
                    ],
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
                              setState(() {
                                _configItems[index].autoPopup = val;
                                // Nếu tắt cửa sổ tự động thì tắt âm thanh
                                if (!val) _configItems[index].sound = val;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: _buildCheckbox(
                            value: item.sound,
                            disabled: _configItems[index].autoPopup == false,
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
    bool disabled = false,
  }) {
    return InkWell(
      onTap: !disabled ? () => onChanged(!value) : null,
      borderRadius: BorderRadius.circular(4),
      mouseCursor: disabled ? SystemMouseCursors.forbidden : null,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: value ? AppColors.secondary : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value
                ? AppColors.secondary
                : !disabled
                ? AppColors.greyD1D5DB
                : AppColors.greyEFEFEF,
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
    final notificationSetting = NotificationSettingEntity(
      id: _notificationSettingId,
      cooldownUnit: _selectedUnit == 'Giây' ? 'SECOND' : 'MINUTE',
      cooldownValue: int.parse(_intervalController.text),
      eventConfigs: _configItems.map((e) => e.toEntity()).toList(),
    );
    context.read<NotificationBloc>().add(
      UpdateNotificationSettingEvent(notificationSetting: notificationSetting),
    );
  }

  void _onCancel() {
    // Reset lại tất cả giá trị về trạng thái đã lưu gần nhất trong SharedPreferences
    _loadConfigFromLocal();
  }
}

/// Model cho mỗi dòng trong bảng cấu hình
class _NotificationConfigItem {
  final String label;
  final String? typeName;
  bool autoPopup;
  bool sound;
  final int? id;

  _NotificationConfigItem({
    required this.label,
    this.typeName,
    required this.autoPopup,
    required this.sound,
    this.id,
  });

  EventConfigEntity toEntity() {
    return EventConfigEntity(
      id: id,
      eventType: typeName,
      popupEnabled: autoPopup,
      soundEnabled: sound,
    );
  }
}

class PositiveIntegerFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 1. Cho phép xóa rỗng Textfield
    if (newValue.text.isEmpty) return newValue;

    // 2. Chỉ can thiệp nếu chuỗi bắt đầu bằng '0' (Tối ưu hiệu năng, bỏ qua các phím gõ hợp lệ)
    if (newValue.text.startsWith('0')) {
      // Xóa tất cả các số 0 ở đầu
      String newString = newValue.text.replaceFirst(RegExp(r'^0+'), '');

      // Nếu xóa xong mà rỗng (nghĩa là người dùng vừa gõ phím '0' đầu tiên), thì chặn lại
      if (newString.isEmpty) return oldValue;

      // Tính toán lại vị trí con trỏ (lùi lại bằng đúng số lượng số 0 vừa bị xóa)
      int zerosRemoved = newValue.text.length - newString.length;
      int newSelectionOffset = newValue.selection.baseOffset - zerosRemoved;

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newSelectionOffset.clamp(0, newString.length)),
      );
    }

    // 3. Nếu là số hợp lệ bình thường, cho qua và giữ nguyên vị trí con trỏ
    return newValue;
  }
}
