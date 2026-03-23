// Model for Object Type Management

import 'package:vms_flutter_client/core/constants/endpoints.dart';

enum AIFeature {
  face('Khuôn mặt'),
  licensePlate('Biển số');

  const AIFeature(this.displayName);
  final String displayName;

  static AIFeature fromString(String value) {
    switch (value.toUpperCase()) {
      case 'FACE':
        return AIFeature.face;
      case 'LICENSE_PLATE':
        return AIFeature.licensePlate;
      default:
        return AIFeature.face;
    }
  }
}

enum ObjectTypeStatus {
  active('Hoạt động'),
  paused('Tạm dừng');

  const ObjectTypeStatus(this.displayName);
  final String displayName;

  static ObjectTypeStatus fromString(String value) {
    switch (value.toUpperCase()) {
      case 'ACTIVE':
        return ObjectTypeStatus.active;
      case 'PAUSED':
        return ObjectTypeStatus.paused;
      default:
        return ObjectTypeStatus.active;
    }
  }
}

enum FieldDataType {
  text('Văn bản'),
  file('Tệp ảnh');
  // date('Ngày tháng'),
  // number('Số');

  const FieldDataType(this.displayName);
  final String displayName;

  static FieldDataType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'text':
        return FieldDataType.text;
      case 'file':
        return FieldDataType.file;
      // case 'date':
      //   return FieldDataType.date;
      // case 'number':
      //   return FieldDataType.number;
      default:
        return FieldDataType.text;
    }
  }
}

/// Represents a configurable field in an object type
/// Sentinel value used to explicitly clear a nullable field in copyWith
const _sentinel = Object();

/// Represents a configurable field in an object type
class ObjectTypeField {
  final String id;
  final String fieldName;
  final String? iconName; // Icon name (e.g. 'location.svg')
  final String? iconUrl; // Full URL of SVG icon from API
  final String displayName;
  final FieldDataType dataType;
  final bool isDefault;
  final bool isRequired;
  final bool readOnly;

  const ObjectTypeField({
    required this.id,
    required this.fieldName,
    this.iconName,
    this.iconUrl,
    required this.displayName,
    required this.dataType,
    this.isDefault = false,
    this.sortOrder,
    this.isRequired = false,
    this.readOnly = false,
  });

  final int? sortOrder;

  factory ObjectTypeField.fromJson(Map<String, dynamic> json) {
    final iconPath = json['icon'] as String?;
    String? fullIconUrl;
    if (iconPath != null && iconPath.isNotEmpty) {
      fullIconUrl = iconPath.startsWith('http')
          ? iconPath
          : '${EndPoints.baseUrl}$iconPath';
    }
    return ObjectTypeField(
      id: 'field_${json['sortOrder'] ?? 0}_${json['fieldName'] ?? ''}',
      fieldName: json['fieldName'] as String? ?? '',
      iconName: iconPath,
      iconUrl: fullIconUrl,
      displayName: json['displayName'] as String? ?? '',
      dataType: FieldDataType.fromString(json['dataType'] as String? ?? 'text'),
      sortOrder: json['sortOrder'] as int?,
      isRequired: json['isRequired'] as bool? ?? false,
    );
  }

  ObjectTypeField copyWith({
    String? id,
    String? fieldName,
    Object? iconName = _sentinel,
    Object? iconUrl = _sentinel,
    String? displayName,
    FieldDataType? dataType,
    bool? isDefault,
    bool? isRequired,
    bool? readOnly,
  }) {
    return ObjectTypeField(
      id: id ?? this.id,
      fieldName: fieldName ?? this.fieldName,
      iconName: iconName == _sentinel ? this.iconName : iconName as String?,
      iconUrl: iconUrl == _sentinel ? this.iconUrl : iconUrl as String?,
      displayName: displayName ?? this.displayName,
      dataType: dataType ?? this.dataType,
      isDefault: isDefault ?? this.isDefault,
      isRequired: isRequired ?? this.isRequired,
      readOnly: readOnly ?? this.readOnly,
    );
  }

  Map<String, dynamic> toJson(int sortOrder) {
    return {
      'fieldName': fieldName,
      'icon': iconName ?? '',
      'displayName': displayName,
      'dataType': dataType.name,
      'sortOrder': sortOrder,
      'isRequired': isRequired,
    };
  }
}

/// Main Object Type model
class ObjectType {
  final int id;
  final String name;
  final String description;
  final AIFeature aiFeature;
  final String? aiFeatureDisplayName;
  final ObjectTypeStatus status;
  final String? statusDisplayName;
  final int objectCount;
  final List<ObjectTypeField> fields;
  final Map<String, bool>? fieldValuesExistData;
  final String? createdAt;
  final String? updatedAt;

  const ObjectType({
    required this.id,
    required this.name,
    required this.description,
    required this.aiFeature,
    this.aiFeatureDisplayName,
    required this.status,
    this.statusDisplayName,
    required this.fields,
    this.fieldValuesExistData,
    required this.objectCount,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status.name.toUpperCase(),
      'aiFeature': aiFeature.name.toUpperCase(),
      'description': description,
      'dataFields': fields
          .asMap()
          .entries
          .map((e) => e.value.toJson(e.key))
          .toList(),
    };
  }

  factory ObjectType.fromJson(Map<String, dynamic> json) {
    final dataFields =
        (json['dataFields'] as List<dynamic>?)
            ?.map((e) => ObjectTypeField.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    // Parse fieldValuesExistData map
    Map<String, bool>? fieldValuesExist;
    if (json['fieldValuesExistData'] is Map) {
      fieldValuesExist = (json['fieldValuesExistData'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as bool? ?? false));
    }
    return ObjectType(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      aiFeature: AIFeature.fromString(json['aiFeature'] as String? ?? 'FACE'),
      aiFeatureDisplayName: json['aiFeatureDisplayName'] as String?,
      status: ObjectTypeStatus.fromString(
        json['status'] as String? ?? 'ACTIVE',
      ),
      statusDisplayName: json['statusDisplayName'] as String?,
      fields: dataFields,
      fieldValuesExistData: fieldValuesExist,
      objectCount: json['objectCount'] as int? ?? 0,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  ObjectType copyWith({
    int? id,
    String? name,
    String? description,
    AIFeature? aiFeature,
    String? aiFeatureDisplayName,
    ObjectTypeStatus? status,
    String? statusDisplayName,
    List<ObjectTypeField>? fields,
    Map<String, bool>? fieldValuesExistData,
    int? objectCount,
    String? createdAt,
    String? updatedAt,
  }) {
    return ObjectType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      aiFeature: aiFeature ?? this.aiFeature,
      aiFeatureDisplayName: aiFeatureDisplayName ?? this.aiFeatureDisplayName,
      status: status ?? this.status,
      statusDisplayName: statusDisplayName ?? this.statusDisplayName,
      fields: fields ?? this.fields,
      fieldValuesExistData: fieldValuesExistData ?? this.fieldValuesExistData,
      objectCount: objectCount ?? this.objectCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

// ==============================================================================
// MOCK DATA - Remove this class when API is ready
// ==============================================================================

/// Mock data for development.
/// TODO: Remove this class and use API data from repository/bloc instead.
class ObjectTypeMockData {
  ObjectTypeMockData._();

  static const List<ObjectTypeField> defaultFields = [
    ObjectTypeField(
      id: 'default_1',
      fieldName: 'Tên đối tượng',
      displayName: 'Tên cán bộ',
      dataType: FieldDataType.text,
      isDefault: true,
    ),
    ObjectTypeField(
      id: 'default_2',
      fieldName: 'Ảnh nhận diện',
      displayName: 'Ảnh đại diện',
      dataType: FieldDataType.file,
      isDefault: true,
    ),
  ];
}
