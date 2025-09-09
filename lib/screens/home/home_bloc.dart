import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/base_bloc.dart';

class HomeState extends BaseState {
  final String message;
  final bool isLoading;
  
  const HomeState({
    this.message = 'Welcome to VMS Flutter Client',
    this.isLoading = false,
  });
  
  HomeState copyWith({
    String? message,
    bool? isLoading,
  }) {
    return HomeState(
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  
  @override
  List<Object?> get props => [message, isLoading];
}

class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>(_onLoadHomeData);
  }
  
  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    await Future.delayed(const Duration(seconds: 1));
    
    emit(state.copyWith(
      isLoading: false,
      message: 'Home data loaded successfully!',
    ));
  }
}