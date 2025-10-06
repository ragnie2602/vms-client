import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';

part 'list_camera_event.dart';
part 'list_camera_state.dart';

class ListCameraBloc extends BaseBloc<ListCameraEvent, ListCameraState> {
  ListCameraBloc(this.cameraRepository) : super(ListCameraInitial()) {
    on<GetAllCamera>(_onGetAllCamera);
    on<DisposePlayer>(_onDisposePlayer, transformer: sequential());
  }

  final ICameraRepository cameraRepository;

  FutureOr<void> _onGetAllCamera(GetAllCamera event, Emitter<ListCameraState> emit) async {
    emit(ListCameraLoading());

    (await cameraRepository.getAllCamera()).fold(
      (failure) {
        emit(ListCameraFailure(failure.parseMessage()));
      },
      (cameras) {
        emit(ListCameraSuccess(cameras: cameras));
      },
    );
  }

  FutureOr<void> _onDisposePlayer(DisposePlayer event, Emitter<ListCameraState> emit) async {
    if (event.sequentialMode) {
      await event.player.dispose();
    } else {
      event.player.dispose();
    }
  }
}
