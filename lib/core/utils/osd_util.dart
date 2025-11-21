import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/osd.dart';

class OsdUtil {
  static OSDPosition getOSDPositions() {
    final key =
        "${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}_osd";

    final data = AppData.instance.read(key) ?? 2;
    return OSDPosition.values.firstWhere((e) => e.value == data);
  }

  static void saveOSDPositions(OSDPosition position) {
    final key =
        "${AppData.instance.read(AppKeys.SP_SERVER_KEY)}|${AppData.instance.read(AppKeys.SP_USERNAME_KEY)}_osd";

    AppData.instance.save(key, position.value);
  }
}
