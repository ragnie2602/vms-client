import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';

abstract class ObjectGroupEvent extends Equatable {
  const ObjectGroupEvent();

  @override
  List<Object?> get props => [];
}

class ResetObjectGroupState extends ObjectGroupEvent {
  const ResetObjectGroupState();
}

class InitializeObjectGroup extends ObjectGroupEvent {
  final int page;
  final int size;

  const InitializeObjectGroup({this.page = 1, this.size = 20});

  @override
  List<Object> get props => [page, size];
}

class LoadObjectTypes extends ObjectGroupEvent {
  final int page;
  final int size;

  const LoadObjectTypes({this.page = 1, this.size = 20});

  @override
  List<Object> get props => [page, size];
}

class SelectObjectType extends ObjectGroupEvent {
  final ObjectType objectType;
  final int page;
  final int size;
  final int subjectGroupId;
  const SelectObjectType(
    this.objectType, {
    this.page = 1,
    this.size = 20,
    this.subjectGroupId = 0,
  });

  @override
  List<Object> get props => [objectType, page, size];
}

class LoadObjects extends ObjectGroupEvent {
  final int objectTypeId;
  final int page;
  final int size;
  final int subjectGroupId;
  final String? search;

  const LoadObjects({
    required this.objectTypeId,
    this.page = 1,
    this.size = 20,
    this.subjectGroupId = 0,
    this.search,
  });

  @override
  List<Object?> get props => [objectTypeId, page, size, search];
}

class LoadSubjectGroups extends ObjectGroupEvent {
  const LoadSubjectGroups();
}

class CreateSubjectGroup extends ObjectGroupEvent {
  final String name;
  final int parentId;
  final void Function()? onSuccess;
  final void Function(String)? onError;

  const CreateSubjectGroup({
    required this.name,
    required this.parentId,
    this.onSuccess,
    this.onError,
  });

  @override
  List<Object?> get props => [name, parentId, onSuccess, onError];
}

class UpdateSubjectGroup extends ObjectGroupEvent {
  final int id;
  final SubjectGroup? subjectGroup;
  final void Function()? onSuccess;
  final void Function(String)? onError;

  const UpdateSubjectGroup({
    required this.id,
    this.subjectGroup,
    this.onSuccess,
    this.onError,
  });

  @override
  List<Object?> get props => [id, subjectGroup, onSuccess, onError];
}

class DeleteSubjectGroup extends ObjectGroupEvent {
  final int id;
  final void Function()? onSuccess;
  final void Function(String)? onError;

  const DeleteSubjectGroup({required this.id, this.onSuccess, this.onError});

  @override
  List<Object?> get props => [id, onSuccess, onError];
}

class SearchSubjectGroup extends ObjectGroupEvent {
  final String query;

  const SearchSubjectGroup({required this.query});

  @override
  List<Object> get props => [query];
}

class SelectSubjectGroup extends ObjectGroupEvent {
  final SubjectGroup? subjectGroup;

  const SelectSubjectGroup(this.subjectGroup);

  @override
  List<Object?> get props => [subjectGroup];
}
