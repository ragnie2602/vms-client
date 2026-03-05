part of 'object_type_bloc.dart';

class ObjectTypeState extends Equatable {
  const ObjectTypeState();

  @override
  List<Object?> get props => [];
}

// --- List states ---

class ObjectTypeLoading extends ObjectTypeState {
  const ObjectTypeLoading();
}

class ObjectTypeLoaded extends ObjectTypeState {
  final List<ObjectType> objectTypes;
  final int totalPages;

  const ObjectTypeLoaded({required this.objectTypes, this.totalPages = 1});

  @override
  List<Object?> get props => [objectTypes, totalPages];
}

class ObjectTypeError extends ObjectTypeState {
  final String message;

  const ObjectTypeError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Detail states ---

class ObjectTypeDetailLoading extends ObjectTypeState {
  const ObjectTypeDetailLoading();
}

class ObjectTypeDetailLoaded extends ObjectTypeState {
  final ObjectType objectType;

  const ObjectTypeDetailLoaded({required this.objectType});

  @override
  List<Object?> get props => [objectType];
}

class ObjectTypeDetailError extends ObjectTypeState {
  final String message;

  const ObjectTypeDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Create states ---

class ObjectTypeCreating extends ObjectTypeState {
  const ObjectTypeCreating();
}

class ObjectTypeCreated extends ObjectTypeState {
  const ObjectTypeCreated();
}

class ObjectTypeCreateError extends ObjectTypeState {
  final String message;

  const ObjectTypeCreateError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Update states ---

class ObjectTypeUpdating extends ObjectTypeState {
  const ObjectTypeUpdating();
}

class ObjectTypeUpdated extends ObjectTypeState {
  const ObjectTypeUpdated();
}

class ObjectTypeUpdateError extends ObjectTypeState {
  final String message;

  const ObjectTypeUpdateError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Delete states ---

class ObjectTypeDeleting extends ObjectTypeState {
  const ObjectTypeDeleting();
}

class ObjectTypeDeleted extends ObjectTypeState {
  const ObjectTypeDeleted();
}

class ObjectTypeDeleteError extends ObjectTypeState {
  final String message;

  const ObjectTypeDeleteError(this.message);

  @override
  List<Object?> get props => [message];
}
