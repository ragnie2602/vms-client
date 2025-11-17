import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';

class MWE {
  const MWE();
}

class MWECloseWindow extends MWE {
  final int windowId;

  const MWECloseWindow(this.windowId);
}

class MWEProfileReady extends MWE {
  const MWEProfileReady();
}

class MWERestoreMonitorMode extends MWE {
  final ViewMode viewMode;
  final bool isDefaultMode;
  final List<int> id;

  const MWERestoreMonitorMode(this.viewMode, this.isDefaultMode, this.id);
}

class MWESignOut extends MWE {
  const MWESignOut();
}
