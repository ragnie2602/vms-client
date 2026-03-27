enum StepLicense { inputCode, reviewInfo, complete }

extension StepLicenseExtension on StepLicense {
  int get getIndex {
    switch (this) {
      case StepLicense.inputCode:
        return 0;
      case StepLicense.reviewInfo:
        return 1;
      case StepLicense.complete:
        return 2;
    }
  }

  String get getName {
    switch (this) {
      case StepLicense.inputCode:
        return 'Nhập mã';
      case StepLicense.reviewInfo:
        return 'Kiểm tra thông tin';
      case StepLicense.complete:
        return 'Hoàn tất';
    }
  }
}
