import 'dart:ui';

import 'package:vms_flutter_client/core/constants/colors.dart';

enum RoleStatus {
  active(0, 'Hoạt động', AppColors.greenECFFD7, AppColors.green03BF00),
  pending(1, 'Tạm dừng', AppColors.greyF8F9FE, AppColors.grey6F767E);

  final int value;
  final String label;
  final Color bgColor;
  final Color textColor;

  const RoleStatus(this.value, this.label, this.bgColor, this.textColor );

  static RoleStatus fromValue(int value) {
    return RoleStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => RoleStatus.active,
    );
  }

  static RoleStatus fromString(String value) {
    return RoleStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => RoleStatus.active,
    );
  }
}