import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/ai_box_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_ai_box_repository.dart';

class AiBoxRepository extends BaseRepository implements IAiBoxRepository {
  final AiBoxService service;
  const AiBoxRepository({required this.service});
  @override
  Future<Either<Failure, List<AiBoxEntity>>> listAiBox() async {
    return await catchError<List<AiBoxEntity>>(() async {
      final data = await service.getListAiBox();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, AiBoxEntity>> createAiBox({
    required AiBoxEntity request,
  }) async {
    return await catchError<AiBoxEntity>(() async {
      final data = await service.postCreateAiBox(request: request);
      return Right(data);
    });
  }
  
  @override
  Future<Either<Failure, int>> removeAiBox(int id) async{
     return await catchError<int>(() async {
      await service.deleteAiBox(aiBoxId: id);
      return Right(id);
    });
  }
}
