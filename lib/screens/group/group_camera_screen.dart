import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_event.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_state.dart';

class GroupCameraScreen extends StatefulWidget {
  const GroupCameraScreen({super.key});

  @override
  State<GroupCameraScreen> createState() => _GroupCameraScreenState();
}

class _GroupCameraScreenState extends State<GroupCameraScreen> {
  TextEditingController groupNameController = TextEditingController();

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  void _onAddGroupCamera() {
    // chưa lấy được parent group id => bổ sung sau
    context.read<GroupCameraBloc>().add(
      AddGroupCameraEvent(
        groupName: groupNameController.text,
        parentGroupId: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<GroupCameraBloc, GroupCameraState>(
        builder: (context, newState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Thêm group mới nè'),
              const SizedBox(height: 10),
              TextFormField(
                autofocus: true,
                controller: groupNameController,
                decoration: const InputDecoration(
                  labelText: 'Tên nhóm',
                  hintText: 'Tên nhóm',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tên nhóm không được để trống';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _onAddGroupCamera(),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: (newState.type.isLoading && !newState.type.isInit)
                    ? null
                    : _onAddGroupCamera,
                child: Container(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 10,
                    horizontal: 50,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: (newState.type.isLoading && !newState.type.isInit)
                      ? CircularProgressIndicator()
                      : Text(
                          'Thêm group mới',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state.type.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Thêm group camera thành công'),
                backgroundColor: Colors.green,
              ),
            );
            groupNameController.clear();
          }
          if (state.type.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
