import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_use_case.dart';

part 'custom_view_event.dart';
part 'custom_view_state.dart';

class CustomViewBloc extends Bloc<CustomViewEvent, CustomViewState> {
  final ICustomLiveViewRepository customLiveViewRepository;

  final CreateTempCustomLiveViewUseCase createTempCustomLiveViewUseCase;
  final CreateCustomLiveViewUseCase createCustomLiveViewUseCase;

  CustomViewBloc(
    this.customLiveViewRepository,
    this.createTempCustomLiveViewUseCase,
    this.createCustomLiveViewUseCase,
  ) : super(CustomViewInitial()) {
    on<GetListCustomViews>(_onGetListCustomViews);
    on<ShowCustomView>(_onShowCustomView);
    on<AddingCameraToCustomView>(_onAddingCameraToCustomView);
    on<CreateCustomView>(_onCreateCustomView);
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

  FutureOr<void> _onShowCustomView(ShowCustomView event, Emitter<CustomViewState> emit) {
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

  FutureOr<void> _onCreateCustomView(CreateCustomView event, Emitter<CustomViewState> emit) async {
    final output = await createCustomLiveViewUseCase.execute(
      CreateCustomLiveViewInput(name: event.name, base: event.base, cameras: event.cameras),
    );

    if (output.isSuccess) {
      emit(CreateCustomViewSuccess(customView: output.customLiveView!));
    } else {
      emit(CreateCustomViewFailure(message: output.errorMessage!));
    }
  }
}
