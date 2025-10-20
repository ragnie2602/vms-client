enum ShareCameraRole { VIEW, FULL }

extension ShareCameraRoleExtension on ShareCameraRole {
  static ShareCameraRole getShareCameraRole(int role) {
    switch (role) {
      case 0:
        return ShareCameraRole.VIEW;
      case 1:
        return ShareCameraRole.FULL;
      default:
        return ShareCameraRole.VIEW;
    }
  }

  static int getShareCameraRoleValue(ShareCameraRole role) {
    switch (role) {
      case ShareCameraRole.VIEW:
        return 0;
      case ShareCameraRole.FULL:
        return 1;
    }
  }
}
