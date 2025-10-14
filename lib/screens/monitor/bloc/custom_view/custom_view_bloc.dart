import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';

part 'custom_view_event.dart';
part 'custom_view_state.dart';

class CustomViewBloc extends Bloc<CustomViewEvent, CustomViewState> {
  final ICustomLiveViewRepository customLiveViewRepository;
  CustomViewBloc(this.customLiveViewRepository) : super(CustomViewInitial()) {
    on<GetListCustomViews>(_onGetListCustomViews);
  }

  FutureOr<void> _onGetListCustomViews(
    GetListCustomViews event,
    Emitter<CustomViewState> emit,
  ) async {
    emit(CustomViewLoading());

    (await customLiveViewRepository.getListCustomLiveView()).fold(
      (failure) {
        emit(CustomViewFailure(failure.toString()));
      },
      (views) {
        emit(CustomViewSuccess(customViews: views));
      },
    );
  }
}
