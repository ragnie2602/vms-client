import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_type_repository.dart';

part 'object_type_event.dart';
part 'object_type_state.dart';

class ObjectTypeBloc extends Bloc<ObjectTypeEvent, ObjectTypeState> {
  final IObjectTypeRepository repository;

  ObjectTypeBloc(this.repository) : super(const ObjectTypeState()) {
    on<LoadObjectTypes>(_onLoadObjectTypes);
    on<LoadObjectTypeDetail>(_onLoadObjectTypeDetail);
    on<CreateObjectType>(_onCreateObjectType);
    on<UpdateObjectType>(_onUpdateObjectType);
    on<DeleteObjectType>(_onDeleteObjectType);
  }

  FutureOr<void> _onLoadObjectTypes(
    LoadObjectTypes event,
    Emitter<ObjectTypeState> emit,
  ) async {
    emit(const ObjectTypeLoading());

    final res = await repository.getObjectTypes(
      page: event.page,
      size: event.size,
      keyword: event.keyword,
      status: event.status,
    );

    res.fold((failure) => emit(ObjectTypeError(failure.parseMessage())), (
      data,
    ) {
      final items = data['items'] as List<ObjectType>;
      final totalPages = data['totalPages'] as int? ?? 1;
      emit(ObjectTypeLoaded(objectTypes: items, totalPages: totalPages));
    });
  }

  FutureOr<void> _onLoadObjectTypeDetail(
    LoadObjectTypeDetail event,
    Emitter<ObjectTypeState> emit,
  ) async {
    emit(const ObjectTypeDetailLoading());

    final res = await repository.getObjectTypeDetail(event.id);

    res.fold(
      (failure) => emit(ObjectTypeDetailError(failure.parseMessage())),
      (objectType) => emit(ObjectTypeDetailLoaded(objectType: objectType)),
    );
  }

  FutureOr<void> _onCreateObjectType(
    CreateObjectType event,
    Emitter<ObjectTypeState> emit,
  ) async {
    emit(const ObjectTypeCreating());

    final res = await repository.createObjectType(event.objectType);

    res.fold(
      (failure) => emit(ObjectTypeCreateError(failure.parseMessage())),
      (_) => emit(const ObjectTypeCreated()),
    );
  }

  FutureOr<void> _onUpdateObjectType(
    UpdateObjectType event,
    Emitter<ObjectTypeState> emit,
  ) async {
    emit(const ObjectTypeUpdating());

    final res = await repository.updateObjectType(event.id, event.objectType);

    res.fold(
      (failure) => emit(ObjectTypeUpdateError(failure.parseMessage())),
      (_) => emit(const ObjectTypeUpdated()),
    );
  }

  FutureOr<void> _onDeleteObjectType(
    DeleteObjectType event,
    Emitter<ObjectTypeState> emit,
  ) async {
    emit(const ObjectTypeDeleting());

    final res = await repository.deleteObjectType(event.id);

    res.fold(
      (failure) => emit(ObjectTypeDeleteError(failure.parseMessage())),
      (_) => emit(const ObjectTypeDeleted()),
    );
  }
}
