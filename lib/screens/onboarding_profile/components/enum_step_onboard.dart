enum StepOnboard {
  chooseConfig,
  confirm,
  initialize,
}
extension StepOnboardExtension on StepOnboard {
  int get index {
    switch (this) {
      case StepOnboard.chooseConfig:
        return 0;
      case StepOnboard.confirm:
        return 1;
      case StepOnboard.initialize:
        return 2;
    }
  }
  String get getName {
    switch (this) {
      case StepOnboard.chooseConfig:
        return 'Chọn cấu hình';
      case StepOnboard.confirm:
        return 'Xác nhận';
      case StepOnboard.initialize:
        return 'Khởi tạo';
    }
  }
}
