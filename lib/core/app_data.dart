import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  AppData._internal();
  static final AppData instance = AppData._internal();
  factory AppData() => instance;

  late final SharedPreferences _prefs;

  Future<void> init() async {
    SharedPreferences.setPrefix("");
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> save<T>(String key, T value) async {
    return switch (value) {
      bool value => _prefs.setBool(key, value),
      String value => _prefs.setString(key, value),
      int value => _prefs.setInt(key, value),
      double value => _prefs.setDouble(key, value),
      List<String> value => _prefs.setStringList(key, value),
      _ => throw Exception("Unsupported type"),
    };
  }

  T? read<T>(String key) {
    return _prefs.get(key) as T?;
  }
}
