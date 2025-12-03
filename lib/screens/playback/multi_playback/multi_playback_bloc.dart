import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';

class MultiPlaybackBloc
    extends BaseBloc<MultiPlaybackEvent, MultiPlaybackState> {
  final ICameraRepository cameraRepository;

  MultiPlaybackBloc({required this.cameraRepository})
    : super(
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
  ) {
    List<CameraEntity>? _listCam = List.from(state.listCamera ?? []);
    List<int>? _listIndexCam = List.from(state.listIndexCamera ?? []);
    _listCam.add(event.newCam);
    _listIndexCam.add(event.indexCam);
    emit(state.copyWith(listCamera: _listCam, listIndexCamera: _listIndexCam));
  }
}
