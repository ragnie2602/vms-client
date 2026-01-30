import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
class AiBoxState extends BaseState {
  const AiBoxState();
}

class AiBoxLoadingState extends AiBoxState {
  @override
  StateType get type => StateType.loading;
}

class AIBoxLoadedState extends AiBoxState {
  final List<AiBoxEntity>? aiBoxes;
  const AIBoxLoadedState({required this.aiBoxes});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [aiBoxes];
}
