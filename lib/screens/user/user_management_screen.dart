import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
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
                      child: Text('Thêm Người Dùng', ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Flexible(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final name = "Thuy";
                  return ListTile(
                    title: Text(name),
                    leading: CircleAvatar(
                      child: Text(name.isNotEmpty ? name[0].toUpperCase() : '?',style: TextStyle(color:Colors.red )),
                    ),
                    onTap: () {},
                  );
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
