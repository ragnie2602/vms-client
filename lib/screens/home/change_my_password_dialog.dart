import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import 'package:vms_flutter_client/screens/home/bloc/change_my_password_bloc.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import 'components/components_src.dart';

/// Hiển thị dialog khôi phục mật khẩu.
/// Trả về mật khẩu mới nếu người dùng xác nhận, ngược lại trả về null.
Future<bool?> showChangeMyPasswordDialog(BuildContext context) {
  final repository = context.read<IUserManagementRepository>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  final theme = Theme.of(context);

  return showDialog<bool?>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (ctx) {
      return BlocProvider(
        create: (context) => ChangeMyPasswordBloc(repository),
        child: BlocConsumer<ChangeMyPasswordBloc, ChangeMyPasswordState>(
          listener: (context, state) {
            if (state.isSuccess) {
              Navigator.pop(context, true);
              ToastUtil.toastSuccess(
                context: context,
                title: Text('Đổi mật khẩu thành công! Vui lòng sử dụng mật khẩu mới để đăng nhập vào tài khoản!', maxLines: 5),
              );
              context.read<SocketApiClient>().disconnect();
              context.read<AppBloc>().add(SignOut());
              context.goNamed(Routes.login.name);
            } else if (state.errorMessage != null) {
              showAppMessageDialog(context, message: state.errorMessage!, type: AppMessageType.error);
            }
          },
          builder: (context, state) {
            return StatefulBuilder(
              builder: (builderContext, setState) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Đổi mật khẩu', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                                IconButton(iconSize: 24, onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close), tooltip: 'Đóng'),
                              ],
                            ),
                          ),
                          Divider(color: AppColors.greyF2F4FA, thickness: 1),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  AppField(
                                    controller: _currentPasswordController,
                                    hintText: 'Nhập mật khẩu cũ',
                                    label: 'Mật khẩu cũ',
                                    requiredField: false,
                                    obscureText: _obscureCurrentPassword,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return 'Mật khẩu cũ không được để trống';
                                      }
                                      return null;
                                    },
                                    suffix: IconButton(
                                      icon: Icon(_obscureCurrentPassword ? Icons.visibility_off : Icons.visibility, color: AppColors.black),
                                      iconSize: 20,
                                      onPressed: () => setState(() => _obscureCurrentPassword = !_obscureCurrentPassword),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 24),
                                    child: AppField(
                                      controller: _newPasswordController,
                                      hintText: 'Nhập mật khẩu mới',
                                      label: 'Mật khẩu mới',
                                      requiredField: false,
                                      obscureText: _obscureNewPassword,
                                      paddingBottomLabel: 16,
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'Mật khẩu mới không được để trống';
                                        }
                                        return null;
                                      },
                                      suffix: IconButton(
                                        icon: Icon(_obscureNewPassword ? Icons.visibility_off : Icons.visibility, color: AppColors.black),
                                        iconSize: 20,
                                        onPressed: () => setState(() => _obscureNewPassword = !_obscureNewPassword),
                                      ),
                                    ),
                                  ),
                                  AppField(
                                    controller: _confirmPasswordController,
                                    hintText: 'Nhập lại mật khẩu mới',
                                    label: 'Xác nhận mật khẩu mới',
                                    requiredField: false,
                                    obscureText: _obscureConfirmPassword,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return 'Xác nhận mật khẩu mới không được để trống';
                                      }
                                      if (v != _newPasswordController.text) {
                                        return 'Xác nhận mật khẩu không đúng!';
                                      }
                                      return null;
                                    },
                                    suffix: IconButton(
                                      icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility, color: AppColors.black),
                                      iconSize: 20,
                                      onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(color: AppColors.greyF2F4FA, thickness: 1),
                          // Actions
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: AppButton.outline(label: 'Hủy', onPressed: () => Navigator.pop(context, false)),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: AppButton.filled(
                                    label: 'Xác nhận',
                                    // isLoading: state.isLoading,
                                    onPressed: state.isLoading
                                        ? null
                                        : () {
                                            if (_formKey.currentState!.validate()) {
                                              context.read<ChangeMyPasswordBloc>().add(
                                                ChangeMyPasswordEvent(
                                                  currentPassword: _currentPasswordController.text,
                                                  newPassword: _newPasswordController.text,
                                                  kickOthers: false,
                                                ),
                                              );
                                            }
                                          },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}
