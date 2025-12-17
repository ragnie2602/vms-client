import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/event/components/event_item.dart';
import 'package:vms_flutter_client/screens/event/components/search_box.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: [],
                    label: 'Từ ngày',
                    onChanged: (_) {},
                    type: EventFilterDropdownType.date,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: [],
                    label: 'Đến ngày',
                    onChanged: (_) {},
                    type: EventFilterDropdownType.date,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: [],
                    label: 'Sự kiện',
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: EventFilterDropdown<String>(
                    items: [],
                    label: 'Thiết bị',
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(width: 32),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      EventCustomButton(
                        backgroundColor: AppColors.blue005AA9,
                        borderColor: AppColors.blue005AA9,
                        borderRadius: 3,
                        label: 'Cài đặt',
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        textStyle: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      SearchBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.white),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10, right: 10, top: 8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 338 / 304,
                  crossAxisCount: 4,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 11,
                ),
                itemBuilder: (context, index) {
                  return EventItem();
                },
                itemCount: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
