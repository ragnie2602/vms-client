import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';

class LogOutUtil {
  static Future<void> logOut(BuildContext context) async {
    context.read<SocketApiClient>().disconnect();
    context.goNamed(Routes.login.name);
  }
}
