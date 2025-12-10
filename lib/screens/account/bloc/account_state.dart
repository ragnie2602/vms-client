part of 'account_bloc.dart';

class AccountState extends BaseState {
  final bool isSignOutCompleted;

  const AccountState({this.isSignOutCompleted = false});

  AccountState copyWith({bool? isSignOutCompleted}) {
    return AccountState(
      isSignOutCompleted: isSignOutCompleted ?? this.isSignOutCompleted,
    );
  }

  @override
  List<Object?> get props => [isSignOutCompleted];
}
