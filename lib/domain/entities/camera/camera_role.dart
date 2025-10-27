enum CameraRole {
  view(0),
  full(1);

  final int value;

  const CameraRole(this.value);

  static CameraRole fromValue(int value) {
    return CameraRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => CameraRole.view,
    );
  }
}
