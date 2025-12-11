import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/screens/shared/player/player_controller.dart';

class ItemPlaybackModel extends Equatable {
  final int index;
  final CameraEntity camera;
  final List<PlaybackVideo>? listVideoPlaybacks;
  final PlayerController playerController;
  // init date
  final DateTime? initialDate;

  const ItemPlaybackModel({
    required this.index,
    required this.camera,
    this.listVideoPlaybacks,
    required this.playerController,
    this.initialDate,
  });

  ItemPlaybackModel copyWith({
    int? index,
    CameraEntity? camera,
    List<PlaybackVideo>? listVideoPlaybacks,
    PlayerController? playerController,
    DateTime? initialDate,
  }) {
    return ItemPlaybackModel(
      index: index ?? this.index,
      camera: camera ?? this.camera,
      listVideoPlaybacks: listVideoPlaybacks ?? this.listVideoPlaybacks,
      playerController: playerController ?? this.playerController,
      initialDate: initialDate,
    );
  }

  @override
  List<Object?> get props => [
    index,
    camera,
    listVideoPlaybacks,
    playerController,
    initialDate,
  ];
  bool get isNoVideo {
    return ((listVideoPlaybacks ?? []).isEmpty);
  }
}
