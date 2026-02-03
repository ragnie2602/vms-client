class EndPoints {
  // Auth
  static const String baseAuth = '/api/auth';
  static const String authenticate = '/login';
  static const String changePassword = '/password';
  static const String logout = '/logout';
  static const String updateProfile = '/profile';

  // User management
  static const String baseUser = '/api/users';
  static const String resetPassword = '/password';

  // Map
  static const String baseMap = '/api/map';

  // AI Box
  static const String baseUrlAiBox = '/api/aiboxes';
  static String aiBoxDetail(int id) => '$baseUrlAiBox/$id';

  // Detect
  static const String baseDetect = '/api/event-display-config';
  static const String getListTypeEventDetect = '/$baseDetect/event-types';
  static const String getAvailableFields = '/$baseDetect/available-fields';
  static String eventDisplayConfigById(int id) => '$baseDetect/$id';
}
