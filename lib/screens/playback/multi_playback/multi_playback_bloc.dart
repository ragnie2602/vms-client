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

class MultiPlaybackBloc
    extends BaseBloc<MultiPlaybackEvent, MultiPlaybackState> {
  final ICameraRepository cameraRepository;
  final IPlaybackRepository playbackRepository;
  MultiPlaybackBloc({
    required this.cameraRepository,
    required this.playbackRepository,
  }) : super(
         MultiPlaybackState(
           playbackDate: DateTime.now(),
           multiPlaybackStatus: MultiPlaybackStatus.init,
         ),
       ) {
    on<InitEvent>(_init);
    on<ChangePlaybackDate>(_onChangePlaybackDate);
    on<AddCameraEvent>(_onAddNewCamera);
  }
  FutureOr<void> _init(
    InitEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    //init
    emit(
      MultiPlaybackState(
        playbackDate: DateTime.now(),
        multiPlaybackStatus: MultiPlaybackStatus.success,
      ),
    );
    // get luôn list cam tại đây
    emit(state.copyWith(multiPlaybackStatus: MultiPlaybackStatus.loading));
    final cameras = await cameraRepository.getAllCamera();
    cameras.fold(
      (fail) {
        // get cam lỗi thì vẫn tiếp tục view
        emit(
          state.copyWith(
            multiPlaybackStatus: MultiPlaybackStatus.success,
            listCameraOrigin: [],
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            multiPlaybackStatus: MultiPlaybackStatus.success,
            listCameraOrigin: success,
          ),
        );
      },
    );
  }

  FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    // update change date for multi playback
    if (state.playbackDate == event.date) return;

    emit(state.copyWith(playbackDate: event.date));
  }

  FutureOr<void> _onAddNewCamera(
    AddCameraEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    final videos = await getVideoPlaybacksByCameraId(
      camera: event.newCam,
      playbackDate: state.playbackDate,
    );
    ItemPlaybackModel newItem = ItemPlaybackModel(
      index: event.indexCam,
      camera: event.newCam,
      listVideoPlaybacks: videos?.reversed.toList(),
      playerController: PlayerController(),
    );
    _list.add(newItem);
    emit(state.copyWith(listItemCamPlayback: _list));
  }

  Future<List<PlaybackVideo>?> getVideoPlaybacksByCameraId({
    required CameraEntity camera,
    required DateTime playbackDate,
  }) async {
    final res = await playbackRepository.getTimeShiftVideoCloudCamera(
      cameraId: camera.id,
      currentTime: playbackDate.endOfDay.microsecondsSinceEpoch ~/ 1000,
      timeZone: 7,
    );
    return res.fold(
      (onFailure) {
        return [];
      },
      (onSuccess) {
        return onSuccess;
      },
    );
  }
}
