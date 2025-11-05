import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';

class EmapEvent extends BaseEvent {}

class GetListEmapEvent extends EmapEvent {}

class ChangeEmapEvent extends EmapEvent {
  final EmapInforEntity? emap;
  ChangeEmapEvent({required this.emap});
  @override
  List<Object?> get props => [emap];
}

class RemoveEmapEvent extends EmapEvent {
  final List<int>? emapId;
  RemoveEmapEvent({required this.emapId});
  @override
  List<Object?> get props => [emapId];
}
