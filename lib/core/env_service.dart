import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static String? read(String key) => dotenv.env[key];

  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'http://ipcam.vivas.vn:8888';
  static String get authenticateEndpoint => dotenv.env['AUTHENTICATE_ENDPOINT'] ?? '/vt/r/101';
  
  static String get socketBaseUrl => dotenv.env['SOCKET_BASE_URL'] ?? 'http://localhost:3000';
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';
  static int get platform => int.tryParse(dotenv.env['PLATFORM'] ?? '1') ?? 1;

  static String get authenticateUrl => '$apiBaseUrl$authenticateEndpoint';
}
