import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/screens/camera_detail/components/player_timeline.dart';

enum MultiPlaybackStatus { init, loading, success, fail }

class MultiPlaybackState extends BaseState {
  final MultiPlaybackStatus multiPlaybackStatus;

  final List<CameraEntity>? listCameraOrigin;
  //
  final List<ItemPlaybackModel>? listItemCamPlayback;
  //
  final List<PlaybackVideo> mergedPlaybackList;

  // ngày muốn xem lại
  final DateTime playbackDate;
  // mode xem lại
  final TimelineDisplayMode timelineDisplayMode;
  // âm lượng
  final double volume;
  // tốc độ
  final double speed;

  // trạng thái play/pause
  final bool isPlaying;

  const MultiPlaybackState({
    required this.playbackDate,
    required this.multiPlaybackStatus,
    this.listCameraOrigin,
    this.listItemCamPlayback,
    this.mergedPlaybackList = const [],
    this.timelineDisplayMode = TimelineDisplayMode.h8,
    this.volume = 100,
    this.speed = 1,
    this.isPlaying = false,
  });
  @override
  List<Object?> get props => [
    multiPlaybackStatus,
    listCameraOrigin,
    listItemCamPlayback,
    mergedPlaybackList,
    playbackDate,
    timelineDisplayMode,
    volume,
    speed,
    isPlaying,
  ];

  MultiPlaybackState copyWith({
    MultiPlaybackStatus? multiPlaybackStatus,
    DateTime? playbackDate,
    List<CameraEntity>? listCameraOrigin,
    List<ItemPlaybackModel>? listItemCamPlayback,
    List<PlaybackVideo>? mergedPlaybackList,
    TimelineDisplayMode? timelineDisplayMode,
    double? volume,
    double? speed,
    bool? isPlaying,
  }) {
    return MultiPlaybackState(
      multiPlaybackStatus: multiPlaybackStatus ?? this.multiPlaybackStatus,
      playbackDate: playbackDate ?? this.playbackDate,
      listCameraOrigin: listCameraOrigin ?? this.listCameraOrigin,
      listItemCamPlayback: listItemCamPlayback ?? this.listItemCamPlayback,
      mergedPlaybackList: mergedPlaybackList ?? this.mergedPlaybackList,
      timelineDisplayMode: timelineDisplayMode ?? this.timelineDisplayMode,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}
