import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_state.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';
import 'package:vms_flutter_client/screens/user/widget/user_dialog.dart';
import 'package:vms_flutter_client/screens/user/widget/item_user_widget.dart';
import 'package:vms_flutter_client/screens/user/widget/title_widget.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final TextEditingController userNameController = TextEditingController();
  @override
  void initState() {
    _onGetListUser();
    super.initState();
  }

  void _onGetListUser() {
    context.read<UserManagementBloc>().add(GetListUserEvent());
  }

  void _onDeleteUser({required List<int> userId}) {
    context.read<UserManagementBloc>().add(
      DeleteUserEvent(userId: userId, uidStr: ''),
    );
  }

  void _addUser({
    required String account,
    required String password,
    String? email,
    String? tel,
    String? address,
    String? fullName,
    required bool isAdmin,
    String? desc,
    required bool addCamDenied,
    required bool changePassDenied,
  }) {
    context.read<UserManagementBloc>().add(
      AddUserEvent(
        account: account,
        email: email,
        tel: tel,
        address: address,
        isAdmin: isAdmin,
        desc: desc,
        password: password,
        changePassDenied: changePassDenied,
        addCamDenied: addCamDenied,
        fullName: fullName,
      ),
    );
  }

  void _editUser({
    required List<int> userId,
    required String account,
    required String password,
    String? email,
    String? tel,
    String? address,
    String? fullName,
    required bool isAdmin,
    String? desc,
    required bool addCamDenied,
    required bool changePassDenied,
  }) {
    context.read<UserManagementBloc>().add(
      EditUserEvent(
        userId: userId,
        account: account,
        email: email,
        tel: tel,
        address: address,
        isAdmin: isAdmin,
        desc: desc,
        password: password,
        changePassDenied: changePassDenied,
        addCamDenied: addCamDenied,
        fullName: fullName,
      ),
    );
  }

  void _onResetPassword({
    required List<int> userId,
    required String newPassword,
  }) {
    context.read<UserManagementBloc>().add(
      ResetPassWordEvent(userId: userId, newPassword: newPassword),
    );
  }

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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 40,
                        child: TextField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                              child: SvgPicture.asset(AppAssets.icSearch),
                            ),
                            hintText: 'Nhập thông tin tìm kiếm',
                            hintStyle: TextStyle(
                              color: AppColors.grey64748B,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: AppColors.greyE2E8F0,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: AppColors.greyE2E8F0,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: AppColors.greyE2E8F0,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () async {
                          await showAddUserDialog(
                            context,
                            mode: UserDialogMode.add,
                            onSubmit: (payload) async {
                              // Xử lý thêm user
                              _addUser(
                                fullName: payload.fullName,
                                tel: payload.phoneNumber,
                                desc: payload.description,
                                email: payload.email,
                                account: payload.username,
                                password: payload.password,
                                isAdmin: payload.isAdmin,
                                addCamDenied: payload.canAddCamera,
                                changePassDenied: payload.canChangePassword,
                              );
                            },
                          );
                        },
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
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppAssets.icAdd),
                                const SizedBox(width: 8),
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
                      state is UserManagementLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : state is GetListUserState
                          ? Flexible(
                              child: Builder(
                                builder: (BuildContext context) {
                                  final cameras = context
                                      .read<UserManagementBloc>()
                                      .listUser;
                                  if (cameras.isEmpty) {
                                    return Center(
                                      child: Text(
                                        'Danh sách trống',
                                        style: AppTypography.style(14),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    separatorBuilder: (_, __) => const Divider(
                                      height: 1,
                                      color: AppColors.greyF1F5F9,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: state.users!.length,
                                    itemBuilder: (context, index) =>
                                        ItemUserWidget(
                                          onEdit: () async {
                                            await showAddUserDialog(
                                              context,
                                              userEntity: state.users![index],
                                              mode: UserDialogMode.edit,
                                              onEdit: (payload) async {
                                                _editUser(
                                                  email: payload.email,
                                                  tel: payload.phoneNumber,
                                                  desc: payload.description,
                                                  fullName: payload.fullName,
                                                  userId:
                                                      state.users![index].id,
                                                  account: payload.username,
                                                  password: payload.password,
                                                  isAdmin: payload.isAdmin,
                                                  addCamDenied:
                                                      payload.canAddCamera,
                                                  changePassDenied:
                                                      payload.canChangePassword,
                                                );
                                                // Xử lý thêm user
                                              },
                                            );
                                          },
                                          onResetPassword: () {
                                            showResetPasswordDialog(
                                              context,
                                              username:
                                                  state.users![index].account,
                                              user: state.users![index],
                                              onSubmit: (newPassword) async {
                                                _onResetPassword(
                                                  newPassword: newPassword,
                                                  userId:
                                                      state.users![index].id,
                                                );
                                              },
                                            );
                                          },
                                          onDelete: () {
                                            _onDeleteUser(
                                              userId: state.users![index].id,
                                            );
                                          },
                                          itemUser: state.users![index],
                                          index: index + 1,
                                        ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is DeleteUserSuccess) {
          _onGetListUser();
          showAppMessageDialog(
            context,
            message: 'Xóa người dùng thành công !',
            type: AppMessageType.success,
          );
        } else if (state is ListCameraSuccessState) {
          _onGetListUser();
          setState(() {});
        } else if (state is EditUserSuccess) {
          _onGetListUser();
          showAppMessageDialog(
            context,
            message: 'Cập nhật người dùng thành công !',
            type: AppMessageType.success,
          );
        } else if (state is ResetPassWordFail) {
          _onGetListUser();
          showAppMessageDialog(
            context,
            message: state.errorMsg,
            type: AppMessageType.error,
          );
        }
      },
      listenWhen: (previous, current) =>
          current is DeleteUserSuccess ||
          current is ListCameraSuccessState ||
          current is EditUserSuccess ||
          current is ResetPassWordFail,
    );
  }
}
