import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';

class AccountForm {
  final String username;
  final String password;
  final bool isAdmin;
  final bool mustChangePassword;
  final bool canAddCamera;
  final String? email;
  final String? phone;
  final String? fullName;
  final String? note;

  AccountForm({
    required this.username,
    required this.password,
    required this.isAdmin,
    required this.mustChangePassword,
    required this.canAddCamera,
    this.email,
    this.phone,
    this.fullName,
    this.note,
  });
}

/// Gọi hàm này để mở dialog
Future<AccountForm?> showAddAccountDialog(BuildContext context) {
  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final fullName = TextEditingController();
  final note = TextEditingController();

  bool isAdmin = false;
  bool mustChangePwd = true;
  bool canAddCamera = true;
  bool obscure = true;

  // --- Helpers: field + switchRow ---
  InputDecoration _dec(String hint, {Widget? suffix}) => InputDecoration(
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    suffixIcon: suffix,
  );
  // Hàng label - control (giữ code gọn mà đẹp)
  Widget _row(String label, Widget right) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 135,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: right),
      ],
    ),
  );
  Widget field({
    required String label,
    required TextEditingController ctrl,
    String hint = '',
    bool obscureText = false,
    Widget? suffix,
    TextInputType? type,
    int maxLines = 1,
  }) {
    return _row(
      label,
      TextField(
        controller: ctrl,
        obscureText: obscureText,
        maxLines: maxLines,
        keyboardType: type,
        decoration: _dec(hint, suffix: suffix),
      ),
    );
  }

  Widget switchRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return _row(
      label,
      Row(
        children: [
          Switch.adaptive(value: value, onChanged: onChanged),
          const SizedBox(width: 8),
          Text(
            value ? 'Có' : 'Không',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // --- UI Dialog ---
  return showDialog<AccountForm?>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (ctx, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Thêm tài khoản',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Vui lòng nhập các thông tin tài khoản',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),

                    // Tài khoản (*)
                    field(
                      label: 'Tài khoản (*)',
                      ctrl: username,
                      hint: 'Nhập tài khoản',
                    ),

                    // Mật khẩu (*) + icon ẩn/hiện
                    field(
                      label: 'Mật khẩu (*)',
                      ctrl: password,
                      hint: 'Nhập mật khẩu (*)',
                      obscureText: obscure,
                      suffix: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => obscure = !obscure),
                      ),
                    ),

                    // Switches
                    switchRow(
                      label: 'Tài khoản Admin:',
                      value: isAdmin,
                      onChanged: (v) => setState(() => isAdmin = v),
                    ),
                    switchRow(
                      label: 'Đổi mật khẩu:',
                      value: mustChangePwd,
                      onChanged: (v) => setState(() => mustChangePwd = v),
                    ),
                    switchRow(
                      label: 'Thêm camera:',
                      value: canAddCamera,
                      onChanged: (v) => setState(() => canAddCamera = v),
                    ),

                    // Email, Phone, Name
                    field(
                      label: 'Email:',
                      ctrl: email,
                      hint: 'Nhập email',
                      type: TextInputType.emailAddress,
                    ),
                    field(
                      label: 'Số điện thoại:',
                      ctrl: phone,
                      hint: 'Nhập số điện thoại',
                      type: TextInputType.phone,
                    ),
                    field(
                      label: 'Họ và tên:',
                      ctrl: fullName,
                      hint: 'Nhập họ và tên',
                    ),

                    // Mô tả (đa dòng)
                    field(
                      label: 'Mô tả:',
                      ctrl: note,
                      hint: 'Mô tả (Tối đa 250 ký tự)',
                      maxLines: 4,
                    ),

                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(ctx, null),
                            child: const Text('HỦY'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate ngắn gọn cho 2 trường bắt buộc
                              if (username.text.trim().isEmpty ||
                                  password.text.isEmpty) {
                                ScaffoldMessenger.of(ctx).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Vui lòng nhập Tài khoản và Mật khẩu',
                                    ),
                                  ),
                                );
                                return;
                              }
                              context.read<UserManagementBloc>().add(
                                AddUserEvent(
                                  changePassDenied: mustChangePwd,
                                  email: email.text.trim(),
                                  address: "123",
                                  desc: note.text.trim(),
                                  addCamDenied: canAddCamera,
                                  tel: phone.text.trim(),
                                  account: username.text.trim(),
                                  password: password.text,
                                  isAdmin: isAdmin,
                                ),
                              );
                              // Navigator.pop(
                              //   ctx,
                              //   AccountForm(
                              //     username: username.text.trim(),
                              //     password: password.text,
                              //     isAdmin: isAdmin,
                              //     mustChangePassword: mustChangePwd,
                              //     canAddCamera: canAddCamera,
                              //     email: email.text.trim().isEmpty
                              //         ? null
                              //         : email.text.trim(),
                              //     phone: phone.text.trim().isEmpty
                              //         ? null
                              //         : phone.text.trim(),
                              //     fullName: fullName.text.trim().isEmpty
                              //         ? null
                              //         : fullName.text.trim(),
                              //     note: note.text.trim().isEmpty
                              //         ? null
                              //         : note.text.trim(),
                              //   ),
                              // );
                            },
                            child: const Text('THÊM'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
