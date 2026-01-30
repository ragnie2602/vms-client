import 'package:vms_flutter_client/core/base_bloc.dart';

class AiBoxEvent extends BaseEvent {
  const AiBoxEvent();
}

class GetListAiBoxEvent extends AiBoxEvent {}

class AddAiBoxEvent extends AiBoxEvent {
  final String name;
  final String? ipAddress;
  final String? description;

  const AddAiBoxEvent({required this.name, this.ipAddress, this.description});
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

class SearchAiBoxEvent extends AiBoxEvent {
  final String keyword;

  const SearchAiBoxEvent({required this.keyword});

  @override
  List<Object?> get props => [keyword];
}
