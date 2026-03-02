import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/usecases/event/get_event_display_config_usecase.dart';

part 'setup_info_field_event.dart';
part 'setup_info_field_state.dart';

class SetupEventDisplayBloc extends Bloc<SetupEventDisplayEvent, SetupEventDisplayState> {
  final GetEventDisplayConfigUsecase _getEventDisplayConfigUsecase;

  SetupEventDisplayBloc(this._getEventDisplayConfigUsecase)
    : super(const SetupEventDisplayState()) {
    on<GetEventDisplayConfig>(_onGetEventDisplayConfig);
  }

  Future<void> _onGetEventDisplayConfig(
    GetEventDisplayConfig event,
    Emitter<SetupEventDisplayState> emit,
  ) async {
    emit(const SEDGettingEventDisplayConfig());

    final result = await _getEventDisplayConfigUsecase.execute(
      GetEventDisplayConfigInput(event.eventType, event.typeConfig),
    );

    emit(SEDGetEventDisplayConfigSuccess(result.config));
  }
}
