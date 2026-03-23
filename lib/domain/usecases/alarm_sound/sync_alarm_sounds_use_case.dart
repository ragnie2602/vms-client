import 'dart:io';

import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';

import '../../entities/ai_alarm/alarm_sound.dart';
import '../base_input.dart';
import '../base_output.dart';
import '../future_use_case.dart';
import 'helper.dart';

class SyncAlarmSoundsUseCase extends FutureUseCase<SyncAlarmSoundsInput, SyncAlarmSoundsOutput>
    with AlarmSoundHelper {
  final HttpClient httpClient;
  SyncAlarmSoundsUseCase(this.httpClient);

  @override
  Future<SyncAlarmSoundsOutput> buildUseCase(SyncAlarmSoundsInput input) async {
    if (input.baseSounds.isEmpty) return SyncAlarmSoundsOutput(input.baseSounds);

    // 1. Đọc thư mục âm thanh cảnh báo
    final alarmDir = await ensureAlarmSoundFolder();

    // 2. Xử lý danh sách tên cảnh báo để lưu local
    Map<String, AlarmSound> pendingDownloads = {};
    for (var sound in input.baseSounds) {
      if (sound.url.isEmpty || sound.name.isEmpty) continue;
      pendingDownloads[hashAlarmFileName(sound)] = sound;
    }

    // 3. Dọn dẹp
    final deleteTasks = <Future<void>>[];
    for (var file in Directory(alarmDir).listSync().whereType<File>()) {
      final localFileName = getFileNameFromPath(file.path);

      // Trường hợp cảnh báo đã được tải rồi
      if (pendingDownloads.containsKey(localFileName) && !input.force) {
        pendingDownloads.remove(localFileName)!.localFilePath = file.path;
        continue;
      }

      Logger.log('Deleteing obsolete alarm sound: ${file.path}', tag: 'SyncAlarmSounds');
      deleteTasks.add(file.delete());
    }
    if (deleteTasks.isNotEmpty) await Future.wait(deleteTasks);

    // 4. Download các âm thanh còn lại
    final downloadTasks = pendingDownloads.entries.map<Future<void>>(
      (e) => downloadAlarmSound(httpClient, e.value.url, alarmDir.joinPath(e.key)),
    );
    if (downloadTasks.isNotEmpty) await Future.wait(downloadTasks);

    return SyncAlarmSoundsOutput(input.baseSounds);
  }
}

class SyncAlarmSoundsInput extends BaseInput {
  final List<AlarmSound> baseSounds;
  final bool force;
  SyncAlarmSoundsInput({required this.baseSounds, this.force = false});
}

class SyncAlarmSoundsOutput extends BaseOutput {
  final List<AlarmSound> alarmSounds;
  SyncAlarmSoundsOutput(this.alarmSounds);
}
