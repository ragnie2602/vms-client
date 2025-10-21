import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';

extension AccountSharedMapper on Profile {
  AccountSharedEntity toAccountSharedEntity() {
    return AccountSharedEntity(
      account: account,
      address: hasAddress() ? address : null,
      isSendEmailEvent: hasIsSendEmailEvent() ? isSendEmailEvent : null,
      emailReceive: emailReceive.isNotEmpty ? List.of(emailReceive) : null,
      displayName: hasDisplayName() ? displayName : null,
      cameraRecordOn: hasCameraRecordOn() ? cameraRecordOn : null,
      cameraSdCardFullyOverride: hasCameraSdCardFullyOverride()
          ? cameraSdCardFullyOverride
          : null,
      cloudRecordOn: hasCloudRecordOn() ? cloudRecordOn : null,
      numberDayStorage: hasNumberDayStorage() ? numberDayStorage : null,
      tel: hasTel() ? tel : null,
      email: hasEmail() ? email : null,
      changePassDenied: hasChangePassDenied() ? changePassDenied : null,
      addCamDenied: hasAddCamDenied() ? addCamDenied : null,
      smeName: hasSmeName() ? smeName : null,
      msgUnreadCount: hasMsgUnreadCount() ? msgUnreadCount : null,
      onOffBarrier: hasOnOffBarrier() ? onOffBarrier : null,
      startTime: hasStartTime() ? startTime : null,
      endTime: hasEndTime() ? endTime : null,
      userType: hasUserType() ? userType.value : null,
    );
  }
}

extension InviteMessageMapper on InviteMessage {
  InviteMessageEntity toEntity() {
    return InviteMessageEntity(
      cameraId: cameraId,
      role: role.value,
      status: status.value,
      accountShare: hasAccountShare()
          ? accountShare.toAccountSharedEntity()
          : null,
      accountShared: hasAccountShared()
          ? accountShared.toAccountSharedEntity()
          : null,
      lastUpdate: lastUpdate,
      accountShareId: accountShareId,
      accountSharedId: accountSharedId,
      timeShare: timeShare,
      shareType: shareType.value,
      groupId: groupId,
      groupShareRole: groupShareRole.value,
      inviteMsgId: inviteMsgId,
    );
  }
}
