import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  void initState() {
    _onGetListUser();
    super.initState();
  }

  void _onGetListUser() {
    context.read<UserManagementBloc>().add(GetListUserEvent());
  }

  void _onAddUser() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserManagementBloc, UserManagementState>(
      builder: (context, newState) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      color: Colors.blue,
                      child: Text('Thêm Người Dùng'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Flexible(
              child: BlocBuilder<UserManagementBloc, UserManagementState>(
                builder: (context, newState) {
                  if (newState is UserManagementLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (newState is GetListUserStateFail) {
                    return Center(child: Text(newState.errorMsg));
                  } else if (newState.type.isSuccess &&
                      newState is GetListUserState) {
                    if ((newState.props).isEmpty) {
                      return Center(child: Text('Chưa có dữ liệu.'));
                    } else {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newState.props.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, i) {
                          final name = "Thuy";
                          return ListTile(
                            title: Text(name),
                            leading: CircleAvatar(
                              child: Text(
                                name.isNotEmpty ? name[0].toUpperCase() : '?',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            onTap: () {},
                          );
                        },
                      );
                    }
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
