// Model for Object Type Management
//
// NOTE: This file contains mock data at the bottom.
// When API is ready, remove the `ObjectTypeMockData` class
// and replace with actual API calls in the bloc/repository.

enum AIFeature {
  face('Khuôn mặt'),
  licensePlate('Biển số');

  const AIFeature(this.displayName);
  final String displayName;
}

enum ObjectTypeStatus {
  active('Hoạt động'),
  paused('Tạm dừng');

  const ObjectTypeStatus(this.displayName);
  final String displayName;
}

enum FieldDataType {
  text('Văn bản'),
  file('Tệp tin'),
  date('Ngày tháng'),
  number('Số');

  const FieldDataType(this.displayName);
  final String displayName;
}

/// Represents a configurable field in an object type
class ObjectTypeField {
  final String id;
  final String fieldName;
  final String? iconName; // Material icon name
  final String displayName;
  final FieldDataType dataType;
  final bool isDefault; // True for "Tên đối tượng" and "Ảnh nhận diện"

  const ObjectTypeField({
    required this.id,
    required this.fieldName,
    this.iconName,
    required this.displayName,
    required this.dataType,
    this.isDefault = false,
  });

  ObjectTypeField copyWith({
    String? id,
    String? fieldName,
    String? iconName,
    String? displayName,
    FieldDataType? dataType,
    bool? isDefault,
  }) {
    return ObjectTypeField(
      id: id ?? this.id,
      fieldName: fieldName ?? this.fieldName,
      iconName: iconName ?? this.iconName,
      displayName: displayName ?? this.displayName,
      dataType: dataType ?? this.dataType,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}

/// Main Object Type model
class ObjectType {
  final int id;
  final String name;
  final String description;
  final AIFeature aiFeature;
  final ObjectTypeStatus status;
  final List<ObjectTypeField> fields;

  const ObjectType({
    required this.id,
    required this.name,
    required this.description,
    required this.aiFeature,
    required this.status,
    required this.fields,
  });

  ObjectType copyWith({
    int? id,
    String? name,
    String? description,
    AIFeature? aiFeature,
    ObjectTypeStatus? status,
    List<ObjectTypeField>? fields,
  }) {
    return ObjectType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      aiFeature: aiFeature ?? this.aiFeature,
      status: status ?? this.status,
      fields: fields ?? this.fields,
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

  static final List<ObjectType> mockObjectTypes = [
    ObjectType(
      id: 1,
      name: 'Ban giám hiệu',
      description: 'Truy cập và cấu hình toàn bộ dữ liệu',
      aiFeature: AIFeature.face,
      status: ObjectTypeStatus.active,
      fields: [
        ...defaultFields,
        const ObjectTypeField(
          id: 'field_1',
          fieldName: 'Địa chỉ',
          iconName: 'location_on',
          displayName: 'Địa chỉ thường trú',
          dataType: FieldDataType.text,
        ),
      ],
    ),
    ObjectType(
      id: 2,
      name: 'Cán bộ giáo viên',
      description: 'Chỉ truy cập dữ liệu của khối/lớp được quản lý',
      aiFeature: AIFeature.face,
      status: ObjectTypeStatus.active,
      fields: defaultFields,
    ),
    ObjectType(
      id: 3,
      name: 'Học sinh',
      description: 'Điểm danh học sinh',
      aiFeature: AIFeature.face,
      status: ObjectTypeStatus.active,
      fields: defaultFields,
    ),
    ObjectType(
      id: 4,
      name: 'Bảo vệ',
      description: 'Truy cập toàn bộ dữ liệu',
      aiFeature: AIFeature.face,
      status: ObjectTypeStatus.paused,
      fields: defaultFields,
    ),
  ];

  /// Get mock data - replace with API call later
  static List<ObjectType> getAll() => mockObjectTypes;

  /// Search mock data - replace with API call later
  static List<ObjectType> search(String keyword, ObjectTypeStatus? status) {
    return mockObjectTypes.where((item) {
      final matchesKeyword =
          keyword.isEmpty ||
          item.name.toLowerCase().contains(keyword.toLowerCase()) ||
          item.description.toLowerCase().contains(keyword.toLowerCase());
      final matchesStatus = status == null || item.status == status;
      return matchesKeyword && matchesStatus;
    }).toList();
  }
}
