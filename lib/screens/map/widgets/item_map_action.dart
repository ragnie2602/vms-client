import 'package:vms_flutter_client/core/constants/assets.dart';

enum ItemMapAction { edit, remove }

extension ItemGroupActionExt on ItemMapAction {
  String get getName {
    switch (this) {
      case ItemMapAction.edit:
        return 'Sửa';
      case ItemMapAction.remove:
        return 'Xóa';
    }
  }

  String get getIcon {
    switch (this) {
      case ItemMapAction.edit:
        return AppAssets.icEdit;
      case ItemMapAction.remove:
        return AppAssets.icDelete;
    }
  }
}
