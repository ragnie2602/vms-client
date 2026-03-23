import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';

enum DetectStatus { initial, loading, success, failure }

class DetectState extends Equatable {
  final DetectStatus status;
  final String errorMessage;
  final List<EventType> typeEvents;
  final List<ReceiveEventEntity> receiveEvents;
  final List<ReceiveEventEntity> selectedEvents;
  final List<String> selectedFilterTypes;
  final int currentTabIndex;
  final List<List<int>> viewingCameraIds;
  final bool hasReachedMaxEvents;

  const DetectState({
    this.status = DetectStatus.initial,
    this.errorMessage = '',
    this.typeEvents = const [],
    this.receiveEvents = const [],
    this.selectedEvents = const [],
    this.selectedFilterTypes = const [],
    this.currentTabIndex = 0,
    this.viewingCameraIds = const [],
    this.hasReachedMaxEvents = false,
  });

  bool get hasActiveFilter => selectedFilterTypes.isNotEmpty;
  bool get isViewingCamTab => currentTabIndex == 1;
  bool get shouldShowSelectedEvents => hasActiveFilter || isViewingCamTab;

  DetectState copyWith({
    DetectStatus? status,
    String? errorMessage,
    List<EventType>? typeEvents,
    List<ReceiveEventEntity>? receiveEvents,
    List<ReceiveEventEntity>? selectedEvents,
    List<String>? selectedFilterTypes,
    int? currentTabIndex,
    List<List<int>>? viewingCameraIds,
    bool? hasReachedMaxEvents,
  }) {
    return DetectState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      typeEvents: typeEvents ?? this.typeEvents,
      receiveEvents: receiveEvents ?? this.receiveEvents,
      selectedEvents: selectedEvents ?? this.selectedEvents,
      selectedFilterTypes: selectedFilterTypes ?? this.selectedFilterTypes,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      viewingCameraIds: viewingCameraIds ?? this.viewingCameraIds,
      hasReachedMaxEvents: hasReachedMaxEvents ?? this.hasReachedMaxEvents,
    );
  }

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    typeEvents,
    receiveEvents,
    selectedEvents,
    selectedFilterTypes,
    currentTabIndex,
    viewingCameraIds,
    hasReachedMaxEvents,
  ];
}
