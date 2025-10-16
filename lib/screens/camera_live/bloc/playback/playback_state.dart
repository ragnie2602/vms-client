// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'playback_bloc.dart';

sealed class PlaybackState extends BaseState {
  const PlaybackState();
}

final class PlaybackInitial extends PlaybackState {
  @override
  StateType get type => StateType.initial;
}

final class PlaybackLoading extends PlaybackState {
  @override
  StateType get type => StateType.loading;
}

final class PlaybackFailure extends PlaybackState {
  final String message;

  const PlaybackFailure(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class PlaybackSuccess extends PlaybackState {
  final List<PlaybackVideo> playbacks;
  final PlaybackVideo? currentPlayback;
  final int? currentDuration;

  /// Gán centralDate = currentPlayback.startTime ngay lập tức thay vì đợi 1s sau mới update
  final bool? setStartTimeInstantly;

  const PlaybackSuccess({
    required this.playbacks,
    required this.currentPlayback,
    this.currentDuration,
    this.setStartTimeInstantly,
  });

  @override
  StateType get type => playbacks.isNotEmpty ? StateType.success : StateType.empty;
  @override
  List<Object?> get props => [playbacks, currentPlayback, currentDuration, setStartTimeInstantly];

  PlaybackSuccess copyWith({
    List<PlaybackVideo>? playbacks,
    PlaybackVideo? currentPlayback,
    int? currentDuration,
    bool? setStartTimeInstantly,
    bool currentPlaybackCanNull = false,
  }) {
    return PlaybackSuccess(
      playbacks: playbacks ?? this.playbacks,
      currentPlayback: currentPlayback ?? (currentPlaybackCanNull ? null : this.currentPlayback),
      currentDuration: currentDuration ?? this.currentDuration,
      setStartTimeInstantly: setStartTimeInstantly,
    );
  }

  PlaybackVideo? binarySearch(DateTime target) {
    if (playbacks.isEmpty) return null;
    if (target.isAfter(playbacks.first.endTime)) return null;
    if (target.isBefore(playbacks.last.startTime)) return null;

    int low = 0;
    int high = playbacks.length - 1;

    while (low <= high) {
      final mid = (low + high) >> 1;
      final midItem = playbacks[mid];

      if (target.isAfter(midItem.endTime)) {
        high = mid - 1;
      } else if (target.isBefore(midItem.startTime)) {
        low = mid + 1;
      } else {
        return midItem;
      }
    }

    return null;
  }
}
