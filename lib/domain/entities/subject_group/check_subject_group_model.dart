import 'package:equatable/equatable.dart';

class CheckSubjectGroupModel extends Equatable {
  final int id;
  final bool hasChildren;
  final bool hasVmsObjects;
  final bool empty;

  const CheckSubjectGroupModel({
    required this.id,
    required this.hasChildren,
    required this.hasVmsObjects,
    required this.empty,
  });

  factory CheckSubjectGroupModel.fromJson(Map<String, dynamic> json) {
    return CheckSubjectGroupModel(
      id: json['id'] as int? ?? 0,
      hasChildren: json['hasChildren'] as bool? ?? false,
      hasVmsObjects: json['hasVmsObjects'] as bool? ?? false,
      empty: json['empty'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hasChildren': hasChildren,
      'hasVmsObjects': hasVmsObjects,
      'empty': empty,
    };
  }

  @override
  List<Object?> get props => [id, hasChildren, hasVmsObjects, empty];
}
