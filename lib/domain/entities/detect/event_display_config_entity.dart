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
