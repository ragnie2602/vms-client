enum UserType {
  user(0),
  admin(1),
  superadmin(2),
  sysadmin(3),
  agent(4),
  admin_client(5);

  final int value;
  const UserType(this.value);
  static UserType fromValue(int value) {
    return UserType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => UserType.admin,
    );
  }
}
