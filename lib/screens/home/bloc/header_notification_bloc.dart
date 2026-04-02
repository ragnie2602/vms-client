import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/notification/header_notification.dart';
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
  ) async {
    final result = await notificationRepository.getNotifications(
      lastNotificationId: event.lastNotificationId,
    );

    result.fold(
      (failure) => emit(GetNotificationsFailure(message: failure.toString())),
      (data) => emit(GetNotificationsSuccess(unreadCount: data.$1, notifications: data.$2)),
    );
  }

  FutureOr<void> _onMarkReadNotification(
    MarkReadNotification event,
    Emitter<HeaderNotificationState> emit,
  ) async {
    final result = await notificationRepository.markReadNotification(event.notificationId);

    result.fold(
      (failure) => emit(MarkReadNotificationFailure(message: failure.toString())),
      (data) => emit(MarkReadNotificationSuccess(data)),
    );
  }
}

// EVENT
class HeaderNotificationEvent extends Equatable {
  const HeaderNotificationEvent();

  @override
  List<Object?> get props => [];
}

class GetNotifications extends HeaderNotificationEvent {
  final int? lastNotificationId;

  const GetNotifications({this.lastNotificationId});

  @override
  List<Object?> get props => [lastNotificationId];
}

class MarkReadNotification extends HeaderNotificationEvent {
  final int notificationId;

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

class GetNotificationsSuccess extends HeaderNotificationState {
  final int unreadCount;
  final List<HeaderNotification> notifications;

  const GetNotificationsSuccess({this.unreadCount = 0, this.notifications = const []});

  @override
  List<Object?> get props => [unreadCount, notifications];
}

class GetNotificationsFailure extends HeaderNotificationState {
  final String message;

  const GetNotificationsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class MarkReadNotificationSuccess extends HeaderNotificationState {
  final int notificationId;

  const MarkReadNotificationSuccess(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

class MarkReadNotificationFailure extends HeaderNotificationState {
  final String message;

  const MarkReadNotificationFailure({required this.message});
}
