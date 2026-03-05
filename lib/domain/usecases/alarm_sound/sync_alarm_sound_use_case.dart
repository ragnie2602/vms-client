import 'dart:io';

import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';

import '../../entities/ai_alarm/alarm_sound.dart';
import '../base_input.dart';
import '../base_output.dart';
import '../future_use_case.dart';
import 'helper.dart';

class SyncAlarmSoundUseCase extends FutureUseCase<SyncAlarmSoundInput, SyncAlarmSoundOutput>
    with AlarmSoundHelper {
  final HttpClient httpClient;
  SyncAlarmSoundUseCase(this.httpClient);

  @override
  Future<SyncAlarmSoundOutput> buildUseCase(SyncAlarmSoundInput input) async {
    if (input.sound.url.isEmpty || input.sound.name.isEmpty) {
      return SyncAlarmSoundOutput(input.sound);
    }

    // 1. Đọc thư mục âm thanh cảnh báo
    final alarmDir = await ensureAlarmSoundFolder();

    // 2. Hash tên
    final hashedFileName = hashAlarmFileName(input.sound);

    // 3. Dọn dẹp
    for (var file in Directory(alarmDir).listSync().whereType<File>()) {
      if (getFileNameFromPath(file.path) == hashedFileName) {
        Logger.log('Deleteing obsolete alarm sound: ${file.path}', tag: 'SyncAlarmSound');
        await file.delete();
        break;
      }
    }

    // 4. Download
    await downloadAlarmSound(httpClient, input.sound.url, alarmDir.joinPath(hashedFileName));

    return SyncAlarmSoundOutput(input.sound);
  }
}

class SyncAlarmSoundInput extends BaseInput {
  final AlarmSound sound;
  SyncAlarmSoundInput(this.sound);
}

class SyncAlarmSoundOutput extends BaseOutput {
  final AlarmSound sound;
  SyncAlarmSoundOutput(this.sound);
}
