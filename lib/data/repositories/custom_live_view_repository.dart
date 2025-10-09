import 'package:vms_flutter_client/data/mappers/live_view_mapper.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_custom_live_view_repository.dart';
import 'package:vms_flutter_client/core/base_response.dart';

import '../datasources/custom_live_view_service.dart';
import 'base_repository.dart';

class CustomLiveViewRepository extends BaseRepository implements ICustomLiveViewRepository {
  final CustomLiveViewService service;

  const CustomLiveViewRepository(this.service);

  @override
  Future<Either<Failure, List<CustomLiveView>>> getListCustomLiveView() async {
    return await catchError<List<CustomLiveView>>(() async {
      final liveViews = await service.getListCustomLiveView();
      return Right(liveViews.map((e) => e.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, CustomLiveView>> addCustomLiveView({
    required String name,
    required int baseViewCode,
  }) async {
    return await catchError<CustomLiveView>(() async {
      final liveView = await service.addCustomLiveView(name: name, baseViewCode: baseViewCode);

      return Right(liveView.toDomain());
    });
  }

  @override
  Future<Either<Failure, List<int>>> deleteCustomLiveView(List<int> id) async {
    return await catchError<List<int>>(() async {
      final idDeleted = await service.deleteCustomLiveView(id);

      return Right(idDeleted);
    });
  }

  @override
  Future<Either<Failure, CustomLiveView>> updateCustomLiveView(CustomLiveView newValue) async {
    return await catchError<CustomLiveView>(() async {
      final liveView = await service.updateCustomLiveView(newValue.toPB());

      return Right(liveView.toDomain());
    });
  }
}
