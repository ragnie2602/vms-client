import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/screens/event/components/event_detail_dialog.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => showDetailDialog(context),
        child: Container(
          decoration: BoxDecoration(color: AppColors.greyF2F4FA),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  'https://assets.nintendo.com/image/upload/q_auto/f_auto/store/software/switch2/70010000105851/8787627be7f26ae7984456ffd9af17bea845032cebbf59fe6eeb596dea6bb20e',
                ),
              ),
              const SizedBox(height: 11),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Loại sự kiện: ',
                      style: AppTypography.style(16, fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'Instrution detection',
                      style: AppTypography.style(16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Time: ${DateTime.now().format('HH:mm dd/MM/yyyy')}',
                style: AppTypography.style(16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                'Thiết bị: Camera cổng 1',
                style: AppTypography.style(16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text('Vị trí: Cổng 1', style: AppTypography.style(16, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }

  showDetailDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => EventDetailDialog());
  }
}
