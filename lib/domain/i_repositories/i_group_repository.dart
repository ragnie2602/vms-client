import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

abstract class IGroupRepository {
  Future<Either<Failure, List<DeviceGroup>>> getAllGroup();
}
