import 'package:fixnum/fixnum.dart';

class AccountSharedEntity {
  final String account;
  final String? address;
  final bool? isSendEmailEvent;
  final List<String>? emailReceive;
  final String? displayName;
  final bool? cameraRecordOn;
  final bool? cameraSdCardFullyOverride;
  final bool? cloudRecordOn;
  final int? numberDayStorage;
  final String? tel;
  final String? email;
  final bool? changePassDenied;
  final bool? addCamDenied;
  final String? smeName;
  final int? msgUnreadCount;
  final bool? onOffBarrier;
  final String? startTime;
  final String? endTime;
  final int? userType; // Map từ Profile_Type

  const AccountSharedEntity({
    required this.account,
    this.address,
    this.isSendEmailEvent,
    this.emailReceive,
    this.displayName,
    this.cameraRecordOn,
    this.cameraSdCardFullyOverride,
    this.cloudRecordOn,
    this.numberDayStorage,
    this.tel,
    this.email,
    this.changePassDenied,
    this.addCamDenied,
    this.smeName,
    this.msgUnreadCount,
    this.onOffBarrier,
    this.startTime,
    this.endTime,
    this.userType,
  });
}

class InviteMessageEntity {
  final List<int> cameraId;
  final int role; // Map từ InviteMessage_Role
  final int status; // Map từ InviteMessage_Status
  final AccountSharedEntity? accountShare; // có thể null nếu server không set
  final AccountSharedEntity? accountShared; // người được share
  final Int64 lastUpdate;
  final List<int> accountShareId;
  final List<int> accountSharedId;
  final Int64 timeShare;
  final int shareType; // Map từ InviteMessage_ShareType
  final List<int> groupId;
  final int groupShareRole; // Map từ InviteMessage_GroupShareRole
  final List<int> inviteMsgId;

  const InviteMessageEntity({
    required this.cameraId,
    required this.role,
    required this.status,
    required this.accountShare,
    required this.accountShared,
    required this.lastUpdate,
    required this.accountShareId,
    required this.accountSharedId,
    required this.timeShare,
    required this.shareType,
    required this.groupId,
    required this.groupShareRole,
    required this.inviteMsgId,
  });
}
