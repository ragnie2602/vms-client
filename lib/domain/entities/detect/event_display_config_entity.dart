class EventDisplayConfig {
  int? id;
  late String eventType;
  late String eventTypeName;
  late int typeConfig;
  int? subjectTypeId;
  late List<Fields> fields;
  late List<String> sorting;

  EventDisplayConfig({
    this.id,
    required this.eventType,
    required this.eventTypeName,
    required this.typeConfig,
    this.subjectTypeId,
    required this.fields,
    required this.sorting,
  });

  EventDisplayConfig.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventType = json['eventType'];
    eventTypeName = json['eventTypeName'];
    typeConfig = json['typeConfig'];
    subjectTypeId = json['subjectTypeId'];
    fields = <Fields>[];
    if (json['fields'] != null) {
      json['fields'].forEach((v) => fields.add(Fields.fromJson(v)));
    }

    sorting = json['sorting'].cast<String>();
  }

  EventDisplayConfig copyWith({
    int? id,
    String? eventType,
    String? eventTypeName,
    int? typeConfig,
    int? subjectTypeId,
    List<Fields>? fields,
    List<String>? sorting,
  }) {
    return EventDisplayConfig(
      id: id ?? this.id,
      eventType: eventType ?? this.eventType,
      eventTypeName: eventTypeName ?? this.eventTypeName,
      typeConfig: typeConfig ?? this.typeConfig,
      subjectTypeId: subjectTypeId ?? this.subjectTypeId,
      fields: fields ?? List.from(this.fields),
      sorting: sorting ?? List.from(this.sorting),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventType': eventType,
      'typeConfig': typeConfig,
      'subjectTypeId': subjectTypeId,
      'sorting': sorting,
    }..removeWhere((k, v) => v == null);
  }
}

class Fields {
  late String fieldKey;
  late String fieldName;
  String? icon;

  Fields({required this.fieldKey, required this.fieldName, this.icon});

  Fields.fromJson(Map<String, dynamic> json) {
    fieldKey = json['fieldKey'];
    fieldName = json['fieldName'];
    icon = json['icon'];
  }
}
