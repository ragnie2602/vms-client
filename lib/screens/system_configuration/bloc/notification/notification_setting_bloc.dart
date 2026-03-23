import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_setting_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_notication_repostory.dart';

part 'notification_setting_event.dart';
part 'notification_setting_state.dart';

class NotificationBloc
    extends Bloc<NotificationSettingEvent, NotificationSettingState> {
  NotificationBloc(this._notificationSettingRepository)
    : super(const NotificationSettingState()) {
    on<UpdateNotificationSettingEvent>(_onUpdateNotificationSetting);
  }
  final INotificationRepository _notificationSettingRepository;

  Future<void> _onUpdateNotificationSetting(
    UpdateNotificationSettingEvent event,
    Emitter<NotificationSettingState> emit,
  ) async {
    emit(const NotificationSettingLoading());

    try {
      final result = await _notificationSettingRepository.updateNotificationSetting(
        event.notificationSetting,
      );

      if (result.isLeft) {
        emit(NotificationSettingLoadFailed(message: result.left.toString()));
      } else {
        final notificationSetting = result.right!;

        // save notification setting
        final jsonString = json.encode(notificationSetting.toJson());
        await AppData.instance.save<String>(AppKeys.SP_NOTIFICATION_SETTING, jsonString);

        emit(NotificationSettingLoaded(notificationSetting: notificationSetting));
      }
    } catch (e) {
      emit(NotificationSettingLoadFailed(message: e.toString()));
    }
  }
}
