import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_user_management_repository.dart';
import 'package:vms_flutter_client/screens/home/bloc/change_my_info_bloc.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import 'components/components_src.dart';

/// Hiển thị dialog khôi phục mật khẩu.
/// Trả về mật khẩu mới nếu người dùng xác nhận, ngược lại trả về null.
Future<bool?> showChangeMyInfoDialog(BuildContext context) {
  final repository = context.read<IUserManagementRepository>();
  final TextEditingController _usernameController =
      TextEditingController();
  final TextEditingController _fullNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final theme = Theme.of(context);

  return showDialog<bool?>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (ctx) {
      return BlocProvider(
        create: (context) => ChangeMyInfoBloc(repository),
        child: BlocConsumer<ChangeMyInfoBloc, ChangeMyInfoState>(
          listener: (context, state) {
            if (state.isSuccess) {
              Navigator.pop(context, true);
              ToastUtil.toastSuccess(
                context: context,
                title: Text(
                  'Cập nhật thông tin tài khoản thành công!',
                  maxLines: 5,
                ),
              );
              context.read<SocketApiClient>().disconnect();
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
            return StatefulBuilder(
              builder: (builderContext, setState) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
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
                                'Thông tin cá nhân',
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
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                AppField(
                                  controller: _usernameController,
                                  hintText: 'Nhập tài khoản',
                                  label: 'Tài khoản',
                                  requiredField: true,
                                  borderRadius: 3,
                                  paddingBottomLabel: 12,
                                  readOnly: true,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Tài khoản không được để trống';
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 24,
                                  ),
                                  child: AppField(
                                    controller: _fullNameController,
                                    hintText: 'Nhập họ và tên',
                                    label: 'Họ và tên',
                                    requiredField: false,
                                    borderRadius: 3,
                                    paddingBottomLabel: 12,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return 'Họ và tên không được để trống';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: AppField(
                                    controller: _emailController,
                                    hintText: 'Nhập email',
                                    label: 'Email',
                                    requiredField: false,
                                    borderRadius: 3,
                                    paddingBottomLabel: 12,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return null; // Email không bắt buộc
                                      }
                                      // Regex kiểm tra định dạng email
                                      final emailRegex = RegExp(
                                        r'^(?=^.{1,64}@)[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*@(?=.{2,255}$)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$',
                                      );
                                      if (!emailRegex.hasMatch(v)) {
                                        return 'Email không đúng định dạng';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                AppField(
                                  controller: _phoneController,
                                  hintText: 'Nhập số điện thoại',
                                  label: 'Số điện thoại',
                                  requiredField: false,
                                  borderRadius: 3,
                                  paddingBottomLabel: 12,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return null; // Số điện thoại không bắt buộc
                                    }
                                    // Regex kiểm tra định dạng số điện thoại Việt Nam
                                    // 84yyyyyyyyy (84 + 9-10 số) hoặc 0yyyyyyyyy (0 + 9-10 số)
                                    final phoneRegex = RegExp(
                                      r'^(84|0)(3|5|7|8|9)\d{8,9}$',
                                    );
                                    if (!phoneRegex.hasMatch(v)) {
                                      return 'Số điện thoại không đúng định dạng';
                                    }
                                    return null;
                                  },
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
                                child: AppButton.outline(
                                  label: 'Hủy',
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AppButton.filled(
                                  label: 'Xác nhận',
                                  // isLoading: state.isLoading,
                                  onPressed: state.isLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            
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
                );
              },
            );
          },
        ),
      );
    },
  );
}
