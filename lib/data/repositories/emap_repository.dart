import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/emap_service.dart';
import 'package:vms_flutter_client/data/mappers/emap_infor_mapper.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/map/camera_emap_info_entity.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_emap_repository.dart';

class EmapRepository extends BaseRepository implements IEmapRepository {
  final EmapService service;

  const EmapRepository(this.service);

  // get list emap
  @override
  Future<Either<Failure, List<EmapInforEntity>>> getListEmap() async {
    return await catchError<List<EmapInforEntity>>(() async {
      final emaps = await service.getListEmap();
      return Right(emaps.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, CameraEmapInfoEntity>> addCameraEmap() async {
    return await catchError<CameraEmapInfoEntity>(() async {
      final emaps = await service.addCameraEmap();
      return Right(emaps.toDomain());
    });
  }
}
