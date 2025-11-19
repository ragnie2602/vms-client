import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart';
import 'package:vms_flutter_client/core/lang/language.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

extension ReplyExts on Reply {
  bool get isSuccess => type == 0;
}

extension PbEnumExt on ProtobufEnum? {
  String translate(int packetTypeValue) {
    if (this == null) return DEFAULT_ERROR_MESSAGE;

    // Access nested map: vi[packetTypeValue][errorCode]
    final errorMap = vi[packetTypeValue];
    if (errorMap == null) {
      return kReleaseMode ? DEFAULT_ERROR_MESSAGE : this!.name;
    }

    final errorCode = this!.name;
    return errorMap[errorCode] ?? (kReleaseMode ? DEFAULT_ERROR_MESSAGE : errorCode);
  }
}

enum PacketType {
  keepAlive(100),
  authenticate(101),
  login(102),
  logout(103),
  register(104),
  updateDeviceToken(105),
  changePassword(106),
  forgotPassword(107),
  feedbackUser(110),
  checkAccountExists(111),

  // Camera
  listCamera(140),
  addCameraRTSP(192),
  onvifDiscoveryCamera(195),
  checkCameraOnvif(247),
  addCameraOnVif(199),
  deleteCamera(155),
  updateCamera(142),
  removeCameraFormGroup(206),
  shareCamera(154),
  checkAccountShare(502),
  resetOnvifCamera(232),
  resetCameraHomeVision(265),
  listShareCamera(178),
  updateShareCamera(179),
  deleteShareCamera(180),
  shareGroupCamera(234),
  deleteShareGroup(238),
  addCameraToGroup(205),
  settingCloudStorage(183),

  getAllGroup(246),
  getAllCamera(245),
  getCameraInGroup(207),
  addGroupCamera(203),
  updateGroupDevice(208),
  removeGroupCamera(204),
  listShareInviteGroup(235),

  configSendEmail(209),
  scheduleRecordingCamera(146),

  configOnOffBarrier(291),
  listVehicle(292),
  updateInfoVehicle(293),
  addVehicle(294),
  deleteVehicle(295),
  getConfigBarrier(296),
  configInOutCam(297),
  configParkingLot(298),

  listNotification(274),
  markReadNotification(275),
  markReadAllNotification(290),
  listSharedCamera(181),
  updateUserAddress(202),
  requestUpdateEmailProfile(114),
  updateEmailProfile(115),
  requestUpdateTelProfile(112),
  updateTelProfile(113),
  cloudDefaultSetting(116),
  listAllCamera(243),
  getEventCloud(194),
  responseShareCamera(176),
  responseShareGroupCamera(236),
  receiveShareCamera(45),
  receiveShareGroupCamera(89),
  receiveOnOffCamera(49),

  getListCustomLiveView(227),
  addCustomLiveView(228),
  configRtspOnvifMotionDetect(210),
  ivaSmokeDetection(250),
  ivaIntrusionDetection(241),
  ivaLineCrossing(240),
  ivaFaceDetection(251),
  ivaAlprConfig(284),
  updateVehiclePlate(286),
  receiveIvaSmokeDetection(1003),
  receiveConfigRtspOnvifMotionDetect(73),
  receiveIvaIntrusionDetection(96),
  receiveIvaLineCrossing(95),
  receiveIvaFaceDetection(1004),
  updateCustomLiveView(229),
  deleteCustomLiveView(230),

  getTimeShiftVideoCloudCamera(182),
  getCloudRecordPlayback(193),
  requestUrlDownload(231),
  getCurrentRecoding(244),

  // Camera tag
  getAllTag(2000),
  addTag(2001),
  deleteTag(2002),
  updateTag(2003),

  // Emap
  postEmap(215),
  listEmap(216),
  listCameraEmapInfo(220),
  addCameraEmapInfo(219),
  deleteCameraEmapInfo(237),
  removeEmap(217),

  // Package
  getPackages(300),
  getBillingHistory(305),
  requestBuyPackage(301),
  responseResultPayment(310),
  setCameraToPackage(303),
  getPackageOfCamera(307),
  getMyPackages(302),
  setPackageToCamera(308),
  requestRenewPackage(306),
  removePackageFromCamera(309),
  getCamCanActive(311),
  editCameraToPackage(312),

  // Receive
  receiveAddCustomLiveView(86),
  receiveUpdateCustomLiveView(87),
  receiveDeleteCustomLiveView(88),
  receiveEventNotification(55),
  receiveConfigSendEmail(72),
  receiveProfile(4),
  receiveDeleteShareCamera(47),
  receiveUpdateRoleShare(60),
  receiveGroupChange(99),
  receiveResponseShareCamera(46),
  receiveDeleteCamera(48),
  receiveDeleteShareGroup(1001),
  receiveResponseShareGroupCamera(90),
  receiveAddCamera(23),
  receiveUpdateCamera(92),
  receiveAddCameraToGroup(69),
  receiveRemoveCameraFormGroup(70),
  receiveUpdateRoleCamera(61),
  receiveScheduleCamera(39),
  receiveNotificationUnReadCount(278),
  receiveNotification(277),

  receiveRequestBuyPackage(1003),
  receiveRequestRenewPackage(1005),
  receiveResponseResultPayment(1008),
  receiveSetPackageToCamera(1006),
  receiveRemovePackageFormCamera(1007),
  receiveSetCameraToPackage(1002),

  receiveNewVideoPlayback(94),
  setCameraLocation(248),

  getNumberNotify(249),
  getTransactionsCanActive(316),
  getEventByLogId(252),

  // vbox
  getListBox(255),
  userAddBox(254),
  userUpdateNameBox(257),
  userRemoveBox(256),

  // user
  listUser(261),
  addUser(258),
  editUser(259),
  deleteUser(260),
  resetPassword(270),

  // HomeVision
  homeVisionFormatSdCard(276),
  homeVisionFlipImage(273),
  updateFwCameraHomeVision(272),
  checkUpdateCameraHomeVision(271),
  updateVolumeCameraHomeVision(279),
  receiveBeginUpdateFwCamera(280),
  receiveUpdateFwSuccessCamera(282),

  apiResponse(0),

  unknown(-1);

  final int value;
  const PacketType(this.value);

  bool get isResponseFromApi => this == apiResponse;

  static final _mapper = {for (var e in PacketType.values) e.value: e};
  factory PacketType.fromValue(int value) => _mapper[value] ?? PacketType.unknown;
}
