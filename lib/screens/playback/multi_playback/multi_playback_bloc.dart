import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/shared/player/sources.dart';

class MultiPlaybackBloc extends BaseBloc<MultiPlaybackEvent, MultiPlaybackState> {
  final ICameraRepository cameraRepository;
  final IPlaybackRepository playbackRepository;
  MultiPlaybackBloc({required this.cameraRepository, required this.playbackRepository})
    : super(MultiPlaybackState(playbackDate: DateTime.now(), multiPlaybackStatus: MultiPlaybackStatus.init)) {
    on<InitEvent>(_init);
    on<ChangePlaybackDate>(_onChangePlaybackDate);
    on<ChangeTimelineDisplayMode>(_onChangeTimelineDisplayMode);
    on<AddCameraEvent>(_onAddNewCamera);
    on<RemoveCameraEvent>(_onRemoveCamera);
    on<MultiTogglePlayEvent>(_onTogglePlay);
    on<MultiSeekEvent>(_onSeek);
    on<MultiChangeSpeedEvent>(_onChangeSpeed);
    on<MultiChangeVolumeEvent>(_onChangeVolume);
  }
  FutureOr<void> _init(InitEvent event, Emitter<MultiPlaybackState> emit) async {
    //init
    emit(MultiPlaybackState(playbackDate: DateTime.now(), multiPlaybackStatus: MultiPlaybackStatus.success));
    // get luôn list cam tại đây
    emit(state.copyWith(multiPlaybackStatus: MultiPlaybackStatus.loading));
    final cameras = await cameraRepository.getAllCamera();
    cameras.fold(
      (fail) {
        // get cam lỗi thì vẫn tiếp tục view
        emit(state.copyWith(multiPlaybackStatus: MultiPlaybackStatus.success, listCameraOrigin: []));
      },
      (success) {
        emit(state.copyWith(multiPlaybackStatus: MultiPlaybackStatus.success, listCameraOrigin: success));
      },
    );
  }

  FutureOr<void> _onChangePlaybackDate(ChangePlaybackDate event, Emitter<MultiPlaybackState> emit) async {
    // update change date for multi playback
    if (state.playbackDate == event.date) return;
    // đổi ngày xem lại => get lại list video playback của từng cam

    emit(state.copyWith(playbackDate: event.date));
  }

  FutureOr<void> _onChangeTimelineDisplayMode(ChangeTimelineDisplayMode event, Emitter<MultiPlaybackState> emit) {
    emit(state.copyWith(timelineDisplayMode: event.mode));
  }

  FutureOr<void> _onAddNewCamera(AddCameraEvent event, Emitter<MultiPlaybackState> emit) async {
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    final videos = await getVideoPlaybacksByCameraId(camera: event.newCam, playbackDate: state.playbackDate);
    ItemPlaybackModel newItem = ItemPlaybackModel(
      index: event.indexCam,
      camera: event.newCam,
      listVideoPlaybacks: videos?.reversed.toList(),
      playerController: PlayerController(),
    );
    _list.add(newItem);
    emit(state.copyWith(listItemCamPlayback: _list));
  }

  Future<List<PlaybackVideo>?> getVideoPlaybacksByCameraId({required CameraEntity camera, required DateTime playbackDate}) async {
    return (await playbackRepository.getTimeShiftVideoCloudCamera(
      cameraId: camera.id,
      currentTime: playbackDate.endOfDay.millisecondsSinceEpoch ~/ 1000,
      timeZone: 7,
    )).fold(
      (failure) {
        return [];
      },
      (playbacks) {
        return playbacks;
      },
    );
  }

  FutureOr<void> _onRemoveCamera(RemoveCameraEvent event, Emitter<MultiPlaybackState> emit) {
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    _list.removeWhere((e) => e.index == event.indexCam);
    emit(state.copyWith(listItemCamPlayback: _list));
  }

  FutureOr<void> _onTogglePlay(
    MultiTogglePlayEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    final isPlaying = !state.isPlaying;
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.togglePlay?.call();
    }
    emit(state.copyWith(isPlaying: isPlaying));
  }

  FutureOr<void> _onSeek(
    MultiSeekEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.seek?.call(event.duration);
    }
  }

  FutureOr<void> _onChangeSpeed(
    MultiChangeSpeedEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.changeSpeed?.call(event.speed);
    }
    emit(state.copyWith(speed: event.speed));
  }

  FutureOr<void> _onChangeVolume(
    MultiChangeVolumeEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.changeVolume?.call(event.volume);
    }
    emit(state.copyWith(volume: event.volume));
  }
}
