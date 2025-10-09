import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';

part 'list_camera_event.dart';
part 'list_camera_state.dart';

class ListCameraBloc extends BaseBloc<ListCameraEvent, ListCameraState> {
  ListCameraBloc(this.cameraRepository) : super(ListCameraInitial()) {
    on<GetAllCamera>(_onGetAllCamera);
    on<ChangeGridMode>(_onChangeGridMode);
    on<DisposePlayer>(_onDisposePlayer, transformer: sequential());
  }

  final ICameraRepository cameraRepository;

  FutureOr<void> _onGetAllCamera(GetAllCamera event, Emitter<ListCameraState> emit) async {
    emit(ListCameraLoading());

    (await cameraRepository.getAllCamera()).fold(
      (failure) {
        emit(ListCameraFailure(failure.toString()));
      },
      (cameras) {
        emit(
          ListCameraSuccess(
            cameras: cameras,
            mode: BaseView.fitWithLength(cameras.length, min: BaseView.v2x2),
          ),
        );
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

  FutureOr<void> _onChangeGridMode(ChangeGridMode event, Emitter<ListCameraState> emit) async {
    if (state is! ListCameraSuccess) return;

    final preState = state as ListCameraSuccess;
    if (preState.mode != event.mode) emit(preState.copyWith(mode: event.mode));
  }
}
