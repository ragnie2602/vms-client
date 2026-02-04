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
  final AiBoxEntity? aiBoxSelctedDetail;
  const AIBoxLoadedState({required this.aiBoxes, this.aiBoxSelctedDetail});

  AIBoxLoadedState copyWith({
    List<AiBoxEntity>? aiBoxes,
    AiBoxEntity? aiBoxSelctedDetail,
    bool? clearDetail,
  }) {
    return AIBoxLoadedState(
      aiBoxes: aiBoxes ?? this.aiBoxes,
      aiBoxSelctedDetail: clearDetail == true
          ? null
          : aiBoxSelctedDetail ?? this.aiBoxSelctedDetail,
    );
  }

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [aiBoxes, aiBoxSelctedDetail];
}

class AiBoxAddSuccessState extends AiBoxState {
  const AiBoxAddSuccessState();

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [];
}

class AiBoxErrorState extends AiBoxState {
  final String errorMessage;
  const AiBoxErrorState({required this.errorMessage});

  @override
  StateType get type => StateType.failure;
  @override
  List<Object?> get props => [errorMessage];
}

class AiBoxAddFailState extends AiBoxState {
  final String errorMessage;
  const AiBoxAddFailState({required this.errorMessage});

  @override
  StateType get type => StateType.failure;
  @override
  List<Object?> get props => [errorMessage];
}

class AiBoxDeleteSuccessState extends AiBoxState {
  final int aiBoxId;
  final String aiBoxName;
  const AiBoxDeleteSuccessState({
    required this.aiBoxId,
    required this.aiBoxName,
  });

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [aiBoxId, aiBoxName];
}

class AiBoxDeleteFailState extends AiBoxState {
  final String errorMessage;
  const AiBoxDeleteFailState({required this.errorMessage});

  @override
  StateType get type => StateType.failure;
  @override
  List<Object?> get props => [errorMessage];
}

class AiBoxEditSuccessState extends AiBoxState {
  final String aiBoxName;
  const AiBoxEditSuccessState({required this.aiBoxName});

  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [aiBoxName];
}

class AiBoxEditFailState extends AiBoxState {
  final String errorMessage;
  const AiBoxEditFailState({required this.errorMessage});

  @override
  StateType get type => StateType.failure;
  @override
  List<Object?> get props => [errorMessage];
}

