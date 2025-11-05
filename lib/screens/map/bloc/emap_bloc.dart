import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/entities/map/camera_emap_info_entity.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

class EmapBloc extends BaseBloc<EmapEvent, EmapState> {
  final IEmapRepository emapRepository;
  EmapBloc({required this.emapRepository}) : super(const EmapState()) {
    on<GetListEmapEvent>(_onGetListEmap);
    on<ChangeEmapEvent>(_onChangeSelectEmap);
  }

  FutureOr<void> _onGetListEmap(
    GetListEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    emit(EmapLoadingState());
    final emaps = await emapRepository.getListEmap();
    emaps.fold(
      (onFailure) {
        //
      },
      (onSuccess) {
        List<EmapInforEntity> _list = onSuccess;
        emit(
          EmapSuccessState(
            listEmap: _list,
            emapSelected: _list.isEmpty ? null : _list.first,
          ),
        );
      },
    );
  }

  FutureOr<void> _onChangeSelectEmap(
    ChangeEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    if ((state is EmapSuccessState) == false) {
      await _onGetListEmap(GetListEmapEvent(), emit);
      return;
    }
    final currentState = state as EmapSuccessState;
    if (currentState.emapSelected != event.emap) {
      emit(currentState.copyWith(emapSelected: event.emap));
    }
  }

  FutureOr<void> _addCameraEmap(
    AddCameraEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    emit(EmapLoadingState());
    final emaps = await emapRepository.addCameraEmap();
    emaps.fold(
      (onFailure) {
        //
      },
      (onSuccess) {
        CameraEmapInfoEntity cameraEmapInfoEntity = onSuccess;
        emit(AddCameraEmapSuccessState(cameraEmapInfo: cameraEmapInfoEntity));
      },
    );
  }
}
