import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

abstract class ObjectGroupEvent extends Equatable {
  const ObjectGroupEvent();

  @override
  List<Object?> get props => [];
}
class InitializeObjectGroup extends ObjectGroupEvent {
  final int page;
  final int size;

  const InitializeObjectGroup({this.page = 1, this.size = 20});

  @override
  List<Object> get props => [page, size];
}
class LoadObjectGroups extends ObjectGroupEvent {
  final int page;
  final int size;

  const LoadObjectGroups({this.page = 1, this.size = 20});

  @override
  List<Object> get props => [page, size];
}

class SelectObjectType extends ObjectGroupEvent {
  final ObjectType objectType;
  final int page;
  final int size;

  const SelectObjectType(this.objectType, {this.page = 1, this.size = 20});

  @override
  List<Object> get props => [objectType, page, size];
}

class LoadObjects extends ObjectGroupEvent {
  final int objectTypeId;
  final int page;
  final int size;

  const LoadObjects({required this.objectTypeId, this.page = 1, this.size = 20});

  @override
  List<Object> get props => [objectTypeId, page, size];
}
