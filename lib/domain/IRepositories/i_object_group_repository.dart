import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';

abstract class IObjectGroupRepository {
  Future<Map<String, dynamic>> getObjectTypes(int page, int size);
  Future<Map<String, dynamic>> getObjects(
    int objectTypeId,
    int page,
    int subjectGroupId,
    int size, {
    String? search,
  });
  Future<ObjectType> getObjectTypeDetail(int id);
  Future<int> uploadFile(String filePath);
  Future<void> createObject(
    int objectTypeId,
    Map<String, dynamic> fieldValues, {
    List<int>? subjectGroupIds,
    List<int>? fileIds,
  });
  Future<ObjectData> getObjectDetail(int objectId);
  Future<void> updateObject(
    int objectId,
    int objectTypeId,
    Map<String, dynamic> fieldValues, {
    List<int>? subjectGroupIds,
    List<int>? fileIds,
  });
  Future<void> deleteObject(int objectId);
  Future<List<SubjectGroup>> getSubjectGroups();
  Future<void> createSubjectGroup(String name, int parentId);
  Future<Either<Failure, SubjectGroup>> editObjectGroup({
    required int objectGroupId,
    required SubjectGroup request,
  });
  Future<Either<Failure, int>> deleteSubjectGroup({required int objectGroupId});

  /// Download template file for an object type
  Future<String> downloadTemplate(int objectTypeId);

  /// Import objects from a file
  Future<int> importObjects(
    int objectTypeId,
    String filePath,
    List<int> subjectGroupIds,
  );

  /// Get import status by import ID
  Future<Map<String, dynamic>> getImportStatus(int importId);

  /// Export objects to a file
  Future<String> exportObjects(int objectTypeId, {int? subjectGroupId});
}
