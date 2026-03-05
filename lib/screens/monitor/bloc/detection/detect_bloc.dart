import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_alert_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/screens/home/widgets/alert_detail_popup.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

class DetectBloc extends Bloc<DetectEvent, DetectState> {
  final IDetectRepository detectRepository;
  StreamSubscription? _subscription;
  bool _isDialogShowing = false;

  DetectBloc(this.detectRepository) : super(const DetectState()) {
    on<DetectInitial>(_onDetectInitial);
    on<DetectOnReceiveEvent>(_onDetectOnReceiveEvent);
    on<FilterEventsByViewingCameras>(_onFilterEventsByViewingCameras);
    on<UpdateFilterTypes>(_onUpdateFilterTypes);
    on<UpdateTabIndex>(_onUpdateTabIndex);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onDetectInitial(
    DetectInitial event,
    Emitter<DetectState> emit,
  ) async {
    emit(state.copyWith(status: DetectStatus.loading));

    // step1: Load danh sách loại sự kiện
    final result = await detectRepository.getListTypeEventDetect();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DetectStatus.failure,
            errorMessage: failure.toString(),
          ),
        );
      },
      (typeEvents) {
        emit(
          state.copyWith(status: DetectStatus.success, typeEvents: typeEvents),
        );
        // Lưu typeEvents vào SharedPreferences để màn hình notification settings sử dụng
        final jsonString = json.encode(
          typeEvents.map((e) => e.toJson()).toList(),
        );
        AppData.instance.save<String>(AppKeys.SP_TYPE_EVENT_DETECT, jsonString);
      },
    );
    // step 2: Lắng nghe sự kiện từ stream
    _subscription?.cancel();
    _subscription = detectRepository.receiveEventStream.listen((event) {
      add(DetectOnReceiveEvent(event));
      final context = AppRouter.rootNavigatorKey.currentContext;
      if (context != null) {
        
        // Đóng dialog cũ trước khi hiện dialog mới
        if (_isDialogShowing) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        _isDialogShowing = true;
        final eventName = event.eventType ?? 'Không rõ';
        final evenData= event.eventDataEntity;
        AlertDetailPopup.show(
          context,
          alert: NotificationAlertEntity(
            cameraName: 'Camera Tầng 1',
            cameraGroupName: 'Camera Tầng 1',
            categoryLabel: 'Cảnh báo sự kiện mới',
            message: 'Phát hiện sự kiện: $eventName',
            alertType: AlertType.fire,
            time: DateTime.now().millisecondsSinceEpoch.toString(),
            id: '1',
          ),
          snapshotUrl: evenData.imageUrl ?? '',
          cameraLabel: 'Camera Tầng 1',
          onViewDetail: () {
            /* navigate */
          },
        );
      }
    });
  }

  FutureOr<void> _onDetectOnReceiveEvent(
    DetectOnReceiveEvent event,
    Emitter<DetectState> emit,
  ) {
    if (state.status == DetectStatus.success) {
      final newEvents = List<ReceiveEventEntity>.from(state.receiveEvents)
        ..insert(0, event.event);
      bool? _reachedMax;

      // quá 100 cắt ở đây
      if (newEvents.length > 100) {
        newEvents.removeRange(100, newEvents.length);
        _reachedMax = true;
      }

      emit(
        state.copyWith(
          receiveEvents: newEvents,
          hasReachedMaxEvents: _reachedMax,
        ),
      );

      // Recalculate selectedEvents if filter is active
      if (state.shouldShowSelectedEvents) {
        _emitFilteredEvents(emit, newEvents);
      }
    }
  }

  FutureOr<void> _onFilterEventsByViewingCameras(
    FilterEventsByViewingCameras event,
    Emitter<DetectState> emit,
  ) {
    if (state.status == DetectStatus.success) {
      emit(state.copyWith(viewingCameraIds: event.viewingCameraIds));
      _emitFilteredEvents(emit, state.receiveEvents);
    }
  }

  FutureOr<void> _onUpdateFilterTypes(
    UpdateFilterTypes event,
    Emitter<DetectState> emit,
  ) {
    if (state.status == DetectStatus.success) {
      emit(state.copyWith(selectedFilterTypes: event.selectedTypes));
      _emitFilteredEvents(emit, state.receiveEvents);
    }
  }

  FutureOr<void> _onUpdateTabIndex(
    UpdateTabIndex event,
    Emitter<DetectState> emit,
  ) {
    if (state.status == DetectStatus.success) {
      final newViewingCameraIds =
          event.viewingCameraIds ?? state.viewingCameraIds;
      emit(
        state.copyWith(
          currentTabIndex: event.tabIndex,
          viewingCameraIds: newViewingCameraIds,
        ),
      );
      _emitFilteredEvents(emit, state.receiveEvents);
    }
  }

  void _emitFilteredEvents(
    Emitter<DetectState> emit,
    List<ReceiveEventEntity> sourceEvents,
  ) {
    final filteredEvents = sourceEvents.where((receiveEvent) {
      // Check camera filter (only if on "Cam đang xem" tab)
      if (state.isViewingCamTab && state.viewingCameraIds.isNotEmpty) {
        final eventCameraId = receiveEvent.cameraId;
        if (eventCameraId == null || eventCameraId.isEmpty) return false;
        final matchesCamera = state.viewingCameraIds.any(
          (viewingId) => listEquals(eventCameraId, viewingId),
        );
        if (!matchesCamera) return false;
      }

      // Check type filter (if any filter types selected)
      if (state.hasActiveFilter) {
        final eventType = receiveEvent.eventType;
        if (eventType == null) return false;
        final matchesType = state.typeEvents.any(
          (typeEvent) =>
              state.selectedFilterTypes.contains(typeEvent.type) &&
              typeEvent.typeName == eventType,
        );
        if (!matchesType) return false;
      }

      return true;
    }).toList();

    emit(state.copyWith(selectedEvents: filteredEvents));
  }
}
