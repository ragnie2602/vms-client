part of 'account_bloc.dart';

sealed class AccountEvent extends BaseEvent {
  const AccountEvent();
}

class AccountSignOutPressed extends AccountEvent {}
