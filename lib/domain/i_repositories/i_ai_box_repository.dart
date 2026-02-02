import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';

abstract class IAiBoxRepository {
  Future<Either<Failure, List<AiBoxEntity>>> listAiBox();
  Future<Either<Failure, AiBoxEntity>> createAiBox({
    required AiBoxEntity request,
  });
}
