import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/components/player_timeline.dart';

enum MultiPlaybackStatus { init, loading, success, fail }

class MultiPlaybackState extends BaseState {
  final MultiPlaybackStatus multiPlaybackStatus;

  // list camera
  final List<CameraEntity>? listCamera;
  final List<CameraEntity>? listCameraOrigin;
  final List<int>? listIndexCamera;
  // ngày muốn xem lại
  final DateTime playbackDate;
  // mode xem lại
  final TimelineDisplayMode timelineDisplayMode;
  // âm lượng
  final double volume;
  // tốc độ
  final double speed;

  const MultiPlaybackState({
    required this.playbackDate,
    required this.multiPlaybackStatus,
    this.listCameraOrigin,
    this.listCamera,
    this.listIndexCamera,
    this.timelineDisplayMode = TimelineDisplayMode.h8,
    this.volume = 100,
    this.speed = 1,
  });
  @override
  List<Object?> get props => [
    multiPlaybackStatus,
    listCamera,
    listCameraOrigin,
    listIndexCamera,
    playbackDate,
    timelineDisplayMode,
    volume,
    speed,
  ];

  MultiPlaybackState copyWith({
    MultiPlaybackStatus? multiPlaybackStatus,
    DateTime? playbackDate,
    List<CameraEntity>? listCamera,
    List<CameraEntity>? listCameraOrigin,
    List<int>? listIndexCamera,
    TimelineDisplayMode? timelineDisplayMode,
    double? volume,
    double? speed,
  }) {
    return MultiPlaybackState(
      multiPlaybackStatus: multiPlaybackStatus ?? this.multiPlaybackStatus,
      playbackDate: playbackDate ?? this.playbackDate,
      listCameraOrigin: listCameraOrigin ?? this.listCameraOrigin,
      listCamera: listCamera ?? this.listCamera,
      listIndexCamera: listIndexCamera ?? this.listIndexCamera,
      timelineDisplayMode: timelineDisplayMode ?? this.timelineDisplayMode,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
    );
  }
}
