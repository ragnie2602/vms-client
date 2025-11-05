import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';

class EmapState extends BaseState {
  const EmapState();
}

class EmapLoadingState extends EmapState {
  @override
  StateType get type => StateType.loading;
}

class EmapSuccessState extends EmapState {
  final List<EmapInforEntity>? listEmap;
  final EmapInforEntity? emapSelected;

  const EmapSuccessState({this.listEmap, this.emapSelected});
  
  @override
  List<Object?> get props => [listEmap, emapSelected];

  EmapSuccessState copyWith({
    List<EmapInforEntity>? listEmap,
    EmapInforEntity? emapSelected,
  }) {
    return EmapSuccessState(
      listEmap: listEmap ?? this.listEmap,
      emapSelected: emapSelected ?? this.emapSelected,
    );
  }
}
