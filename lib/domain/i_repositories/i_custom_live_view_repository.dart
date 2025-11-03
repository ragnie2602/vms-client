import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import '../entities/live_view/custom_live_view.dart';

abstract class ICustomLiveViewRepository {
  Future<Either<Failure, List<CustomLiveView>>> getListCustomLiveView();
  Future<Either<Failure, CustomLiveView>> addCustomLiveView({
    required String name,
    required int baseViewCode,
    required List<LiveViewPosition> positions,
  });
  Future<Either<Failure, CustomLiveView>> updateCustomLiveView(CustomLiveView newValue);
  Future<Either<Failure, List<int>>> deleteCustomLiveView(List<int> id);
}
