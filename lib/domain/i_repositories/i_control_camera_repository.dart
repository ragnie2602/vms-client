import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';

abstract class IControlCameraRepository {
  Future<Either<Failure, CheckCameraOnvif?>> validateCamera({
    String? message,
  });
}
