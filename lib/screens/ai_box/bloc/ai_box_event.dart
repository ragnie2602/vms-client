import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';

class AiBoxEvent extends BaseEvent {
  const AiBoxEvent();
}

class GetListAiBoxEvent extends AiBoxEvent {}

class AddAiBoxEvent extends AiBoxEvent {
  final AiBoxEntity aiBox;

  const AddAiBoxEvent({required this.aiBox});

  @override
  List<Object?> get props => [aiBox];
}

class DeleteAiBoxEvent extends AiBoxEvent {
  final int aiBoxId;

  const DeleteAiBoxEvent({required this.aiBoxId});

  @override
  List<Object> get props => [aiBoxId];
}

class EditAiBoxEvent extends AiBoxEvent {
  final int aiBoxId;
  final String name;
  final String? ipAddress;
  final String? description;

  const EditAiBoxEvent({
    required this.aiBoxId,
    required this.name,
    this.ipAddress,
    this.description,
  });
}

class FilterAiBoxEvent extends AiBoxEvent {
  final String? keyword;
  final AiBoxStatus? statusFilter; // -1: all, 0: offline, 1: online

  const FilterAiBoxEvent({this.keyword, this.statusFilter});

  @override
  List<Object?> get props => [keyword, statusFilter];
}
