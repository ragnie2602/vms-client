import 'dart:convert';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/domain/entities/authentication/authentication.dart';
import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';
import 'package:vms_flutter_client/domain/entities/user/user_type.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_notication_repostory.dart';

import '../../i_repositories/i_auth_repository.dart';
import '../future_use_case.dart';
import 'login_input.dart';
import 'login_output.dart';

class LoginUseCase extends FutureUseCase<LoginInput, LoginOutput> {
  final IAuthRepository authRepository;
  final INotificationRepository notificationRepository;

  const LoginUseCase({
    required this.authRepository,
    required this.notificationRepository,
  });

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    try {
      final authentication = await authRepository.authenticate(
        input.server,
        input.username,
        input.password,
      );
      final status = await authRepository.login(
        Authentication(
          account: input.username,
          sessionId: authentication.sessionId,
          uid: authentication.uid,
          host: authentication.websocketHost,
          port: authentication.websocketPort,
        ),
      );

      if (status) {
        await AppData.instance.save<String>(AppKeys.SP_USERNAME_KEY, input.username);
        await AppData.instance.save<String>(AppKeys.SP_PASSWORD_KEY, input.password);
        await AppData.instance.save<String>(AppKeys.SP_SERVER_KEY, input.server);

        AppData.instance.profile = MyProfile(
          id: authentication.id,
          avatar: '',
          displayName: authentication.fullname,
          account: input.username,
          uid: authentication.uid,
          sessionId: authentication.sessionId,
          email: authentication.email,
          tel: authentication.phone,
          permissions: authentication.permissions,
          host: authentication.websocketHost,
          port: authentication.websocketPort,
          userType: UserType.admin,
        );

        // Lấy cấu hình thông báo và lưu vào SharedPreferences
        await _fetchAndSaveNotificationSetting();

        return LoginOutput(account: input.username, isSuccess: true);
      } else {
        return LoginOutput(
          account: input.username,
          isSuccess: false,
          errorMessage: 'Đăng nhập thất bại',
        );
      }
    } catch (e) {
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      if (errorMessage.startsWith('Network error:')) {
        errorMessage = 'Kết nối không thành công! Vui lòng kiểm tra lại địa chỉ máy chủ!';
      }
      return LoginOutput(account: input.username, isSuccess: false, errorMessage: errorMessage);
    }
  }

  Future<void> _fetchAndSaveNotificationSetting() async {
    try {
      final result = await notificationRepository.getNotificationSetting();
      result.fold((failure) {}, (notificationSetting) async {
        final jsonString = json.encode(notificationSetting.toJson());
        await AppData.instance.save<String>(
          AppKeys.SP_NOTIFICATION_SETTING,
          jsonString,
        );
      });
    } catch (_) {}
  }
}
