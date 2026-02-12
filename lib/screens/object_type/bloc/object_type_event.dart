part of 'object_type_bloc.dart';

class ObjectTypeEvent extends Equatable {
  const ObjectTypeEvent();

  @override
  List<Object?> get props => [];
}

class LoadObjectTypes extends ObjectTypeEvent {
  final int page;
  final int size;
  final String? keyword;
  final String? status;

  const LoadObjectTypes({this.page = 1, this.size = 20, this.keyword, this.status});

  @override
  List<Object?> get props => [page, size, keyword, status];
}

class LoadObjectTypeDetail extends ObjectTypeEvent {
  final int id;

  const LoadObjectTypeDetail({required this.id});

  @override
  List<Object?> get props => [id];
}

class CreateObjectType extends ObjectTypeEvent {
  final ObjectType objectType;

  const CreateObjectType({required this.objectType});

  @override
  List<Object?> get props => [objectType];
}

class UpdateObjectType extends ObjectTypeEvent {
  final int id;
  final ObjectType objectType;

  const UpdateObjectType({required this.id, required this.objectType});

  @override
  List<Object?> get props => [id, objectType];
}

class DeleteObjectType extends ObjectTypeEvent {
  final int id;

  const DeleteObjectType({required this.id});

  @override
  List<Object?> get props => [id];
}
