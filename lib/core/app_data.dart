import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';

class AppData {
  AppData._internal();
  static final AppData instance = AppData._internal();
  factory AppData() => instance;

  MyProfile? profile;

  late SharedPreferences _prefs;
  late SharedPreferencesAsync _prefsAsync;

  Future<void> init() async {
    SharedPreferences.setPrefix("");
    _prefs = await SharedPreferences.getInstance();
    _prefsAsync = SharedPreferencesAsync();
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

  // Đọc trực tiếp từ file thay vì từ cache
  Future<T?> readNewest<T>(String key) async {
    return switch (T) {
      _ when T == bool => await _prefsAsync.getBool(key) as T?,
      _ when T == String => await _prefsAsync.getString(key) as T?,
      _ when T == int => await _prefsAsync.getInt(key) as T?,
      _ when T == double => await _prefsAsync.getDouble(key) as T?,
      _ when T == (List<String>) => await _prefsAsync.getStringList(key) as T?,
      _ => throw Exception("Unsupported type ${T.runtimeType}"),
    };
  }
}
