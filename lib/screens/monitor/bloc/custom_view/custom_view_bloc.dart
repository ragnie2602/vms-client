import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/monitor/create_temp_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/monitor/create_temp_custom_live_view_use_case.dart';

part 'custom_view_event.dart';
part 'custom_view_state.dart';

class CustomViewBloc extends Bloc<CustomViewEvent, CustomViewState> {
  final ICustomLiveViewRepository customLiveViewRepository;

  final CreateTempCustomLiveViewUseCase createTempCustomLiveViewUseCase;

  CustomViewBloc(this.customLiveViewRepository, this.createTempCustomLiveViewUseCase)
    : super(CustomViewInitial()) {
    on<GetListCustomViews>(_onGetListCustomViews);
    on<AddingCustomView>(_onAddingCustomView);
    on<AddingCameraToCustomView>(_onAddingCameraToCustomView);
  }

  FutureOr<void> _onGetListCustomViews(
    GetListCustomViews event,
    Emitter<CustomViewState> emit,
  ) async {
    emit(CustomViewLoading());

    (await customLiveViewRepository.getListCustomLiveView()).fold(
      (failure) {
        emit(ListCustomViewFailure(failure.toString()));
      },
      (views) {
        emit(ListCustomViewSuccess(customViews: views));
      },
    );
  }

  FutureOr<void> _onAddingCustomView(AddingCustomView event, Emitter<CustomViewState> emit) {
    final output = createTempCustomLiveViewUseCase.execute(
      CreateTempCustomLiveViewInput(base: event.base),
    );

    emit(CustomViewSuccess(customView: output.customLiveView));
  }

  FutureOr<void> _onAddingCameraToCustomView(
    AddingCameraToCustomView event,
    Emitter<CustomViewState> emit,
  ) {
    emit(AddingCameraToCustomViewSuccess(camera: event.camera, index: event.index));
  }
}
