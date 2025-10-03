import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

abstract class IGroupRepository {
  Future<Either<Failure, List<DeviceGroup>>> getAllGroup();
}
