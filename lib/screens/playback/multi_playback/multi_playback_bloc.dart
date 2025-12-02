import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';

class MultiPlaybackBloc
    extends BaseBloc<MultiPlaybackEvent, MultiPlaybackState> {
  MultiPlaybackBloc() : super(MultiPlaybackState(playbackDate: DateTime.now()));
}
