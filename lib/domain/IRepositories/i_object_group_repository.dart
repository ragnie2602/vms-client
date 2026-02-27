import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

abstract class IObjectGroupRepository {
  Future<Map<String, dynamic>> getObjectTypes(int page, int size);
  Future<Map<String, dynamic>> getObjects(int objectTypeId, int page, int size);
  Future<ObjectType> getObjectTypeDetail(int id);
  Future<int> uploadFile(String filePath);
  Future<void> createObject(int objectTypeId, Map<String, dynamic> fieldValues);
}
