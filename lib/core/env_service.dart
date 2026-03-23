import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

class EnvService {
  static late final PackageInfo packageInfo;
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
    packageInfo = await PackageInfo.fromPlatform();
  }

  static String? read(String key) => dotenv.env[key];

  static String? get suggestedServerUrl => read('SUGGESTED_SERVER_URL');
  static int get platform => int.tryParse(read('PLATFORM') ?? '1') ?? 1;
  static String get appVersion => packageInfo.version;
  static String get buildNumber => packageInfo.buildNumber;
}
