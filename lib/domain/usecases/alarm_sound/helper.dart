// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io' hide HttpClient;

import 'package:crypto/crypto.dart';
import 'package:diacritic/diacritic.dart';
import 'package:path/path.dart' as p;
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/alarm_sound.dart';

mixin AlarmSoundHelper {
  String getFileNameFromPath(String path) {
    return p.basename(path);
  }

  Future<String> ensureAlarmSoundFolder() async {
    final alarmDir = (await FileUtil.getVMSLibraryDirectory()).joinPath('Alarms');
    await FileUtil.ensureFolderExists(alarmDir);
    return alarmDir;
  }

  String hashAlarmFileName(AlarmSound sound) {
    final urlHash = md5.convert(utf8.encode(sound.url)).toString();
    final safeName = removeDiacritics(
      sound.name,
    ).replaceAll(RegExp(r'[\\/:*?"<>|\s]'), '_').toLowerCase();
    final extension = p.extension(sound.url);

    return '$safeName.$urlHash$extension';
  }

  Future<void> downloadAlarmSound(HttpClient httpClient, String url, String savedPath) async {
    final res = await httpClient.download(url, savedPath);

    if (!res) {
      // Xóa file rác (0KB hoặc bị lỗi) nếu tiến trình tải bị ngắt giữa chừng
      final failedFile = File(savedPath);
      if (failedFile.existsSync()) failedFile.delete();
    }
  }

}
