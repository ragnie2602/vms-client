import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_bloc.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_event.dart';
import 'package:vms_flutter_client/screens/user/bloc/user_management_state.dart';

import '../../home/components/components_src.dart';

enum UserDialogMode { add, edit }
/// Hiển thị dialog khôi phục mật khẩu.
/// Trả về mật khẩu mới nếu người dùng xác nhận, ngược lại trả về null.
Future<String?> showResetPasswordDialog(
  BuildContext context, {
  Future<void> Function(String newPassword)? onSubmit,
  required String username,
  required UserEntity user,
}) {
  final TextEditingController _controller = TextEditingController();
  bool obscure = true;

  return showDialog<String?>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      'Khôi phục mật khẩu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // Subtitle
                    Text(
                      'Vui lòng nhập mật khẩu mới cho tài khoản:\n$username',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    TextField(
                      controller: _controller,
                      obscureText: obscure,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => {},
                      decoration: InputDecoration(
                        hintText: 'Nhập mật khẩu (*)',
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        suffixIcon: IconButton(
                          tooltip: obscure ? 'Hiện mật khẩu' : 'Ẩn mật khẩu',
                          icon: Icon(
                            obscure ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () => setState(() => obscure = !obscure),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // HỦY
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(null),
                            child: const Text('HỦY'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // KHÔI PHỤC
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () {
                              onSubmit!.call(_controller.text.toString());
                            },
                            child: const Text('KHÔI PHỤC'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

          // helper để validate & trả kết quả
        },
      );
    },
  );
}

/// Entry point to show the dialog
Future<T?> showAddUserDialog<T>(
  BuildContext context, {
  UserDialogMode mode = UserDialogMode.add,
  UserEntity? userEntity,
  Future<void> Function(AddUserPayload value)? onSubmit,
  Future<void> Function(AddUserPayload value)? onEdit,
}) {
  final userManagementBloc = context.read<UserManagementBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: userManagementBloc,
      child: _AddUserDialog(
        mode: mode,
        onSubmit: onSubmit,
        onEdit: onEdit,
        userEntity: userEntity,
      ),
    ),
  );
}

/// Entry point to show the edit user dialog
Future<T?> showEditUserDialog<T>(
  BuildContext context, {
  required UserEntity userEntity,
  Future<void> Function(EditUserPayload value)? onSubmit,
}) {
  final userManagementBloc = context.read<UserManagementBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: userManagementBloc,
      child: _EditUserDialog(userEntity: userEntity, onSubmit: onSubmit),
    ),
  );
}

/// Data model for edit user dialog
class EditUserPayload {
  final String username;
  final String email;
  final String phoneNumber;
  final String fullName;
  final String description;
  final String accountType; // 'admin' hoặc 'normal'
  final bool canChangePassword;
  final bool canAddCamera;

  const EditUserPayload({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.description,
    required this.accountType,
    required this.canChangePassword,
    required this.canAddCamera,
  });
}

/// Data model to return from the dialog
class AddUserPayload {
  final String username;
  final String password;
  final bool isAdmin;
  final bool canChangePassword;
  final bool canAddCamera;
  final String email;
  final String phoneNumber;
  final String fullName;
  final String description;

  const AddUserPayload({
    required this.username,
    required this.password,
    required this.isAdmin,
    required this.canChangePassword,
    required this.canAddCamera,
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.description,
  });
}

class _AddUserDialog extends StatefulWidget {
  const _AddUserDialog({
    required this.mode,
    this.onSubmit,
    this.onEdit,
    this.userEntity,
  });
  final UserEntity? userEntity;
  final UserDialogMode mode;
  final Future<void> Function(AddUserPayload value)? onSubmit;
  final Future<void> Function(AddUserPayload value)? onEdit;

  @override
  State<_AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<_AddUserDialog> {
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _fullName = TextEditingController();
  final _description = TextEditingController();

  bool _obscurePassword = true;
  bool _isAdmin = true;
  bool _canChangePassword = true;
  bool _canAddCamera = true;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    if (widget.mode == UserDialogMode.edit && widget.userEntity != null) {
      final user = widget.userEntity!;
      _username.text = user.account;
      _email.text = user.emailAddress;
      _password.text = user.password;

      _phoneNumber.text = user.telNumber;
      _fullName.text = user.fullName;
      _description.text = user.desc;
      _canAddCamera = user.addCamDenied;
      _canChangePassword = user.changePassDenied;
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _fullName.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<UserManagementBloc, UserManagementState>(
      listenWhen: (prev, curr) => curr is AddUserSuccess || curr is AddUserFail,
      listener: (context, state) {
        if (state is AddUserSuccess) {
          setState(() => _isSubmitting = false);
          // Lưu reference đến bloc trước khi pop
          final bloc = context.read<UserManagementBloc>();
          // Pop dialog khi thành công
          if (mounted) {
            Navigator.pop(context);
            // Hiển thị dialog thành công và reload danh sách
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAppMessageDialog(
                context,
                message: 'Thêm người dùng thành công!',
                type: AppMessageType.success,
                onOk: () {
                  // Reload danh sách camera
                  bloc.add(GetListUserEvent());
                },
              );
            });
          }
        }
        if (state is AddUserFail) {
          setState(() => _isSubmitting = false);
          // Hiển thị dialog lỗi trước khi pop
          showAppMessageDialog(
            context,
            type: AppMessageType.error,
            message: state.errorMsg,
          );
        }
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
        actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mode == UserDialogMode.add
                        ? 'Thêm tài khoản'
                        : 'Cập nhật tài khoản',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              tooltip: 'Đóng',
            ),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  // Tài khoản
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppField(
                          controller: _username,
                          hintText: 'Nhập tài khoản',
                          label: 'Tên đăng nhập',
                          requiredField: true,
                          validator: (v) => v!.isEmpty ? 'Bắt buộc' : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: AppField(
                          controller: _password,
                          hintText: 'Nhập mật khẩu (*)',
                          label: 'Mật khẩu',
                          requiredField: true,
                          obscureText: _obscurePassword,
                          validator: (v) => v!.isEmpty ? 'Bắt buộc' : null,
                          suffix: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppField(
                          controller: _email,
                          hintText: 'Nhập email',
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: AppField(
                          controller: _phoneNumber,
                          hintText: 'Nhập số điện thoại',
                          label: 'Số điện thoại',
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),

                  // Số điện thoại
                  const SizedBox(height: 12),
                  // Họ và tên
                  AppField(
                    controller: _fullName,
                    hintText: 'Nhập họ và tên',
                    label: 'Họ và tên',
                  ),
                  const SizedBox(height: 12),
                  // Mô tả
                  AppField(
                    controller: _description,
                    hintText: 'Nhập ghi chú',
                    label: 'Ghi chú',
                    maxLines: 4,
                    maxLength: 250,
                  ),
                  const SizedBox(height: 8),

                  // Mật khẩu
                  const SizedBox(height: 16),
                  // Tài khoản Admin toggle
                  _buildToggleRow(
                    label: 'Tài khoản Admin:',
                    value: _isAdmin,
                    onChanged: (value) => setState(() => _isAdmin = value),
                  ),
                  const SizedBox(height: 12),
                  // Đổi mật khẩu toggle
                  _buildToggleRow(
                    label: 'Đổi mật khẩu:',
                    value: _canChangePassword,
                    onChanged: (value) =>
                        setState(() => _canChangePassword = value),
                  ),
                  const SizedBox(height: 12),
                  // Thêm camera toggle
                  _buildToggleRow(
                    label: 'Thêm camera:',
                    value: _canAddCamera,
                    onChanged: (value) => setState(() => _canAddCamera = value),
                  ),
                  const SizedBox(height: 16),

                  // Email
                ],
              ),
            ),
          ),
        ),
        actions: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton.outline(
                  label: 'HỦY',
                  onPressed: _isSubmitting
                      ? null
                      : () => Navigator.pop(context),
                ),
                const SizedBox(width: 12),
                AppButton.filled(
                  label: widget.mode == UserDialogMode.add
                      ? 'THÊM'
                      : 'CẬP NHẬT',
                  onPressed: _isSubmitting ? null : _handleSubmit,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 48,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: value ? AppColors.blue005AA9 : Colors.grey[300],
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Có',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (_form.currentState?.validate() ?? false) {
      setState(() => _isSubmitting = true);

      final payload = AddUserPayload(
        username: _username.text.trim(),
        password: _password.text.trim(),
        isAdmin: _isAdmin,
        canChangePassword: _canChangePassword,
        canAddCamera: _canAddCamera,
        email: _email.text.trim(),
        phoneNumber: _phoneNumber.text.trim(),
        fullName: _fullName.text.trim(),
        description: _description.text.trim(),
      );

      try {
        if (widget.mode == UserDialogMode.add) {
          await widget.onSubmit?.call(payload);
        } else {
          await widget.onEdit?.call(payload);
        }
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isSubmitting = false);
          showAppMessageDialog(
            context,
            type: AppMessageType.error,
            message: e.toString(),
          );
        }
      }
    }
  }
}

// ============================================================================
// Edit User Dialog Widget
// ============================================================================

class _EditUserDialog extends StatefulWidget {
  const _EditUserDialog({required this.userEntity, this.onSubmit});

  final UserEntity userEntity;
  final Future<void> Function(EditUserPayload value)? onSubmit;

  @override
  State<_EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<_EditUserDialog> {
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _fullName = TextEditingController();
  final _description = TextEditingController();

  String _accountType = 'normal'; // 'admin' hoặc 'normal'
  bool _canChangePassword = false;
  bool _canAddCamera = false;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    final user = widget.userEntity;
    _username.text = user.account;
    _email.text = user.emailAddress;
    _phoneNumber.text = user.telNumber;
    _fullName.text = user.fullName;
    _description.text = user.desc;

    // Xác định account type từ UserType
    _accountType = user.type == UserType.admin ? 'admin' : 'normal';

    // Permissions
    _canChangePassword = !user.changePassDenied;
    _canAddCamera = !user.addCamDenied;
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _fullName.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isAdminAccount = _accountType == 'admin';

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          Expanded(
            child: Text(
              'Cập nhật tài khoản',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                // Row: Tên đăng nhập và Họ và tên
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Tên đăng nhập',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _username,
                            enabled: false,
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Nhập tài khoản',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyE2E8F0,
                              ),
                              filled: true,
                              fillColor: AppColors.greyF2F4FA,
                              counterText: '',
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1),
                                borderSide: BorderSide(
                                  color: AppColors.greyE2E8F0,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1),
                                borderSide: BorderSide(
                                  color: AppColors.greyE2E8F0,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppField(
                        controller: _fullName,
                        hintText: 'Nhập họ và tên',
                        label: 'Họ và tên',
                        maxLength: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Row: Email và Số điện thoại
                Row(
                  children: [
                    Expanded(
                      child: AppField(
                        controller: _email,
                        hintText: 'Nhập email',
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppField(
                        controller: _phoneNumber,
                        hintText: 'Nhập số điện thoại',
                        label: 'Số điện thoại',
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Loại tài khoản
                _buildDropdownField(
                  label: 'Loại tài khoản',
                  value: _accountType,
                  items: const [
                    {'value': 'admin', 'label': 'Tài khoản Admin'},
                    {'value': 'normal', 'label': 'Tài khoản thường'},
                  ],
                  onChanged: (value) {
                    setState(() {
                      _accountType = value!;
                      // Reset permissions khi chuyển sang admin
                      if (_accountType == 'admin') {
                        _canChangePassword = false;
                        _canAddCamera = false;
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Checkboxes - chỉ hiện với tài khoản thường
                if (!isAdminAccount) ...[
                  _buildCheckboxRow(
                    label: 'Cho phép đổi mật khẩu',
                    value: _canChangePassword,
                    onChanged: (value) {
                      setState(() => _canChangePassword = value ?? false);
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildCheckboxRow(
                    label: 'Cho phép thêm camera',
                    value: _canAddCamera,
                    onChanged: (value) {
                      setState(() => _canAddCamera = value ?? false);
                    },
                  ),
                  const SizedBox(height: 12),
                ],

                // Ghi chú
                AppField(
                  controller: _description,
                  hintText: 'Lorem Ipsum is simply dummy text...',
                  label: 'Ghi chú',
                  maxLines: 4,
                  maxLength: 250,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton.outline(
                label: 'Hủy',
                onPressed: _isSubmitting ? null : () => Navigator.pop(context),
              ),
              const SizedBox(width: 12),
              AppButton.filled(
                label: _isSubmitting ? '' : 'Cập nhật',
                onPressed: _isSubmitting ? null : _handleSubmit,
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<Map<String, String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Text(
                item['label']!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCheckboxRow({
    required String label,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            activeColor: AppColors.blue005AA9,
            value: value,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (_form.currentState?.validate() ?? false) {
      setState(() => _isSubmitting = true);

      final payload = EditUserPayload(
        username: _username.text.trim(),
        email: _email.text.trim(),
        phoneNumber: _phoneNumber.text.trim(),
        fullName: _fullName.text.trim(),
        description: _description.text.trim(),
        accountType: _accountType,
        canChangePassword: _canChangePassword,
        canAddCamera: _canAddCamera,
      );

      try {
        await widget.onSubmit?.call(payload);

        if (mounted) {
          Navigator.pop(context);
          setState(() => _isSubmitting = false);
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isSubmitting = false);
          showAppMessageDialog(
            context,
            type: AppMessageType.error,
            message: e.toString(),
          );
        }
      }
    }
  }
}
