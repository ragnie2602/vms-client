enum UserStatus {
  inactive(0),
  active(1),
  agencreate(2);

  final int value;
  const UserStatus(this.value);
  static UserStatus fromValue(int value) {
    return UserStatus.values.firstWhere(
      (type) => type.value == value,
      orElse: () => UserStatus.inactive,
    );
  }
}
