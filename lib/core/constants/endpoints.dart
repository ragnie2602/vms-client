class EndPoints {
  // Auth
  static const String baseAuth = '/api/auth';
  static const String authenticate = '/login';
  static const String changePassword = '/password';
  static const String logout = '/logout';
  static const String updateProfile = '/profile';

  // Event
  static const String baseEvent = '/api/ai-events';
  static const String eventType = '$baseEvent/types';
  static const String searchEvent = '$baseEvent/search';

  // Map
  static const String baseMap = '/api/map';

  // User management
  static const String baseUser = '/api/users';
  static const String resetPassword = '/password';
}
