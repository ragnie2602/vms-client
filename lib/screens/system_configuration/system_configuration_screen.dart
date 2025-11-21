import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/system_configuration/components/osd_view.dart';

import 'components/storage_folder_view.dart';

typedef _TabItem = ({String title, Widget content});

class SystemConfigurationScreen extends StatelessWidget {
  const SystemConfigurationScreen({super.key});

  static final _tabs = <_TabItem>[
    (title: 'Thư mục lưu trữ', content: StorageFolderView()),
    (title: 'Cài đặt OSD', content: OsdView()),
    // (title: 'Video & Audio setting', content: Center(child: Text("Video & Audio setting"))),
    // (title: 'Network setting', content: Center(child: Text("Network setting"))),
    // (title: 'Thông báo', content: Center(child: Text("Thông báo"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: DefaultTabController(
        length: _tabs.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: TabBar(
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.secondary,
                indicatorWeight: 2,
                labelColor: AppColors.secondary,
                unselectedLabelColor: AppColors.grey64748B,
                labelStyle: AppTypography.style(14, fontWeight: FontWeight.w500),
                unselectedLabelStyle: AppTypography.style(14, fontWeight: FontWeight.w500),
                labelPadding: EdgeInsets.fromLTRB(25, 11.5, 25, 9.5),
                tabAlignment: TabAlignment.center,
                tabs: _tabs.map((tab) => Tab(text: tab.title, height: 17)).toList(),
              ),
            ),
            Expanded(child: TabBarView(children: _tabs.map((tab) => tab.content).toList())),
          ],
        ),
      ),
    );
  }
}
