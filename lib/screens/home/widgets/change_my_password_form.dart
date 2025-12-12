import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/common_extensions.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import 'package:vms_flutter_client/screens/home/bloc/change_my_password_bloc.dart';
import 'package:vms_flutter_client/screens/home/components/components_src.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';
import 'package:vms_flutter_client/screens/shared/platform_builder.dart';

class ChangeMyPasswordForm extends StatefulWidget {
  final bool isDialog;
  final VoidCallback? onCancel;

  const ChangeMyPasswordForm({super.key, this.isDialog = true, this.onCancel});

  @override
  State<ChangeMyPasswordForm> createState() => _ChangeMyPasswordFormState();
}

class _ChangeMyPasswordFormState extends State<ChangeMyPasswordForm> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final repository = context.read<IUserManagementRepository>();

    return BlocProvider(
      create: (context) => ChangeMyPasswordBloc(repository),
      child: BlocConsumer<ChangeMyPasswordBloc, ChangeMyPasswordState>(
        listener: (context, state) {
          if (state.isSuccess) {
            if (widget.isDialog) {
              Navigator.pop(context, true);
            }
            if (context.isMobile) {
              showAppMessageDialog(
                context,
                message:
                    'Đổi mật khẩu thành công! Vui lòng sử dụng mật khẩu mới để đăng nhập vào tài khoản!',
                type: AppMessageType.success,
              );
            } else {
              ToastUtil.toastSuccess(
                context: context,
                title: Text(
                  'Đổi mật khẩu thành công! Vui lòng sử dụng mật khẩu mới để đăng nhập vào tài khoản!',
                  maxLines: 5,
                ),
              );
            }
            context.read<AppBloc>().add(SignOut());
            context.goNamed(Routes.login.name);
          } else if (state.errorMessage != null) {
            showAppMessageDialog(
              context,
              message: state.errorMessage!,
              type: AppMessageType.error,
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isDialog) ...[
                // Title for Dialog
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Đổi mật khẩu',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        iconSize: 24,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                        tooltip: 'Đóng',
                      ),
                    ],
                  ),
                ),
                Divider(color: AppColors.greyF2F4FA, thickness: 1),
              ],
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18),
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
                          icon: Icon(
                            _obscureCurrentPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.black,
                          ),
                          iconSize: 20,
                          onPressed: () => setState(
                            () => _obscureCurrentPassword =
                                !_obscureCurrentPassword,
                          ),
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
                            icon: Icon(
                              _obscureNewPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.black,
                            ),
                            iconSize: 20,
                            onPressed: () => setState(
                              () => _obscureNewPassword = !_obscureNewPassword,
                            ),
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
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.black,
                          ),
                          iconSize: 20,
                          onPressed: () => setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.isDialog)
                Divider(color: AppColors.greyF2F4FA, thickness: 1),
              // Actions
              Padding(
                padding: const EdgeInsets.all(24),
                child: PlatformBuilder.builder(
                  onDesktop: (context) => Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AppButton.outline(
                          label: 'Hủy',
                          onPressed:
                              widget.onCancel ??
                              () => Navigator.pop(context, false),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppButton.filled(
                          label: 'Xác nhận',
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<ChangeMyPasswordBloc>().add(
                                      ChangeMyPasswordEvent(
                                        currentPassword:
                                            _currentPasswordController.text,
                                        newPassword:
                                            _newPasswordController.text,
                                        kickOthers: false,
                                      ),
                                    );
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                  onMobile: (context) => SizedBox(
                    width: double.infinity,
                    child: AppButton.filled(
                      label: 'Lưu',
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ChangeMyPasswordBloc>().add(
                                  ChangeMyPasswordEvent(
                                    currentPassword:
                                        _currentPasswordController.text,
                                    newPassword: _newPasswordController.text,
                                    kickOthers: false,
                                  ),
                                );
                              }
                            },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
