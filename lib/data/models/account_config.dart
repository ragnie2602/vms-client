// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/app_data.dart';

class AccountConfig {
  final String videoFolder;
  final String snapshotFolder;

  // ignore: non_constant_identifier_names
  static String get ACCOUNT_CONFIG_SP_KEY =>
      '${AppData.instance.profile?.uid.join() ?? 'user'}_configurations';

  AccountConfig({required this.videoFolder, required this.snapshotFolder});
  factory AccountConfig.empty() => AccountConfig(videoFolder: '', snapshotFolder: '');

  static Future<AccountConfig?> current({bool bypassCache = false}) async {
    try {
      final json = bypassCache
          ? await AppData.instance.readNewest<String>(ACCOUNT_CONFIG_SP_KEY)
          : AppData.instance.read<String>(ACCOUNT_CONFIG_SP_KEY);

      if (json == null) return null;
      return AccountConfig.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateAndSave({String? videoFolder, String? snapshotFolder}) async {
    final newConfig = AccountConfig(
      videoFolder: videoFolder ?? this.videoFolder,
      snapshotFolder: snapshotFolder ?? this.snapshotFolder,
    );

    return await AppData.instance.save(ACCOUNT_CONFIG_SP_KEY, newConfig.toJson());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (videoFolder.isNotEmpty) 'videoFolder': videoFolder,
      if (snapshotFolder.isNotEmpty) 'snapshotFolder': snapshotFolder,
    };
  }

  String toJson() => json.encode(toMap());

  factory AccountConfig.fromMap(Map<String, dynamic> map) {
    return AccountConfig(
      videoFolder: map['videoFolder'] as String? ?? '',
      snapshotFolder: map['snapshotFolder'] as String? ?? '',
    );
  }
  factory AccountConfig.fromJson(String source) =>
      AccountConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}
