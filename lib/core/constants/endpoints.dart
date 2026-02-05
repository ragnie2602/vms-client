class EndPoints {
  // Auth
  static const String baseAuth = '/api/auth';
  static const String authenticate = '/login';
  static const String changePassword = '/password';
  static const String logout = '/logout';
  static const String updateProfile = '/profile';

  // Event
  static const String baseEvent = '/api/ai-events';
  static const String configEventDisplay = '$baseEvent/config';
  static const String eventType = '$baseEvent/types';
  static const String exportEvent = '$baseEvent/export';
  static const String searchEvent = '$baseEvent/search';

  // Map
  static const String baseMap = '/api/map';

  // Camera
  static const String cameraAiConfig = '/api/cameras/ai-configs';

  // User management
  static const String baseUser = '/api/users';
  static const String resetPassword = '/password';

  // AI Box
  static const String baseUrlAiBox = '/api/aiboxes';
  static String aiBoxDetail(int id) => '$baseUrlAiBox/$id';

  // Detect
  static const String baseDetect = '/api/event-display-config';
  static const String getListTypeEventDetect = '/$baseDetect/event-types';
  static const String getAvailableFields = '/$baseDetect/available-fields';
  static String eventDisplayConfigById(int id) => '$baseDetect/$id';
}
