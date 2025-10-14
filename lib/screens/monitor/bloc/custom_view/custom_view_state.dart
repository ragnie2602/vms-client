// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'custom_view_bloc.dart';

class CustomViewState extends BaseState {
  const CustomViewState();
}

class CustomViewInitial extends CustomViewState {}

class CustomViewLoading extends CustomViewState {
  @override
  StateType get type => StateType.loading;
}

class CustomViewFailure extends CustomViewState {
  final String message;

  const CustomViewFailure(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

class CustomViewSuccess extends CustomViewState {
  final List<CustomLiveView> customViews;

  const CustomViewSuccess({required this.customViews});

  @override
  List<Object?> get props => [customViews];
  @override
  StateType get type => customViews.isEmpty ? StateType.empty : StateType.success;

  CustomViewSuccess copyWith({List<CustomLiveView>? customViews}) {
    return CustomViewSuccess(customViews: customViews ?? this.customViews);
  }
}
