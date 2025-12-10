import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/screens/shared/player/player_controller.dart';

class ItemPlaybackModel extends Equatable {
  final int index;
  final CameraEntity camera;
  final List<PlaybackVideo>? listVideoPlaybacks;
  final PlayerController playerController;

  const ItemPlaybackModel({
    required this.index,
    required this.camera,
    this.listVideoPlaybacks,
    required this.playerController,
  });

  ItemPlaybackModel copyWith({
    int? index,
    CameraEntity? camera,
    List<PlaybackVideo>? listVideoPlaybacks,
    PlayerController? playerController,
  }) {
    return ItemPlaybackModel(
      index: index ?? this.index,
      camera: camera ?? this.camera,
      listVideoPlaybacks: listVideoPlaybacks ?? this.listVideoPlaybacks,
      playerController: playerController ?? this.playerController,
    );
  }

  @override
  List<Object?> get props => [
    index,
    camera,
    listVideoPlaybacks,
    playerController,
  ];
  bool get isNoVideo {
    return ((listVideoPlaybacks ?? []).isEmpty);
  }
}
