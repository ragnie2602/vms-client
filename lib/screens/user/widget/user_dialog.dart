import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/roles/role.dart';
import 'package:vms_flutter_client/domain/entities/user/user_entity.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/roles/bloc/role_bloc.dart';
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
            insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

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
                              style: AppTypography.style(20, fontWeight: FontWeight.w600),
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
                            bottom: BorderSide(color: Color(0xFFF2F4FA), width: 1),
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
                                    text: 'Vui lòng nhập mật khẩu mới cho tài khoản:\n',
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
                              style: AppTypography.style(14, color: AppColors.black),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            AppField(
                              controller: _controller,
                              hintText: 'Nhập mật khẩu',
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
                                if (!v.contains(RegExp(r'[A-Z]'))) {
                                  return 'Mật khẩu phải chứa ít nhất một chữ cái in hoa';
                                }
                                if (!v.contains(RegExp(r'[a-z]'))) {
                                  return 'Mật khẩu phải chứa ít nhất một chữ cái in thường';
                                }
                                if (!v.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                  return 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt';
                                }
                                return null;
                              },
                              suffix: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: AppColors.black,
                                ),
                                iconSize: 20,
                                onPressed: () =>
                                    setState(() => _obscurePassword = !_obscurePassword),
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
Future<T?> showAddEditUserDialog<T>(BuildContext context, {UserEntity? userEntity}) {
  final roleBloc = context.read<RoleBloc>();
  final userManagementBloc = context.read<UserManagementBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: roleBloc),
        BlocProvider.value(value: userManagementBloc),
      ],
      child: _AddEditUserDialog(userEntity: userEntity),
    ),
  );
}

class _AddEditUserDialog extends StatefulWidget {
  const _AddEditUserDialog({this.userEntity});
  final UserEntity? userEntity;

  @override
  State<_AddEditUserDialog> createState() => _AddEditUserDialogState();
}

class _AddEditUserDialogState extends State<_AddEditUserDialog> {
  late final UserManagementBloc userManagementBloc;
  late final RoleBloc roleBloc;

  Role? _selectedRole;
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _fullName = TextEditingController();
  final _description = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    userManagementBloc = context.read<UserManagementBloc>();
    roleBloc = context.read<RoleBloc>()..add(GetRoles());

    if (widget.userEntity != null) {
      _username.text = widget.userEntity!.username ?? '';
      _email.text = widget.userEntity!.email ?? '';
      _phoneNumber.text = widget.userEntity!.phone ?? '';
      _fullName.text = widget.userEntity!.fullname ?? '';
      _description.text = widget.userEntity!.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserManagementBloc, UserManagementState>(
      listenWhen: (prev, curr) => curr is AddUserSuccess || curr is AddUserFail,
      listener: (context, state) {
        if (state is AddUserSuccess) {
          final bloc = context.read<UserManagementBloc>();
          if (mounted) {
            Navigator.pop(context);
            bloc.add(GetListUserEvent());

            WidgetsBinding.instance.addPostFrameCallback((_) {
              ToastUtil.toastSuccess(context: context, title: Text('Thêm tài khoản thành công!'));
            });
          }
        } else if (state is AddUserFail) {}
      },
      child: AlertDialog(
        actions: _actions(),
        actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        backgroundColor: Colors.white,
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 850 / 1600,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppField(
                            enabled: widget.userEntity == null,
                            controller: _username,
                            hintText: 'Nhập tài khoản',
                            label: 'Tên đăng nhập',
                            requiredField: widget.userEntity == null,
                            validator: (v) =>
                                v!.trim().isEmpty ? 'Tên đăng nhập không được để trống' : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(flex: 2, child: _editMode ? _fullNameField() : _passwordField()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (!_editMode) ...[_fullNameField(), const SizedBox(height: 12)],
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
                              final phoneRegex = RegExp(r'^(84|0)(3|5|7|8|9)\d{8,9}$');
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
                    // Nhóm quyền
                    BlocBuilder<RoleBloc, RoleState>(
                      builder: (context, state) {
                        final roles = state is GetAllRolesSuccess ? state.roles : <Role>[];
                        if (widget.userEntity != null) {
                          _selectedRole = roles.firstWhereOrNull(
                            (e) => e.id == widget.userEntity?.roleId,
                          );
                        }

                        return EventFilterDropdown<Role?>(
                          initialValue: _selectedRole,
                          isDense: true,
                          itemBuilder: (item) => Text(
                            item?.name ?? '',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey64748B,
                            ),
                          ),
                          items: roles,
                          label: 'Nhóm quyền',
                          labelStyle: AppTypography.style(
                            13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          onChanged: (value) => _selectedRole = value,
                          padding: EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey64748B,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    AppField(
                      controller: _description,
                      hintText: 'Nhập ghi chú',
                      label: 'Ghi chú',
                      maxLines: 4,
                      maxLength: 250,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 8, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: _title(),
        titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      ),
    );
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

  /// WIDGETS
  List<Widget> _actions() => [
    Center(
      child: BlocBuilder<UserManagementBloc, UserManagementState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton.outline(
                label: 'Hủy',
                onPressed: state is AddUserLoadingState ? null : () => Navigator.pop(context),
              ),
              const SizedBox(width: 12),
              AppButton.filled(
                label: 'Xác nhận',
                onPressed: state is AddUserLoadingState ? null : _handleSubmit,
                child: state is AddUserLoadingState
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : null,
              ),
            ],
          );
        },
      ),
    ),
  ];

  Widget _fullNameField() => AppField(
    controller: _fullName,
    hintText: 'Nhập họ và tên',
    label: 'Họ và tên',
    requiredField: true,
    validator: (v) => v!.trim().isEmpty ? 'Họ và tên không được để trống' : null,
  );

  Widget _passwordField() => AppField(
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
        _obscurePassword ? Icons.visibility_off : Icons.visibility,
        color: AppColors.black,
      ),
      iconSize: 20,
      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
    ),
  );

  Widget _title() => Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _editMode ? 'Cập nhật tài khoản' : 'Thêm tài khoản',
              style: AppTypography.style(20, fontWeight: FontWeight.w600, color: AppColors.black),
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
  );

  /// FUNCTIONS

  bool get _editMode => widget.userEntity != null;

  Future<void> _handleSubmit() async {
    if (_form.currentState?.validate() ?? false) {
      userManagementBloc.add(
        widget.userEntity == null
            ? AddUser(
                account: _username.text,
                desc: _description.text,
                email: _email.text,
                fullName: _fullName.text,
                password: _password.text,
                roleId: _selectedRole?.id,
                tel: _phoneNumber.text,
              )
            : EditUser(
                desc: _description.text,
                email: _email.text,
                fullName: _fullName.text,
                roleId: _selectedRole?.id ?? 0,
                tel: _phoneNumber.text,
                userId: widget.userEntity!.id!,
              ),
      );
    }
  }
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
                SvgPicture.asset(AppAssets.icDeleteLight, height: 60, width: 60),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                          side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
