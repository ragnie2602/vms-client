import 'dart:typed_data';

import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/emap_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/data/mappers/emap_mapper.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';

import 'base_repository.dart';

class EmapRepository extends BaseRepository implements IEmapRepository {
  final EmapService service;

  const EmapRepository(this.service);

  @override
  Future<Either<Failure, EmapEntity>> postEmap({
    required String emapName,
    required String imagePath,
    required Uint8List imageBytes,
    required String serverUrl,
    List<int>? emapId,
    List<int>? userId,
  }) async {
    return await catchError<EmapEntity>(() async {
      final emapInfo = await service.postEmap(
        emapName: emapName,
        imagePath: imagePath,
        imageBytes: imageBytes,
        serverUrl: serverUrl,
        emapId: emapId,
        userId: userId,
      );

      return Right(emapInfo.toDomain());
    });
  }

  @override
  Future<Either<Failure, List<EmapEntity>>> listEmap() async {
    return await catchError<List<EmapEntity>>(() async {
      final emaps = await service.listEmap();
      return Right(emaps.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<int>>> removeEmap({
    required List<int> emapId,
  }) async {
    return await catchError<List<int>>(() async {
      final removedId = await service.removeEmap(emapId: emapId);
      return Right(removedId);
    });
  }

  @override
  Future<Either<Failure, List<CameraEmapInfoEntity>>> listCameraEmapInfo({
    required List<int> emapId,
  }) async {
    return await catchError<List<CameraEmapInfoEntity>>(() async {
      final cameraInfos = await service.listCameraEmapInfo(emapId: emapId);
      return Right(cameraInfos.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, CameraEmapInfoEntity>> addCameraEmapInfo({
    required List<int> emapId,
    required CameraEmapInfoEntity cameraEmapinfo,
  }) async {
    return await catchError<CameraEmapInfoEntity>(() async {
      final cameraInfo = await service.addCameraEmapInfo(
        emapId: emapId,
        info: cameraEmapinfo.toProto(),
      );
      return Right(cameraInfo.toDomain());
    });
  }

  @override
  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  }) async {
    return await catchError<List<CameraEntity>>(() async {
      final cameras = await service.getAllCamera(
        cameraId: cameraId,
        status: status,
        ivaType: ivaType,
      );

      return Right(cameras.map((e) => e.toDomain()).toList());
    });
  }
}
