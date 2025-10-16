import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/camera/add_camera.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity_onvif.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_onvif.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_stream.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_type.dart';

extension CameraTypeMapper on pb.CameraType {
  CameraType toDomain() {
    return CameraType.fromValue(value);
  }
}

extension CameraStatusMapper on pb.Camera_Status {
  CameraStatus toDomain() {
    return CameraStatus.fromValue(value);
  }
}

extension CameraStreamResolutionMapper on pb.CameraStream_Resolution {
  CameraStreamResolution toDomain() {
    return CameraStreamResolution(width: width, height: height);
  }
}

extension CameraStreamEncoderMapper on pb.CameraStream_Encoder {
  CameraStreamEncoder toDomain() {
    return CameraStreamEncoder(quality: quality, framerate: framerate, bitrate: bitrate, encoding: encoding);
  }
}

extension CameraStreamPtzRangeValueMapper on pb.CameraStream_PtzRange_range {
  CameraStreamPtzRangeValue toDomain() {
    return CameraStreamPtzRangeValue(min: min, max: max);
  }
}

extension CameraStreamPtzRangeMapper on pb.CameraStream_PtzRange {
  CameraStreamPtzRange toDomain() {
    return CameraStreamPtzRange(x: x.toDomain(), y: y.toDomain(), z: z.toDomain());
  }
}

extension CameraStreamDefaultURLMapper on pb.CameraStream_DefaultURL {
  CameraStreamDefaultURL toDomain() {
    return CameraStreamDefaultURL.fromValue(value);
  }
}

extension CameraStreamUrlStreamTypeMapper on pb.CameraStream_UrlStream_StreamType {
  CameraStreamUrlStreamType toDomain() {
    return CameraStreamUrlStreamType.fromValue(value);
  }
}

extension CameraStreamUrlStreamMapper on pb.CameraStream_UrlStream {
  CameraStreamUrlStream toDomain() {
    return CameraStreamUrlStream(
      isDefault: isDefault,
      nameOfStream: nameOfStream,
      urlOfStream: urlOfStream,
      stype: stype.toDomain(),
      isMainStream: isMainStream,
      originStream: originStream,
    );
  }
}

extension CameraStreamMapper on pb.CameraStream {
  CameraStream toDomain() {
    return CameraStream(
      streamOriginUrl: streamOriginUrl,
      streamIvaUrl: streamIvaUrl,
      streamName: streamName,
      res: hasRes() ? res.toDomain() : null,
      encoder: hasEncoder() ? encoder.toDomain() : null,
      ptzRange: hasPtzRange() ? ptzRange.toDomain() : null,
      userOriginAddedUrl: userOriginAddedUrl,
      streamHlsUrl: streamHlsUrl,
      defaultUrl: defaultUrl.toDomain(),
      streamLinks: streamLinks.map((e) => e.toDomain()).toList(),
    );
  }
}

extension CameraStreamOnvifMapper on pb.Onvif {
  CameraEntityOnvif toDomain() {
    return CameraEntityOnvif(urn: urn, name: name, hardware: hardware, xaddr: xaddr, scopes: scopes, onvifRtspUrl: onvifRtspUrl);
  }
}

extension CameraMapper on pb.Camera {
  CameraEntity toDomain() {
    return CameraEntity(
      name: name,
      id: id,
      groupOwnerId: groupOwnerId,
      camId: camId,
      username: username,
      password: password,
      iPUrlStream: streamUrl.userOriginAddedUrl,
      timeAdded: timeAdded,
      type: cameraType.toDomain(),
      status: status.toDomain(),
      stream: streamUrl.toDomain(),
      onvif: onvif.toDomain(),
    );
  }
}

extension CameraOnvifMapper on CheckCameraOnvif_Reply {
  CameraOnvif toDomain() {
    return CameraOnvif(rtspUrl: rtspUrl, serialNumber: serialNumber, subStreamUrl: subStreamUrl.toList());
  }
}

extension MapLocationMapper on CameraMap {
  pb.MapLocation toMapper() {
    return pb.MapLocation(lat: lat, log: log, locationDes: locationDes);
  }
}

extension AddCameraRTSPMapper on AddCameraRTSP_Reply {
  AddCameraEntity toDomain() {
    return AddCameraEntity(cameraId: cameraId, camera: camera.toDomain());
  }
}

extension AddCameraOnvifMapper on AddCameraOnVif_Reply {
  AddCameraEntity toDomain() {
    return AddCameraEntity(cameraId: cameraId, camera: camera.toDomain());
  }
}
