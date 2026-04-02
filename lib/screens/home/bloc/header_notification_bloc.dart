import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_notification_repostory.dart';

class HeaderNotificationBloc extends Bloc<HeaderNotificationEvent, HeaderNotificationState> {
  final INotificationRepository notificationRepository;

  HeaderNotificationBloc(this.notificationRepository) : super(HeaderNotificationState()) {
    on<GetNotifications>(_onGetNotifications);
    on<MarkReadNotification>(_onMarkReadNotification);
  }

  FutureOr<void> _onGetNotifications(
    GetNotifications event,
    Emitter<HeaderNotificationState> emit,
  ) async {}

  FutureOr<void> _onMarkReadNotification(
    MarkReadNotification event,
    Emitter<HeaderNotificationState> emit,
  ) async {}
}

// EVENT
class HeaderNotificationEvent extends Equatable {
  const HeaderNotificationEvent();

  @override
  List<Object?> get props => [];
}

class GetNotifications extends HeaderNotificationEvent {
  const GetNotifications();

  @override
  List<Object?> get props => [];
}

class MarkReadNotification extends HeaderNotificationEvent {
  final String notificationId;

  const MarkReadNotification({required this.notificationId});

  @override
  List<Object?> get props => [notificationId];
}

// STATE
class HeaderNotificationState extends Equatable {
  const HeaderNotificationState();

  @override
  List<Object?> get props => [];
}

class GetNotificationsSuccess extends HeaderNotificationState {}

class GetNotificationsFailure extends HeaderNotificationState {
  final String message;

  const GetNotificationsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
