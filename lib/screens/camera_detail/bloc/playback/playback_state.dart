// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'playback_bloc.dart';

enum PlaybackType { only, multi }

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
  final int currentIndex;
  final int initialIndex;

  const PlaybackSuccess({
    required this.initialIndex,
    required this.playbacks,
    required this.currentIndex,
  });

  @override
  StateType get type =>
      playbacks.isNotEmpty ? StateType.success : StateType.empty;
  @override
  List<Object?> get props => [playbacks, initialIndex, currentIndex];

  PlaybackSuccess copyWith({
    List<PlaybackVideo>? playbacks,
    int? currentIndex,
    int? initialIndex,
  }) {
    return PlaybackSuccess(
      playbacks: playbacks ?? this.playbacks,
      currentIndex: currentIndex ?? this.currentIndex,
      initialIndex: initialIndex ?? this.initialIndex,
    );
  }

  // PlaybackVideo? get nextPlayback {
  //   if (currentPlayback == null) return null;

  //   final index = mapper[currentPlayback!.playbackId];
  //   if (index == null || index == 0) return null; // Do danh sách time giảm dần từ 24h về 0h

  //   return playbacks[index - 1];
  // }

  // PlaybackVideo? get previousPlayback {
  //   if (currentPlayback == null) return null;

  //   final index = mapper[currentPlayback!.playbackId];
  //   if (index == null || index == playbacks.length - 1) return null; // Do danh sách time giảm dần từ 24h về 0h

  //   return playbacks[index + 1];
  // }

  // PlaybackVideo? binarySearch(DateTime target) {
  //   if (playbacks.isEmpty) return null;
  //   if (target.isAfter(playbacks.first.endTime)) return null;
  //   if (target.isBefore(playbacks.last.startTime)) return null;

  //   int low = 0;
  //   int high = playbacks.length - 1;

  //   while (low <= high) {
  //     final mid = (low + high) >> 1;
  //     final midItem = playbacks[mid];

  //     if (target.isAfter(midItem.endTime)) {
  //       high = mid - 1;
  //     } else if (target.isBefore(midItem.startTime)) {
  //       low = mid + 1;
  //     } else {
  //       return midItem;
  //     }
  //   }

  //   return null;
  // }
}
