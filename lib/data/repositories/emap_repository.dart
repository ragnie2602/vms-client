import 'dart:io';

import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/emap_service.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';

import 'base_repository.dart';

class EmapRepository extends BaseRepository implements IEmapRepository {
  final EmapService service;

  const EmapRepository(this.service);

  @override
  Future<Either<Failure, List<EmapEntity>>> listEmap() async {
    return await catchError<List<EmapEntity>>(() async {
      final data = await service.listEmap();
      return Right(data.map<EmapEntity>((e) => EmapEntity.fromJson(e)).toList());
    });
  }

  @override
  Future<Either<Failure, EmapEntity>> postEmap({
    required String emapName,
    required File imageFile,
  }) async {
    return await catchError<EmapEntity>(() async {
      final data = await service.postEmap(emapName: emapName, imageFile: imageFile);

      return Right(EmapEntity.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, int>> removeEmap(int id) async {
    return await catchError<int>(() async {
      await service.removeEmap(id);

      return Right(id);
    });
  }

  @override
  Future<Either<Failure, EmapEntity>> addCameraEmapInfo({
    required int emapId,
    required double xRatio,
    required double yRatio,
    required List<int> camId,
  }) async {
    return await catchError<EmapEntity>(() async {
      final data = await service.addCameraEmapInfo(
        emapId: emapId,
        xRatio: xRatio,
        yRatio: yRatio,
        camId: String.fromCharCodes(camId),
      );

      return Right(EmapEntity.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, EmapEntity>> updateCameraEmapInfo({
    required int emapId,
    required int cameraEmapInfoId,
    required double xRatio,
    required double yRatio,
  }) async {
    return await catchError<EmapEntity>(() async {
      final data = await service.updateCameraEmapInfo(
        emapId: emapId,
        cameraEmapInfoId: cameraEmapInfoId,
        xRatio: xRatio,
        yRatio: yRatio,
      );
      return Right(EmapEntity.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, EmapEntity>> deleteCameraEmapInfo({
    required int emapId,
    required int cameraEmapInfoId,
  }) async {
    return await catchError<EmapEntity>(() async {
      final data = await service.deleteCameraEmapInfo(
        emapId: emapId,
        cameraEmapInfoId: cameraEmapInfoId,
      );
      return Right(EmapEntity.fromJson(data));
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

  @override
  Future<Either<Failure, EmapEntity>> editEmap({
    required int emapId,
    String? emapName,
    File? imageFile,
  }) async {
    return await catchError<EmapEntity>(() async {
      final data = await service.editEmap(emapId: emapId, emapName: emapName, imageFile: imageFile);
      return Right(EmapEntity.fromJson(data));
    });
  }
}
