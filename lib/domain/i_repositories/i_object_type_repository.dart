import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

abstract class IObjectTypeRepository {
  Future<Either<Failure, Map<String, dynamic>>> getObjectTypes({
    int page,
    int size,
    String? keyword,
    String? status,
  });

  Future<Either<Failure, ObjectType>> getObjectTypeDetail(int id);

  Future<Either<Failure, void>> createObjectType(ObjectType data);

  Future<Either<Failure, void>> updateObjectType(int id, ObjectType data);

  Future<Either<Failure, void>> deleteObjectType(int id);

  Future<Either<Failure, List<Map<String, dynamic>>>> getIcons();
}
