// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/al_alarm_enums.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_alert_entity.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/screens/camera_configuration/bloc/alarm_sound/alarm_sound_bloc.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/screens/home/widgets/alert_detail_popup.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';

import 'package:vms_flutter_client/screens/shared/player/audio_player.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

import 'async_delay_queue.dart';

class DetectBloc extends Bloc<DetectEvent, DetectState> {
  final IDetectRepository detectRepository;
  StreamSubscription? _subscription;

  bool _isDialogShowing = false;
  AsyncDelayQueue asyncDelayQueue = AsyncDelayQueue(delay: Duration(seconds: 10));
  AudioPlayer audioPlayer = AudioPlayer();

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
    asyncDelayQueue.dispose();
    audioPlayer.dispose();
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

      print("[Pending alert count]: ${asyncDelayQueue.pendingCount}");
      asyncDelayQueue.add(() async {
        final rootContext = AppRouter.rootNavigatorKey.currentContext;
        final homeContext = AppRouter.homeNavigatorKey.currentContext;

        if (rootContext != null) {
          // Đọc cấu hình thông báo từ SharedPreferences
          bool popupEnabled = true; // mặc định bật nếu chưa có cấu hình
          bool soundEnabled = true;
          final notificationSettingJson = AppData.instance.read<String>(
            AppKeys.SP_NOTIFICATION_SETTING,
          );
          if (notificationSettingJson != null) {
            final notificationSetting = NotificationSettingEntity.fromJson(
              json.decode(notificationSettingJson),
            );
            // Tìm eventConfig tương ứng với eventType nhận được
            final eventConfig = notificationSetting.eventConfigs?.firstWhere(
              (config) => config.eventType == event.eventType,
              orElse: () => EventConfigEntity(popupEnabled: true, soundEnabled: true),
            );
            popupEnabled = eventConfig?.popupEnabled ?? true;
            soundEnabled = eventConfig?.soundEnabled ?? true;

            if (notificationSetting.cooldownValue != null &&
                notificationSetting.cooldownUnit != null) {
              final duration = switch (notificationSetting.cooldownUnit) {
                'MINUTE' => Duration(minutes: notificationSetting.cooldownValue!),
                'SECOND' => Duration(seconds: notificationSetting.cooldownValue!),
                _ => Duration(seconds: 10),
              };
              asyncDelayQueue.updateDelay(duration);
            }
          }

          // Nếu cả 2 đều tắt thì bỏ qua
          if (!popupEnabled && !soundEnabled) return;

          // Play âm thanh nếu soundEnabled == true
          if (soundEnabled &&
              homeContext != null &&
              homeContext.read<AlarmSoundBloc>().state is AlarmSoundLoaded) {
            final alarmSounds =
                (homeContext.read<AlarmSoundBloc>().state as AlarmSoundLoaded).alarmSounds;
            if (alarmSounds.isNotEmpty) {
              final alarmSound = alarmSounds.firstWhere(
                (element) => element.id == event.eventDataEntity.audio,
                orElse: () => alarmSounds[Random().nextInt(alarmSounds.length)],
              );
              audioPlayer.play(alarmSound.localFilePath ?? alarmSound.url);
            }
          }

          // Show popup nếu popupEnabled == true
          if (popupEnabled) {
            // Đóng dialog cũ trước khi hiện dialog mới
            if (_isDialogShowing && rootContext.mounted) {
              Navigator.of(rootContext, rootNavigator: true).pop();
            }

            _isDialogShowing = true;
            final eventName = event.eventType ?? 'Không rõ';
            final evenData = jsonDecode(event.eventData ?? '{}');
            final alertType = AlertType.fromAIAlarmType(AIAlarmType.fromKey(event.eventType ?? ''));
            String? cameraName;
            if (homeContext?.read<MonitorBloc>().state is MonitorSuccess) {
              cameraName = (homeContext!.read<MonitorBloc>().state as MonitorSuccess).allCameras
                  .firstWhereOrNull((element) => listEquals(element.id, event.cameraId))
                  ?.name;
            }

            await AlertDetailPopup.show(
              rootContext,
              alert: NotificationAlertEntity(
                cameraName: cameraName,
                cameraGroupName: cameraName,
                categoryLabel: evenData['eventName'] ?? 'Cảnh báo sự kiện mới',
                message: 'Phát hiện sự kiện: $eventName',
                alertType: alertType,
                time: evenData['timeEvent'] != null
                    ? DateFormat('HH:mm dd/MM/yyyy').format(DateTime.parse(evenData['timeEvent']))
                    : '',
                id: evenData['eventId'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
              ),
              snapshotUrl: event.eventDataEntity.imageUrl ?? '',
              cameraLabel: cameraName,
              onViewDetail: () {
                if (homeContext == null) return;
                showDialog(
                  context: rootContext,
                  builder: (c) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: homeContext.read<EventBloc>()),
                      BlocProvider.value(value: homeContext.read<HomeBloc>()),
                      BlocProvider(
                        create: (context) => PlaybackBloc(context.read(), context.read()),
                      ),
                      BlocProvider.value(value: homeContext.read<StorageFolderBloc>()),
                    ],
                    child: EventDetailDialog(id: event.eventDataEntity.eventId ?? 0),
                  ),
                );
              },
            );

            audioPlayer.stop();
            _isDialogShowing = false;
          }
        }
      });
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
