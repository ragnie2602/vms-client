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
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case_input.dart';

part 'custom_view_event.dart';
part 'custom_view_state.dart';

class CustomViewBloc extends Bloc<CustomViewEvent, CustomViewState> {
  final ICustomLiveViewRepository customLiveViewRepository;

  final CreateTempCustomLiveViewUseCase createTempCustomLiveViewUseCase;
  final CreateCustomLiveViewUseCase createCustomLiveViewUseCase;
  final GetListCustomLiveViewUseCase getListCustomLiveViewUseCase;
  final UpdateCustomLiveViewUseCase updateCustomLiveViewUseCase;

  // Restore when cancel add new custom view
  CustomLiveView? preCustomView;

  CustomViewBloc(
    this.customLiveViewRepository,
    this.createTempCustomLiveViewUseCase,
    this.createCustomLiveViewUseCase,
    this.getListCustomLiveViewUseCase,
    this.updateCustomLiveViewUseCase,
  ) : super(CustomViewInitial()) {
    on<GetListCustomViews>(_onGetListCustomViews);
    on<ShowCustomView>(_onShowCustomView);

    on<AddingCameraToCustomView>(_onAddingCameraToCustomView);
    on<CreateCustomView>(_onCreateCustomView);

    on<DeleteCustomLiveView>(_onDeleteCustomLiveView);

    on<UpdateCustomView>(_onUpdateCustomView);
  }

  FutureOr<void> _onGetListCustomViews(
    GetListCustomViews event,
    Emitter<CustomViewState> emit,
  ) async {
    emit(CustomViewLoading());

    final output = await getListCustomLiveViewUseCase.execute(GetListCustomLiveViewInput());

    if (output.isSuccess) {
      emit(ListCustomViewSuccess(customViews: output.customViews));
    } else {
      emit(ListCustomViewFailure(output.errorMessage!));
    }
  }

  FutureOr<void> _onShowCustomView(ShowCustomView event, Emitter<CustomViewState> emit) {
    CustomLiveView customView;
    if (event.customView.id.isEmpty) {
      final output = createTempCustomLiveViewUseCase.execute(
        CreateTempCustomLiveViewInput(base: event.customView.base),
      );
      customView = output.customLiveView;
    } else {
      preCustomView = customView = event.customView;
    }

    emit(ShowCustomViewSuccess(customView: customView));
  }

  FutureOr<void> _onAddingCameraToCustomView(
    AddingCameraToCustomView event,
    Emitter<CustomViewState> emit,
  ) {
    emit(AddingCameraToCustomViewSuccess(camera: event.camera, index: event.index));
  }

  FutureOr<void> _onCreateCustomView(CreateCustomView event, Emitter<CustomViewState> emit) async {
    final output = await createCustomLiveViewUseCase.execute(
      CreateCustomLiveViewInput(name: event.name, base: event.base),
    );

    if (output.isSuccess) {
      emit(CreateCustomViewSuccess(customView: output.customLiveView!));
    } else {
      emit(CreateCustomViewFailure(message: output.errorMessage!));
    }
  }

  FutureOr<void> _onUpdateCustomView(UpdateCustomView event, Emitter<CustomViewState> emit) async {
    emit(UpdatingCustomView(index: event.index));

    final output = await updateCustomLiveViewUseCase.execute(
      UpdateCustomLiveViewUseCaseInput(customView: event.customView),
    );

    if (output.isSuccess) {
      emit(UpdateCustomViewSuccess(customView: output.customView!, index: event.index));
    } else {
      emit(UpdateCustomViewFailure(message: output.errorMessage!, index: event.index));
    }
  }

  FutureOr<void> _onDeleteCustomLiveView(
    DeleteCustomLiveView event,
    Emitter<CustomViewState> emit,
  ) async {
    emit(DeletingCustomView());

    final response = await customLiveViewRepository.deleteCustomLiveView(event.id);

    response.fold(
      (failure) => emit(DeleteCustomViewFailed(failure.toString())),
      (id) => emit(DeleteCustomViewSuccess(id)),
    );
  }
}
