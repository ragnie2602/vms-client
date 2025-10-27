import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

import 'components/components_src.dart';

/// Hiển thị dialog khôi phục mật khẩu.
/// Trả về mật khẩu mới nếu người dùng xác nhận, ngược lại trả về null.
Future<String?> showChangeMyPasswordDialog(
  BuildContext context, {
  Future<void> Function(String newPassword)? onSubmit
}) {
  final TextEditingController _controller = TextEditingController();
  bool _obscurePassword = true;
  final theme = Theme.of(context);

  return showDialog<String?>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
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
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
                  Divider(
                    color: AppColors.greyF2F4FA,
                    thickness: 1,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          AppField(
                            controller: _controller,
                            hintText: 'Mật khẩu cũ',
                            label: 'Mật khẩu cũ',
                            requiredField: false,
                            obscureText: _obscurePassword,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Mật khẩu không được để trống';
                              }
                              if (v.contains(' ')) {
                                return 'Mật khẩu từ 8-16 ký tự, không chứa ký tự khoảng trống';
                              }
                              if (v.length < 8 || v.length > 16) {
                                return 'Mật khẩu từ 8-16 ký tự, không chứa ký tự khoảng trống';
                              }
                              return null;
                            },
                            suffix: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              iconSize: 20,
                              onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: AppField(
                              controller: _controller,
                              hintText: 'Mật khẩu mới',
                              label: 'Mật khẩu mới',
                              requiredField: false,
                              obscureText: _obscurePassword,
                              paddingBottomLabel: 16,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Mật khẩu không được để trống';
                                }
                                if (v.contains(' ')) {
                                  return 'Mật khẩu từ 8-16 ký tự, không chứa ký tự khoảng trống';
                                }
                                if (v.length < 8 || v.length > 16) {
                                  return 'Mật khẩu từ 8-16 ký tự, không chứa ký tự khoảng trống';
                                }
                                return null;
                              },
                              suffix: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                iconSize: 20,
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                              ),
                            ),
                          ),
                          AppField(
                            controller: _controller,
                            hintText: 'Nhập lại mật khẩu mới',
                            label: 'Nhập lại mật khẩu mới',
                            requiredField: false,
                            obscureText: _obscurePassword,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Mật khẩu không được để trống';
                              }
                              if (v.contains(' ')) {
                                return 'Mật khẩu từ 8-16 ký tự, không chứa ký tự khoảng trống';
                              }
                              if (v.length < 8 || v.length > 16) {
                                return 'Mật khẩu từ 8-16 ký tự, không chứa ký tự khoảng trống';
                              }
                              return null;
                            },
                            suffix: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              iconSize: 20,
                              onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.greyF2F4FA,
                    thickness: 1,
                  ),
                  // Actions
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: AppButton.outline(
                            label: 'Hủy',
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: AppButton.filled(
                            label: 'Cập nhật',
                            onPressed: () =>
                                onSubmit!.call(_controller.text.toString()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          // helper để validate & trả kết quả
        },
      );
    },
  );
}