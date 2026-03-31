import '../env_service.dart';

class EndPoints {
  // --- Domains ---
  static const String devDomain = 'https://vs.vivas.vn';
  static const String stagDomain = 'http://10.3.3.162:8080';
  static const String prodDomain = 'http://123.25.70.15:8787';

  // --- Base URL ---
  static String baseUrl = EnvService.suggestedServerUrl ?? stagDomain;

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
  static const String alarmSound = '/api/cameras/ai-configs/sounds';

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

  // Notification
  static const String notificationSetting = '/api/notification-settings';
  static String eventDisplayConfigByName(String typeName) =>
      '$baseDetect/$typeName';

  // Object Type
  static const String baseObjectType = '/api/object-types';
  static const String objectTypeIcons = '$baseObjectType/icons';

  // Subject Group
  static const String baseSubjectGroup = '/api/subject-groups';
   static String checkSubjectGroup(int id) => '$baseSubjectGroup/$id/contains';
  // Subject

  // Subject types
  static const String baseSubjectType = '/api/object-types';

  // Profiles
  static const String baseProfiles = '/api/profiles';
  static  String setupProfile(int id) => '$baseProfiles/setup/$id';
}
