enum UserStatus {
  active,
  deleted;

  const UserStatus();
  static UserStatus fromValue(String name) {
    return UserStatus.values.firstWhere(
      (status) => status.name == name,
      orElse: () => UserStatus.active,
    );
  }
}
