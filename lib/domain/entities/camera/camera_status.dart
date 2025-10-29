import 'dart:ui';

import 'package:vms_flutter_client/core/constants/colors.dart';

enum CameraStatus {
  all(-1),
  inactive(0),
  active(1);

  final int value;

  const CameraStatus(this.value);

  static CameraStatus fromValue(int value) {
    return CameraStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => CameraStatus.inactive,
    );
  }
}

enum CameraOnlineChecked { all, online, offline }

extension CameraStatusExt on CameraOnlineChecked {
  bool? get getValue {
    switch (this) {
      case CameraOnlineChecked.online:
        return true;
      case CameraOnlineChecked.offline:
        return false;
      default:
        return null;
    }
  }

  String getName() {
    switch (this) {
      case CameraOnlineChecked.online:
        return 'Online';
      case CameraOnlineChecked.offline:
        return 'Offline';
      default:
        return 'Tất cả';
    }
  }

  Color get contentColor {
    switch (this) {
      case CameraOnlineChecked.online:
        return AppColors.primary;
      default:
        return AppColors.grey6F767E;
    }
  }

  Color get bgColor {
    switch (this) {
      case CameraOnlineChecked.online:
        return AppColors.blueD7F1FF;
      default:
        return AppColors.scaffoldBgLight;
    }
  }
}
