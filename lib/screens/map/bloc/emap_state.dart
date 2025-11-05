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
  final int? currentEmapIndex;

  const EmapSuccessState({this.listEmap, this.currentEmapIndex});

  EmapSuccessState copyWith({
    List<EmapInforEntity>? listEmap,
    int? currentEmapIndex,
  }) {
    return EmapSuccessState(
      listEmap: listEmap ?? this.listEmap,
      currentEmapIndex: currentEmapIndex ?? this.currentEmapIndex,
    );
  }
}
