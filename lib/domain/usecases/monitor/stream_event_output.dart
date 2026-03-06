part of 'stream_event_usecase.dart';

class StreamEventOutput extends BaseOutput {
  final ReceiveEventEntity liveEvent;

  const StreamEventOutput(this.liveEvent);
}
