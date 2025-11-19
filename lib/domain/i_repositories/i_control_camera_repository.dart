import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';
import 'package:vms_flutter_client/domain/entities/camera/remove_camera_from_group_entity.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart'
    show InviteMessageEntity;
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';

import '../entities/camera/add_camera.dart';

abstract class IControlCameraRepository {
  Future<Either<Failure, CameraOnvif?>> validateCamera({String? message});
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  });
  Future<Either<Failure, List<CameraEntity>>> getCamerasInGroup({
    List<int>? groupId,
  });
  Future<Either<Failure, RemoveCameraFromGroupEntity>> removeCameraFromGroup({
    required List<int> cameraId,
    required List<int> groupId,
  });
  Future<Either<Failure, CameraOnvif>> checkCameraOnvif({
    required String xaddrs,
    required String userName,
    required String password,
    List<int>? boxId,
  });
  Future<Either<Failure, AddCameraEntity>> addCameraRTSP({
    required String name,
    required String username,
    required String password,
    required String rtspUrl,
    CameraMap? location,
    List<int>? boxId,
    List<int>? groupId,
    List<String>? subStreamUrls,
  });
  Future<Either<Failure, AddCameraEntity>> addCameraOnvif({
    required String name,
    required String username,
    required String password,
    required String onvifDeviceIp,
    String? rtspUrl,
    String? serialNumber,
    CameraMap? location,
    List<int>? boxId,
    List<int>? groupId,
    String? urn,
    List<String>? subStreamUrls,
  });

  Future<Either<Failure, CameraEntity>> updateCamera({
    required List<int> cameraId,
    String? name,
    String? rtspUrl,
    String? userName,
    String? password,
    String? xaddr,
    CameraMap? location,
    List<String>? subStreamUrls,
  });

  Future<Either<Failure, List<int>>> deleteCamera({
    required List<int> cameraId,
  });

  Future<Either<Failure, List<int>>> shareCamera({
    required List<int> cameraId,
    required int role,
    required String accountInvite,
  });

  Future<Either<Failure, ({bool isExists, List<int> accountInviteId})>>
  checkAccountShare({
    List<int>? cameraId,
    required String account,
    required int shareType,
    List<int>? groupId,
  });

  Future<Either<Failure, List<CameraEntity>>> addCameraToGroup({
    required List<List<int>> cameraIds,
    required List<int> groupId,
  });

  // Future<Either<Failure, List<InviteMessageEntity>>> listShareInviteGroup({
  //   required List<int> groupId,
  // });

  Future<Either<Failure, List<InviteMessageEntity>>> listShareCamera({
    required List<int> cameraId,
  });

  Future<Either<Failure, List<int>>> deleteShareCamera({
    required List<int> cameraId,
    required String accountB,
    required List<int> shareId,
  });

  // Camera tags
  Future<Either<Failure, List<TagEntity>>> getAllTag();
}
