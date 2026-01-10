import 'dart:io';

import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';

abstract class IEmapRepository {
  /// Post Emap with background image
  Future<Either<Failure, EmapEntity>> postEmap({required String emapName, required File imageFile});

  /// Edit Emap
  Future<Either<Failure, EmapEntity>> editEmap({
    required int emapId,
    String? emapName,
    File? imageFile,
  });

  /// Get list of all Emaps
  Future<Either<Failure, List<EmapEntity>>> listEmap();

  /// Remove an Emap
  Future<Either<Failure, int>> removeEmap(int id);

  /// Add camera to Emap
  Future<Either<Failure, EmapEntity>> addCameraEmapInfo({
    required int emapId,
    required double xRatio,
    required double yRatio,
    required List<int> camId,
  });

  /// Delete camera from Emap
  Future<Either<Failure, void>> deleteCameraEmapInfo({
    required int emapId,
    required int cameraEmapInfoId,
  });

  Future<Either<Failure, List<CameraEntity>>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  });
}
