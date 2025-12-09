import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/account/components/info_text_field.dart';
import 'package:vms_flutter_client/screens/home/bloc/change_my_info_bloc.dart';
import 'package:vms_flutter_client/screens/shared/app_message_dialog.dart';

class MobileInfoScreen extends StatefulWidget {
  const MobileInfoScreen({super.key});

  @override
  State<MobileInfoScreen> createState() => _MobileInfoScreenState();
}

class _MobileInfoScreenState extends State<MobileInfoScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    usernameController.text = AppData.instance.read(AppKeys.SP_USERNAME_KEY);
    nameController.text = AppData.instance.profile?.displayName ?? '';
    emailController.text = AppData.instance.profile?.email ?? '';
    phoneController.text = AppData.instance.profile?.tel ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.chevron_left_rounded)),
        title: Text(
          'Thông tin cá nhân',
          style: AppTypography.style(15, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: SizedBox(
                height: 50,
                width: 50,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    AppData.instance.profile?.avatar ?? "",
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AppAssets.defaultAvatar),
                    loadingBuilder: (context, child, loadingProgress) =>
                        CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            BlocConsumer<ChangeMyInfoBloc, ChangeMyInfoState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  ToastUtil.toastSuccess(
                    context: context,
                    title: Text('Cập nhật thông tin tài khoản thành công!'),
                  );
                } else if (state.errorMessage != null) {
                  showAppMessageDialog(
                    context,
                    message: state.errorMessage!,
                    type: AppMessageType.error,
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  AppData.instance.profile?.displayNamePreview ?? 'Giám sát viên',
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.style(
                    18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackOrWhite,
                  ),
                );
              },
            ),
            const SizedBox(height: 42),
            InfoTextField(
              controller: usernameController,
              enabled: false,
              hintText: 'Tài khoản',
              label: 'Tài khoản',
            ),
            const SizedBox(height: 15),
            InfoTextField(
              controller: nameController,
              hintText: 'Nhập họ và tên',
              label: 'Họ và tên',
            ),
            const SizedBox(height: 15),
            InfoTextField(
              controller: emailController,
              hintText: 'Nhập địa chỉ email',
              label: 'Email',
              regExp: r'^[\w-\.]+@([\w-]+\.)+[\w-]',
            ),
            const SizedBox(height: 15),
            InfoTextField(
              controller: phoneController,
              hintText: 'Nhập số điện thoại',
              keyboardType: TextInputType.number,
              label: 'Số điện thoại',
              maxLength: 11,
              regExp: r'^[0-9]+$',
            ),
            const SizedBox(height: 44),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: AppColors.greyE2E8F0),
                      ),
                    ),
                    child: Text('Huỷ', style: AppTypography.style(14, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _validateAndSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text(
                      'Lưu',
                      style: AppTypography.style(
                        14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    if (nameController.text.isEmpty) return false;

    if (emailController.text.isEmpty) return false;
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]').hasMatch(emailController.text)) return false;

    if (phoneController.text.isEmpty) return false;
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneController.text)) return false;

    return true;
  }

  void _validateAndSubmit() {
    if (!_validateFields()) {
      return;
    }

    context.read<ChangeMyInfoBloc>().add(
      ChangeMyInfoEvent(
        updateProfile: AppData.instance.profile?.copyWith(
          displayName: nameController.text,
          email: emailController.text,
          tel: phoneController.text,
        ),
      ),
    );
  }
}
