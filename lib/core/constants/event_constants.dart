import 'package:intl/intl.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';

class EventTypeConfig {
  static const int LIVEVIEW = 1;
  static const int EVENT_MANAGEMENT = 2;

  static translator(String field, EventEntity event) {
    switch (field) {
      case 'CAMERA_NAME':
        return event.camera?.name ?? '';
      case 'EVENT_TIME':
        return DateFormat(
          'HH:mm dd/MM/yyyy',
        ).format(DateTime.fromMillisecondsSinceEpoch(event.timeEvent * 1000, isUtc: true));
      case 'EVENT_TYPE':
        return event.eventName ?? '';
    }

    return '';
  }
}
