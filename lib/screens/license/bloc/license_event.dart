import 'package:vms_flutter_client/core/base_bloc.dart';

abstract class LicenseEvent extends BaseEvent {
  const LicenseEvent();
}

class CheckCurrentLicenseEvent extends LicenseEvent {
  const CheckCurrentLicenseEvent();
}

class PreviewLicenseEvent extends LicenseEvent {
  final String licenseKey;
  const PreviewLicenseEvent(this.licenseKey);
}