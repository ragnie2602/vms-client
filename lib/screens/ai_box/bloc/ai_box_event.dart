import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';

class AiBoxEvent extends BaseEvent {
  const AiBoxEvent();
}

class GetListAiBoxEvent extends AiBoxEvent {
  const GetListAiBoxEvent();
}

class AddAiBoxEvent extends AiBoxEvent {
  final AiBoxEntity aiBox;

  const AddAiBoxEvent({required this.aiBox});

  @override
  List<Object?> get props => [aiBox];
}

class DeleteAiBoxEvent extends AiBoxEvent {
  final AiBoxEntity aiBox;
  const DeleteAiBoxEvent({required this.aiBox});

  @override
  List<Object> get props => [aiBox];
}

class EditAiBoxEvent extends AiBoxEvent {
  final int aiBoxId;
  final AiBoxEntity aiBox;

  const EditAiBoxEvent({required this.aiBoxId, required this.aiBox});

  @override
  List<Object?> get props => [aiBoxId, aiBox];
}

class FilterAiBoxEvent extends AiBoxEvent {
  final String? keyword;
  final AiBoxStatus? statusFilter; // -1: all, 0: offline, 1: online

  const FilterAiBoxEvent({this.keyword, this.statusFilter});

  @override
  List<Object?> get props => [keyword, statusFilter];
}

class GetAiBoxAtPage extends AiBoxEvent {
  final int page;

  const GetAiBoxAtPage(this.page);

  @override
  List<Object?> get props => [page];
}
