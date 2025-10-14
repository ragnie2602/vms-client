import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';
import 'package:vms_flutter_client/screens/user/widget/item_user_widget.dart';
import 'package:vms_flutter_client/screens/user/widget/title_widget.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quản lý người dùng',
                        style: TextStyle(
                          color: AppColors.black171725,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,

                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              width: 1,
                              color: AppColors.secondary,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Thêm người dùng',
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: BlocBuilder<UserManagementBloc, UserManagementState>(
                builder: (context, state) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(),
                      state is UserManagementLoadingState ? Center(child: CircularProgressIndicator()):
                      state is GetListUserState
                          ? Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.users!.length,
                                itemBuilder: (context, index) => ItemUserWidget(
                                  ItemUser: state.users![index],
                                  index: index + 1,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              // child: BlocBuilder<UserManagementBloc, UserManagementState>(
              //   builder: (context, newState) {
              //     if (newState is UserManagementLoadingState) {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //     if (newState is GetListUserStateFail) {
              //       return Center(child: Text(newState.errorMsg));
              //     } else if (newState.type.isSuccess &&
              //         newState is GetListUserState) {
              //       if ((newState.props).isEmpty) {
              //         return Center(child: Text('Chưa có dữ liệu.'));
              //       } else {
              //         return ListView.separated(
              //           physics: NeverScrollableScrollPhysics(),
              //           shrinkWrap: true,
              //           itemCount: newState.props.length,
              //           separatorBuilder: (_, __) => const Divider(height: 1),
              //           itemBuilder: (context, i) {
              //             final name = "Thuy";
              //             return ListTile(
              //               title: Text(name),
              //               leading: CircleAvatar(
              //                 child: Text(
              //                   name.isNotEmpty ? name[0].toUpperCase() : '?',
              //                   style: TextStyle(color: Colors.red),
              //                 ),
              //               ),
              //               onTap: () {},
              //             );
              //           },
              //         );
              //       }
              //     }
              //     return SizedBox();
              //   },
              // ),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
