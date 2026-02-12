import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/object_type_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_type_repository.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

class ObjectTypeRepository extends BaseRepository implements IObjectTypeRepository {
  final ObjectTypeService service;
  const ObjectTypeRepository(this.service);

  @override
  Future<Either<Failure, List<ObjectType>>> getObjectTypes({
    int page = 1,
    int size = 20,
    String? keyword,
    String? status,
  }) async {
    return await catchError<List<ObjectType>>(() async {
      final data = await service.getObjectTypes(
        page: page,
        size: size,
        keyword: keyword,
        status: status,
      );
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, ObjectType>> getObjectTypeDetail(int id) async {
    return await catchError<ObjectType>(() async {
      final data = await service.getObjectTypeDetail(id);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, void>> createObjectType(ObjectType data) async {
    return await catchError<void>(() async {
      await service.createObjectType(data.toJson());
      return const Right(null);
    });
  }

  @override
  Future<Either<Failure, void>> updateObjectType(int id, ObjectType data) async {
    return await catchError<void>(() async {
      await service.updateObjectType(id, data.toJson());
      return const Right(null);
    });
  }

  @override
  Future<Either<Failure, void>> deleteObjectType(int id) async {
    return await catchError<void>(() async {
      await service.deleteObjectType(id);
      return const Right(null);
    });
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getIcons() async {
    return await catchError<List<Map<String, dynamic>>>(() async {
      final data = await service.getIcons();
      return Right(data);
    });
  }
}
