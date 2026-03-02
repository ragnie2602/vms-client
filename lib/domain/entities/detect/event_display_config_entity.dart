class EventDisplayConfig {
  int? id;
  late String eventType;
  late String eventTypeName;
  late int typeConfig;
  List<Fields>? fields;
  List<String>? sorting;

  EventDisplayConfig({
    this.id,
    required this.eventType,
    required this.eventTypeName,
    required this.typeConfig,
    this.fields,
    this.sorting,
  });

  EventDisplayConfig.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventType = json['eventType'];
    eventTypeName = json['eventTypeName'];
    typeConfig = json['typeConfig'];
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(Fields.fromJson(v));
      });
    }
    sorting = json['sorting'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['eventType'] = eventType;
    data['eventTypeName'] = eventTypeName;
    data['typeConfig'] = typeConfig;
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    data['sorting'] = sorting;
    return data;
  }
}

class Fields {
  String? fieldKey;
  String? fieldName;
  String? icon;

  Fields({this.fieldKey, this.fieldName, this.icon});

  Fields.fromJson(Map<String, dynamic> json) {
    fieldKey = json['fieldKey'];
    fieldName = json['fieldName'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldKey'] = fieldKey;
    data['fieldName'] = fieldName;
    data['icon'] = icon;
    return data;
  }
}
