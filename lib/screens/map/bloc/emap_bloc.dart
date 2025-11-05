import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

class EmapBloc extends BaseBloc<EmapEvent, EmapState> {
  final IEmapRepository emapRepository;
  EmapBloc({required this.emapRepository}) : super(const EmapState()) {
    on<GetListEmapEvent>(_onGetListEmap);
  }

  FutureOr<void> _onGetListEmap(
    GetListEmapEvent event,
    Emitter<EmapState> emit,
  ) async {
    emit(EmapLoadingState());
    final emaps = await emapRepository.getListEmap();
    emaps.fold(
      (onFailure) {
        // listGroup = [];
        // emit(GetAllGroupCameraFailState(groups.left.toString()));
      },
      (onSuccess) {
        List<EmapInforEntity> _list = onSuccess;
        emit(
          EmapSuccessState(
            listEmap: _list,
            currentEmapIndex: _list.isEmpty ? null : 0,
          ),
        );
      },
    );
  }
}
