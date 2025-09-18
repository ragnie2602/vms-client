import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

part 'list_camera_event.dart';
part 'list_camera_state.dart';

class ListCameraBloc extends BaseBloc<ListCameraEvent, ListCameraState> {
  ListCameraBloc(this.cameraRepository) : super(ListCameraInitial()) {
    on<GetAllCamera>(_onGetAllCamera);
  }

  final ICameraRepository cameraRepository;

  FutureOr<void> _onGetAllCamera(GetAllCamera event, Emitter<ListCameraState> emit) async {
    emit(ListCameraLoading());

    final cameras = await cameraRepository.getAllCamera(GetAllCamera_Request());

    if (cameras != null) {
      emit(ListCameraSuccess(cameras: cameras));
    } else {
      emit(ListCameraFailure('No Camera'));
    } 
  }
}
