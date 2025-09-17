import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/core/lang/language.dart';

enum StateType {
  initial,
  loading,
  success,
  failure,
  empty;

  bool get isError => this == StateType.failure;
  bool get isSuccess => this == StateType.success;
  bool get isEmpty => this == StateType.empty;
  bool get isLoading => this == StateType.loading || StateType.initial == this;
}

abstract class BaseState extends Equatable {
  const BaseState();

  StateType get type => StateType.initial;
  String get errorMsg => DEFAULT_ERROR_MESSAGE;

  @override
  List<Object?> get props => [];
}

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object?> get props => [];
}

abstract class BaseBloc<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
}
