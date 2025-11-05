import 'dart:typed_data';

import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';

abstract class IEmapRepository {
  /// Post/Update Emap with background image
  Future<Either<Failure, EmapEntity>> postEmap({
    required String emapName,
    required String imagePath,
    required Uint8List imageBytes,
    List<int>? emapId,
    List<int>? userId,
  });

  /// Get list of all Emaps
  Future<Either<Failure, List<EmapEntity>>> listEmap();

  /// Remove an Emap
  Future<Either<Failure, List<int>>> removeEmap({required List<int> emapId});

  /// Get camera positions on an Emap
  Future<Either<Failure, List<CameraEmapInfoEntity>>> listCameraEmapInfo({
    required List<int> emapId,
  });

  /// Add camera to Emap
  Future<Either<Failure, CameraEmapInfoEntity>> addCameraEmapInfo({
    required List<int> emapId,
    required CameraEmapInfoEntity info,
  });
}
