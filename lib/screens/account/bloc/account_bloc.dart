import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends BaseBloc<AccountEvent, AccountState> {
  final SocketApiClient socketApiClient;

  AccountBloc(this.socketApiClient) : super(const AccountState()) {
    on<AccountSignOutPressed>(_onSignOutPressed);
  }

  FutureOr<void> _onSignOutPressed(
    AccountSignOutPressed event,
    Emitter<AccountState> emit,
  ) {
    socketApiClient.disconnect();
    emit(state.copyWith(isSignOutCompleted: true));
  }
}
