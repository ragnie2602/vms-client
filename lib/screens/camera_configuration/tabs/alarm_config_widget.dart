import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/camera_alarm_config.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../bloc/alarm_config/alarm_config_bloc.dart';
import '../widgets/alarm_config_popup/alarm_config_popup.dart';

class AlarmConfigWidget extends StatelessWidget {
  const AlarmConfigWidget({super.key, required this.camera});
  final CameraEntity camera;

  Future<void> _showAlertConfigDialog(BuildContext context, CameraAlarmConfig alarm) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlarmConfigPopup(alarm: alarm, cameraId: camera.camId);
      },
    );

    if (context.mounted && result is int && result != alarm.status) {
      context.read<AlarmConfigBloc>().add(GetCameraAiAlarmConfigs(camera.camId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cấu hình Cảnh báo',
            style: AppTypography.style(18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            'Thiết lập các loại sự kiện an ninh cần giám sát cho camera ${camera.name.capitalizeFirstLetter}',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey64748B,
            ),
          ),
          SizedBox(height: 10),

          /*  */
          Expanded(
            child: BlocBuilder<AlarmConfigBloc, AlarmConfigState>(
              builder: (context, state) {
                if (state is AlarmConfigError) {
                  return _buildErrorState(context);
                }

                if (state is AlarmConfigLoaded) {
                  /* Empty state */
                  if (state.alarmConfigs.isEmpty) return _buildEmptyState(context);

                  /* List state */
                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 20),
                    primary: true,
                    itemBuilder: (context, index) =>
                        _buildAlertCard(context, state.alarmConfigs[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: state.alarmConfigs.length,
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Text(
        'Camera không có cấu hình cảnh báo nào',
        style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.grey64748B),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AlarmConfigBloc>().add(GetCameraAiAlarmConfigs(camera.camId)),
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Có lỗi xảy ra trong quá trình tải danh sách cấu hình cảnh báo!',
              textAlign: TextAlign.center,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.redFF2F2F,
                lineHeight: 20 / 14,
              ),
            ),
            SizedBox(height: 6),
            Icon(Icons.refresh, size: 28, color: AppColors.redFF2F2F),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard(BuildContext context, CameraAlarmConfig alarm) {
    return InkWell(
      onTap: () => _showAlertConfigDialog(context, alarm),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.greyE2E8F0, width: 1),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 6, offset: Offset(0, 4), color: Color.fromRGBO(0, 0, 0, 0.04)),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          children: [
            /* Icon */
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.string(alarm.icon, width: 42, height: 42),
            ),

            /* Text */
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alarm.name,
                    style: AppTypography.style(
                      16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey0F172A,
                      lineHeight: 24 / 16,
                    ),
                  ),
                  Text(
                    alarm.description,
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey64748B,
                      lineHeight: 16 / 13,
                    ),
                  ),
                ],
              ),
            ),

            /* Bật/Tắt */
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: alarm.isEnabled ? Color(0xFFECFFD7) : Color(0xFFF8F9FE),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                alarm.isEnabled ? 'Bật' : 'Tắt',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w500,
                  color: alarm.isEnabled ? Color(0xFF03BF00) : Color(0xFF6F767E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
