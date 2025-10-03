import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/error_service.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';

import '../../shared/popup_menu.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final shadows = [
      BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 0, offset: Offset(1, 1)),
    ];
    final textStyle = TextStyle(fontSize: 13, color: Colors.black);

    return Container(
      height: 60,
      width: double.infinity,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        children: <Widget>[
          _buildLeading(context),
          Spacer(),
          // PopupMenuButton(
          //   itemBuilder: (context) {
          //     return <PopupMenuEntry>[
          //       //
          //       PopupMenuItem(
          //         mouseCursor: SystemMouseCursors.click,
          //         padding: EdgeInsets.zero,
          //         onTap: () => ErrorService.openLogFile(),
          //         child: ListTile(
          //           leading: Icon(Icons.article),
          //           title: Text('Mở log file'),
          //           contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
          //         ),
          //       ),
          //       PopupMenuDivider(height: 1),
          //       PopupMenuItem(
          //         mouseCursor: SystemMouseCursors.click,
          //         padding: EdgeInsets.zero,
          //         onTap: () {
          //           context.goNamed(Routes.login.name);
          //         },
          //         child: ListTile(
          //           leading: Icon(Icons.logout),
          //           title: Text('Đăng xuất'),
          //           contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
          //         ),
          //       ),
          //     ];
          //   },
          //   tooltip: "",
          //   elevation: 10,
          //   enableFeedback: true,
          //   useRootNavigator: true,
          //   borderRadius: BorderRadius.circular(3),
          //   position: PopupMenuPosition.under,
          //   menuPadding: EdgeInsets.zero,
          //   padding: EdgeInsets.zero,
          //   color: Colors.transparent,
          //   // offset: Offset(100, 0),
          //   child: MouseRegion(
          //     cursor: SystemMouseCursors.click,
          //     child: Container(
          //       height: double.infinity,
          //       padding: EdgeInsets.symmetric(horizontal: 16),
          //       color: Colors.transparent,
          //       child: Row(
          //         children: <Widget>[
          //           CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person)),
          //           SizedBox(width: 6),
          //           Text('Admin'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          /*  */
          CustomPopupMenu(
            menuBuilder: () => IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: shadows,
                ),
                child: Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () => ErrorService.openLogFile(),
                        leading: Icon(Icons.article),
                        title: Text('Mở log file', style: textStyle),
                        contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(3)),
                        ),
                      ),
                      Divider(height: 0.5, color: Colors.grey.shade300),
                      ListTile(
                        onTap: () {
                          context.read<SocketApiClient>().disconnect();
                          context.goNamed(Routes.login.name);
                        },
                        leading: Icon(Icons.logout),
                        title: Text('Đăng xuất', style: textStyle),
                        contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(3)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            arrowDecoration: BoxDecoration(color: Colors.white, boxShadow: shadows),
            arrowSize: Size(16, 10),
            pressType: PressType.singleClick,
            verticalMargin: 0,
            barrierColor: Colors.transparent,
            position: PreferredPosition.bottom,
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
                    Text('pmc5', style: textStyle),
                  ],
                ),
              ),
            ),
          ),

          // SizedBox(width: 200),
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    final RouteMatchList currentConfiguration = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration;
    final RouteMatch lastMatch = currentConfiguration.last;
    final Uri location = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches.uri
        : currentConfiguration.uri;
    final bool canPop = location.pathSegments.length > 1;

    return canPop
        ? Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.fromLTRB(4, 8, 8, 8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: GoRouter.of(context).pop,
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 14),
              label: Text('Quay lại', style: TextStyle(color: Colors.black, fontSize: 14)),
            ),
          )
        : SizedBox.shrink();
  }
}
