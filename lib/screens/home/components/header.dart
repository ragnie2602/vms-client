import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/error_service.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        children: <Widget>[
          Spacer(),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  mouseCursor: SystemMouseCursors.click,
                  padding: EdgeInsets.zero,
                  onTap: () => ErrorService.openLogFile(),
                  child: ListTile(
                    leading: Icon(Icons.article),
                    title: Text('Mở log file'),
                    contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                  ),
                ),
                PopupMenuDivider(height: 1),
                PopupMenuItem(
                  mouseCursor: SystemMouseCursors.click,
                  padding: EdgeInsets.zero,
                  onTap: () {
                    context.goNamed(Routes.login.name);
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Đăng xuất'),
                    contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                  ),
                ),
              ];
            },
            tooltip: "",
            elevation: 10,
            enableFeedback: true,
            useRootNavigator: true,
            borderRadius: BorderRadius.circular(3),
            position: PopupMenuPosition.under,
            menuPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            offset: Offset(100, 0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person)),
                    SizedBox(width: 6),
                    Text('Admin'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
