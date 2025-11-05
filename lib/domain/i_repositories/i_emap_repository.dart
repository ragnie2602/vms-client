import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';

abstract class IEmapRepository {
  Future<Either<Failure, List<EmapInforEntity>>> getListEmap();
  Future<Either<Failure, List<int>>> removeEmap({required List<int>? emapId});
}
