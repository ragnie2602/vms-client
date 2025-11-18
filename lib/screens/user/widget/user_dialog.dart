import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
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
  bool _obscurePassword = true;
  final _form = GlobalKey<FormState>();

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
                child: Form(
                  key: _form,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Khôi phục mật khẩu',
                              style: AppTypography.style(
                                20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(AppAssets.icClose),
                            tooltip: 'Đóng',
                          ),
                        ],
                      ),
                      // Boxed area: subtitle + field + hint
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: const Border(
                            top: BorderSide(color: Color(0xFFF2F4FA), width: 1),
                            bottom: BorderSide(
                              color: Color(0xFFF2F4FA),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 27),

                            // Subtitle
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text:
                                        'Vui lòng nhập mật khẩu mới cho tài khoản:\n',
                                  ),
                                  TextSpan(
                                    text: username,
                                    style: AppTypography.style(
                                      14,
                                      fontWeight: FontWeight.w700,
                                      lineHeight: 2,
                                    ),
                                  ),
                                ],
                              ),
                              style: AppTypography.style(
                                14,
                                color: AppColors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            AppField(
                              controller: _controller,
                              hintText: 'Nhập mật khẩu',
                              // label: 'Mật khẩu',
                              requiredField: true,
                              obscureText: _obscurePassword,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Mật khẩu không được để trống';
                                }
                                if (v.contains(' ')) {
                                  return 'Vui lòng nhập mật khẩu có 8-16 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt, không chứa khoảng trắng';
                                }
                                if (v.length < 8 || v.length > 16) {
                                  return 'Vui lòng nhập mật khẩu có 8-16 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt, không chứa khoảng trắng';
                                }
                                return null;
                              },
                              suffix: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.black,
                                ),
                                iconSize: 20,
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mật khẩu 8-16 ký tự, bao gồm ký tự đặc biệt, in hoa và in thường',
                                style: AppTypography.style(
                                  12,
                                  fontWeight: FontWeight.w500,
                                  isItalic: true,

                                  color: AppColors.grey92929D,
                                ),
                              ),
                            ),
                            const SizedBox(height: 27),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Actions
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: AppButton.outline(
                                label: 'Hủy',
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: AppButton.filled(
                                label: 'Khôi phục',
                                onPressed: () {
                                  if (_form.currentState?.validate() ?? false) {
                                    onSubmit!.call(_controller.text.toString());
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
  const _AddUserDialog({this.onSubmit, this.onEdit, this.userEntity});
  final UserEntity? userEntity;
  final Future<void> Function(AddUserPayload value)? onSubmit;
  final Future<void> Function(AddUserPayload value)? onEdit;

  @override
  State<_AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<_AddUserDialog> {
  String _accountType = 'admin';
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _fullName = TextEditingController();
  final _description = TextEditingController();

  bool _obscurePassword = true;
  bool _canChangePassword = true;
  bool _canAddCamera = true;
  bool _isSubmitting = false;

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
    final bool isAdminAccount = _accountType == 'admin';
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
            bloc.add(GetListUserEvent());
            // Hiển thị dialog thành công và reload danh sách
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ToastUtil.toastSuccess(
                context: context,
                title: Text('Thêm tài khoản thành công!'),
              );
            });
          }
        } else if (state is AddUserFail) {
          setState(() => _isSubmitting = false);
        }
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 8, 0),
        actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thêm tài khoản',
                    style: AppTypography.style(
                      20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
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
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    // Tài khoản
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppField(
                            controller: _username,
                            hintText: 'Nhập tài khoản',
                            label: 'Tên đăng nhập',
                            requiredField: true,
                            validator: (v) => v!.trim().isEmpty
                                ? 'Tên đăng nhập không được để trống'
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: AppField(
                            controller: _password,
                            hintText: 'Nhập mật khẩu',
                            label: 'Mật khẩu',
                            requiredField: true,
                            obscureText: _obscurePassword,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Mật khẩu không được để trống';
                              }
                              if (v.contains(' ')) {
                                return 'Vui lòng nhập mật khẩu 8-16 ký tự, không chứa ký tự khoảng trống!';
                              }
                              if (v.length < 8 || v.length > 16) {
                                return 'Vui lòng nhập mật khẩu 8-16 ký tự, không chứa ký tự khoảng trống!';
                              }
                              return null;
                            },
                            suffix: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.black,
                              ),
                              iconSize: 20,
                              onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                            ),
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
                      requiredField: true,
                      validator: (v) => v!.trim().isEmpty
                          ? 'Họ và tên không được để trống'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppField(
                            controller: _email,
                            hintText: 'Nhập email',
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
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
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: AppField(
                            controller: _phoneNumber,
                            hintText: 'Nhập số điện thoại',
                            label: 'Số điện thoại',
                            keyboardType: TextInputType.phone,
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
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
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
                      const SizedBox(height: 12),
                      _buildCheckboxRow(
                        label: 'Cho phép thêm camera',
                        value: _canAddCamera,
                        onChanged: (value) {
                          setState(() => _canAddCamera = value ?? false);
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                    // Mô tả
                    AppField(
                      controller: _description,
                      hintText: 'Nhập ghi chú',
                      label: 'Ghi chú',
                      maxLines: 4,
                      maxLength: 250,
                    ),
                    const SizedBox(height: 16),

                    // Email
                  ],
                ),
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
                  onPressed: _isSubmitting
                      ? null
                      : () => Navigator.pop(context),
                ),
                const SizedBox(width: 12),
                AppButton.filled(
                  label: 'Xác nhận',
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
        isAdmin: _accountType == 'admin' ? true : false,
        canChangePassword: _canChangePassword,
        canAddCamera: _canAddCamera,
        email: _email.text.trim(),
        phoneNumber: _phoneNumber.text.trim(),
        fullName: _fullName.text.trim(),
        description: _description.text.trim(),
      );

      try {
        await widget.onSubmit?.call(payload);
        // if (mounted) {
        //   Navigator.pop(context);
        // }
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

  // Lưu giá trị ban đầu để so sánh
  late String _initialEmail;
  late String _initialPhoneNumber;
  late String _initialFullName;
  late String _initialDescription;
  late String _initialAccountType;
  late bool _initialCanChangePassword;
  late bool _initialCanAddCamera;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _setupListeners();
  }

  void _initializeData() {
    final user = widget.userEntity;
    _username.text = user.account;
    _email.text = user.emailAddress;
    _phoneNumber.text = user.telNumber;
    _fullName.text = user.fullName;
    _description.text = user.desc;

    // Xác định account type từ UserType
    _accountType = user.type == UserType.admin_client ? 'admin' : 'normal';

    // Permissions
    _canChangePassword = !user.changePassDenied;
    _canAddCamera = !user.addCamDenied;

    // Lưu giá trị ban đầu
    _initialEmail = _email.text;
    _initialPhoneNumber = _phoneNumber.text;
    _initialFullName = _fullName.text;
    _initialDescription = _description.text;
    _initialAccountType = _accountType;
    _initialCanChangePassword = _canChangePassword;
    _initialCanAddCamera = _canAddCamera;
  }

  void _setupListeners() {
    _email.addListener(() => setState(() {}));
    _phoneNumber.addListener(() => setState(() {}));
    _fullName.addListener(() => setState(() {}));
    _description.addListener(() => setState(() {}));
  }

  bool get _hasChanges {
    return _email.text != _initialEmail ||
        _phoneNumber.text != _initialPhoneNumber ||
        _fullName.text != _initialFullName ||
        _description.text != _initialDescription ||
        _accountType != _initialAccountType ||
        _canChangePassword != _initialCanChangePassword ||
        _canAddCamera != _initialCanAddCamera;
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
    return BlocListener<UserManagementBloc, UserManagementState>(
      listenWhen: (prev, curr) => curr is EditUserSuccess,
      listener: (context, state) {
        if (state is EditUserSuccess) {
          setState(() => _isSubmitting = false);
          // Pop dialog khi thành công
          if (mounted) {
            Navigator.pop(context);
          }
        }
      },

      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              icon: SvgPicture.asset(AppAssets.icClose),
              tooltip: 'Đóng',
            ),
          ],
        ),
        content: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.greyE2E8F0, width: 1),
              bottom: BorderSide(color: AppColors.greyE2E8F0, width: 1),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.35,
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (v) => v!.trim().isEmpty
                              ? 'Họ và tên không được để trống'
                              : null,
                          requiredField: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Row: Email và Số điện thoại
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppField(
                          controller: _email,
                          hintText: 'Nhập email',
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return null; // Email không bắt buộc
                            }
                            // Regex kiểm tra định dạng email
                            final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            );
                            if (!emailRegex.hasMatch(v)) {
                              return 'Email không đúng định dạng';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppField(
                          controller: _phoneNumber,
                          hintText: 'Nhập số điện thoại',
                          label: 'Số điện thoại',
                          keyboardType: TextInputType.phone,
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
                    const SizedBox(height: 12),
                    _buildCheckboxRow(
                      label: 'Cho phép thêm camera',
                      value: _canAddCamera,
                      onChanged: (value) {
                        setState(() => _canAddCamera = value ?? false);
                      },
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Ghi chú
                  AppField(
                    controller: _description,
                    hintText: 'Nhập ghi chú',
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
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: AppButton.outline(
                      label: 'Hủy',
                      onPressed: _isSubmitting
                          ? null
                          : () => Navigator.pop(context),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _hasChanges && !_isSubmitting
                            ? AppColors.blue005AA9
                            : AppColors.grey64748B,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _hasChanges && !_isSubmitting
                              ? _handleSubmit
                              : null,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 34,
                                vertical: 10,
                              ),
                              child: _isSubmitting
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : Text(
                                      'Cập nhật',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
          //Navigator.pop(context);
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
          side: BorderSide(
            color: AppColors.greyE2E8F0, // Set your desired border color here
            width: 1.0, // Optional: Adjust border width
          ),
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
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
      ),
    ],
  );
}

Future<T?> showDialogRemoveCameraFromGroup<T>(
  BuildContext context, {
  required Function() onConfirm,
  String? title,
}) {
  final controlCameraBloc = context.read<UserManagementBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: RemoveCameraFromGroupWidget(onConfirm: onConfirm, title: title),
    ),
  );
}

class RemoveCameraFromGroupWidget extends StatelessWidget {
  const RemoveCameraFromGroupWidget({super.key, this.onConfirm, this.title});
  final Function()? onConfirm;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.icDeleteLight,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(height: 28),

                Text(
                  title ?? 'camera này khỏi nhóm?',
                  textAlign: TextAlign.center,
                  style: AppTypography.style(
                    14,
                    color: AppColors.blackOrWhite,
                    fontWeight: FontWeight.w500,
                    lineHeight: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 130.5 / 2500,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blackOrWhiteReverse,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          side: BorderSide(
                            color: AppColors.greyE2E8F0,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Hủy',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackOrWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 130.5 / 1600,
                      child: ElevatedButton(
                        onPressed: () {
                          //
                          Navigator.pop(context);
                          onConfirm?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blackOrWhite,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        child: Text(
                          'Xóa',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackOrWhiteReverse,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, size: 20),
            ),
          ),
        ],
      ),
    );
  }
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
      DropdownButtonFormField2<String>(
        value: value,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
          height: 48,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
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
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -5),
          maxHeight: 300,
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item['value'],
            child: Text(
              item['label']!,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        style: AppTypography.style(
          14,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
    ],
  );
}
