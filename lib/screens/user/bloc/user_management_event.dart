import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class UserManagementEvent extends BaseEvent {
  const UserManagementEvent();
}

class GetListUserEvent extends UserManagementEvent {
  final List<User> users;
  const GetListUserEvent({required this.users});
  @override
  List<Object?> get props => [users];
}
