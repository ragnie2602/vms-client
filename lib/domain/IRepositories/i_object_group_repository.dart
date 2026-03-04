import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

abstract class IObjectGroupRepository {
  Future<Map<String, dynamic>> getObjectTypes(int page, int size);
  Future<Map<String, dynamic>> getObjects(
    int objectTypeId,
    int page,
    int size, {
    String? search,
  });
  Future<ObjectType> getObjectTypeDetail(int id);
  Future<int> uploadFile(String filePath);
  Future<void> createObject(int objectTypeId, Map<String, dynamic> fieldValues);
  Future<ObjectData> getObjectDetail(int objectId);
  Future<void> updateObject(
    int objectId,
    int objectTypeId,
    Map<String, dynamic> fieldValues,
  );
  Future<void> deleteObject(int objectId);
  Future<List<SubjectGroup>> getSubjectGroups();
  Future<void> createSubjectGroup(String name, int parentId);
}
