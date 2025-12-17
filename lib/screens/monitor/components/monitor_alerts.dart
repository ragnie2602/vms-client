import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/components_src.dart';

class MonitorAlerts extends StatelessWidget {
  const MonitorAlerts({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hiển thi sự kiện của các camera:',
          style: AppTypography.style(16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        _FilterMode(),
        const SizedBox(height: 16),
        AppButton.filled(label: 'Đánh dấu tất cả đã đọc', onPressed: () {}),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) => _EventItem(), itemCount: 10),
        ),
      ],
    );
  }
}

class _EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyF2F4FA,
      margin: EdgeInsets.only(bottom: 8, left: 4, right: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showDetailDialog(context),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Phát hiện xâm nhập',
                  style: AppTypography.style(14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 72,
                      child: Image.network(
                        'https://assets.nintendo.com/image/upload/q_auto/f_auto/store/software/switch2/70010000105851/8787627be7f26ae7984456ffd9af17bea845032cebbf59fe6eeb596dea6bb20e',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 107,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time: 06:45 20/11/2025',
                            style: AppTypography.style(13, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Thiết bị: Camera cổng 1',
                            style: AppTypography.style(13, fontWeight: FontWeight.w400),
                          ),
                        ],
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
  }

  showDetailDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => EventDetailDialog());
  }
}

class _FilterMode extends StatefulWidget {
  @override
  State<_FilterMode> createState() => _FilterModeState();
}

class _FilterModeState extends State<_FilterMode> {
  String groupValue = 'all';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10),
        CustomRadioButton(
          title: 'Tất cả',
          value: 'all',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        CustomRadioButton(
          title: 'Đang hiển thị',
          value: 'displaying',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  void onChanged(String? value) {
    setState(() {
      groupValue = value ?? 'all';
    });
  }
}
