import 'package:vms_flutter_client/core/base_bloc.dart';

class MultiPlaybackState extends BaseState {
  final DateTime playbackDate;
  const MultiPlaybackState({required this.playbackDate});
  @override
  List<Object?> get props => [playbackDate];

  MultiPlaybackState copyWith({DateTime? playbackDate}) {
    return MultiPlaybackState(playbackDate: playbackDate ?? this.playbackDate);
  }
}
