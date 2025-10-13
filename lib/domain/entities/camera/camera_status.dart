import 'dart:ui';

import 'package:vms_flutter_client/core/constants/colors.dart';

enum CameraStatus {
  inactive(0),
  active(1);

  final int value;

  const CameraStatus(this.value);

  static CameraStatus fromValue(int value) {
    return CameraStatus.values.firstWhere((status) => status.value == value, orElse: () => CameraStatus.inactive);
  }
}

extension CameraStatusExt on CameraStatus {
  String getName() {
    switch (this) {
      case CameraStatus.active:
        return 'Online';
      default:
        return 'Offline';
    }
  }

  Color get contentColor {
    switch (this) {
      case CameraStatus.active:
        return AppColors.primary;
      default:
        return AppColors.grey6F767E;
    }
  }

  Color get bgColor {
    switch (this) {
      case CameraStatus.active:
        return AppColors.blueD7F1FF;
      default:
        return AppColors.scaffoldBgLight;
    }
  }
}

extension CameraStatusExt on CameraStatus {
  String getName() {
    switch (this) {
      case CameraStatus.active:
        return 'Online';
      default:
        return 'Offline';
    }
  }

  Color get contentColor {
    switch (this) {
      case CameraStatus.active:
        return AppColors.primary;
      default:
        return AppColors.grey6F767E;
    }
  }

  Color get bgColor {
    switch (this) {
      case CameraStatus.active:
        return AppColors.blueD7F1FF;
      default:
        return AppColors.scaffoldBgLight;
    }
  }
}
