import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/utils/common_util.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/create_temp_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_input.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/get_list_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/custom_live_view/update_custom_live_view_use_case_input.dart';
import 'package:vms_flutter_client/screens/monitor/custom_monitor_pane.dart';

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

  StreamSubscription? _multiWindowEventSubscription;

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
    on<RemovingCameraFromCustomView>(_onRemovingCameraFromCustomView);
    on<CreateCustomView>(_onCreateCustomView);

    on<DeleteCustomLiveView>(_onDeleteCustomLiveView);

    on<UpdateCustomView>(_onUpdateCustomView);

    on<ReopenCustomView>(_onReopenCustomView);
  }

  @override
  Future<void> close() {
    _multiWindowEventSubscription?.cancel();
    return super.close();
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
    if (event.mode != CustomMonitorPaneMode.add) {
      preCustomView = event.customView;
    } else if (state is ShowCustomViewSuccess) {
      preCustomView = (state as ShowCustomViewSuccess).customView;
    }

    CustomLiveView customView = event.customView;
    if (event.mode == CustomMonitorPaneMode.add) {
      // id.isEmpty --> new custom view
      final output = createTempCustomLiveViewUseCase.execute(
        CreateTempCustomLiveViewInput(newBase: event.customView.base, oldCv: event.customView),
      );
      customView = output.customLiveView;
    } else if (event.mode == CustomMonitorPaneMode.edit) {
      if (customView.base.total < customView.positions.length) {
        customView = customView.copyWith(
          positions: customView.positions.sublist(0, customView.base.total),
        );
      } else if (customView.base.total > customView.positions.length) {
        customView = customView.copyWith(
          positions:
              customView.positions +
              List.generate(
                customView.base.total - customView.positions.length,
                (index) =>
                    LiveViewPosition(index: index + customView.positions.length, cameraId: []),
              ),
        );
      }
    }

    emit(ShowCustomViewSuccess(customView: customView.copyWith()));
  }

  FutureOr<void> _onAddingCameraToCustomView(
    AddingCameraToCustomView event,
    Emitter<CustomViewState> emit,
  ) {
    emit(AddingCameraToCustomViewSuccess(camera: event.camera, index: event.index));
  }

  FutureOr<void> _onCreateCustomView(CreateCustomView event, Emitter<CustomViewState> emit) async {
    emit(CreatingCustomView());

    final output = await createCustomLiveViewUseCase.execute(
      CreateCustomLiveViewInput(
        name: event.name,
        base: event.base,
        positions: event.positions ?? [],
      ),
    );

    if (output.isSuccess) {
      emit(CreateCustomViewSuccess(customView: preCustomView = output.customLiveView!));
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
      emit(
        UpdateCustomViewSuccess(customView: preCustomView = output.customView!, index: event.index),
      );
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

  FutureOr<void> _onRemovingCameraFromCustomView(
    RemovingCameraFromCustomView event,
    Emitter<CustomViewState> emit,
  ) {
    emit(RemovingCameraFromCustomViewSuccess(index: event.index));
  }

  FutureOr<void> _onReopenCustomView(ReopenCustomView event, Emitter<CustomViewState> emit) async {
    final listCVs = await getListCustomLiveViewUseCase.execute(GetListCustomLiveViewInput());

    CustomLiveView? cv;
    if (listCVs.isSuccess) {
      cv = listCVs.customViews.firstWhereOrNull((cv) => cv.id.equals(event.id));
    } else {
      cv = CustomLiveView(id: [], base: ViewMode.v2x2, positions: [], name: '');
    }

    _onShowCustomView(ShowCustomView(cv!, CustomMonitorPaneMode.view), emit);
  }
}
