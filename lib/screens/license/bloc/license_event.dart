import 'package:vms_flutter_client/core/base_bloc.dart';

abstract class LicenseEvent extends BaseEvent {
  const LicenseEvent();
}

class CheckCurrentLicenseEvent extends LicenseEvent {
  const CheckCurrentLicenseEvent();
}