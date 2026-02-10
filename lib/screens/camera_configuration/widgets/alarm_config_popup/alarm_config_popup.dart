import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/ai_alarm_config.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/alarm_sound.dart';
import 'package:vms_flutter_client/domain/entities/ai_alarm/camera_alarm_config.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_bloc.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_state.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';

import '../../../shared/player/audio_player.dart';
import '../../../shared/player/components/video_thumbnail.dart';
import '../../bloc/alarm_config_detail/alarm_config_detail_bloc.dart';
import '../../bloc/alarm_sound/alarm_sound_bloc.dart';

part 'properties_config.dart';
part 'roi_area_config.dart';
part 'time_ranges_config.dart';
part 'title_with_tooltip.dart';

class AlarmConfigPopup extends StatefulWidget {
  final CameraAlarmConfig alarm;
  final String cameraId;
  final String cameraSource;
  const AlarmConfigPopup({
    super.key,
    required this.alarm,
    required this.cameraId,
    required this.cameraSource,
  });

  @override
  State<AlarmConfigPopup> createState() => _AlarmConfigPopupState();
}

class _AlarmConfigPopupState extends State<AlarmConfigPopup> with StateBuilderMixin {
  bool isSaving = false;

  void _handleSave(BuildContext context) {
    setState(() => isSaving = true);

    context.read<AlarmConfigDetailBloc>().add(
      SaveAlarmConfig(
        onFailure: (message) {
          setState(() => isSaving = false);
          ToastUtil.toastFail(
            context: context,
            title: Text(
              message,
              maxLines: 5,
              style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
            ),
          );
        },
        onSuccess: (status) {
          ToastUtil.toastSuccess(
            title: Text(
              "Cập nhập cấu hình thành công!",
              maxLines: 5,
              style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
            ),
          );

          Navigator.pop(context, status);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dialogWidth = MediaQuery.of(context).size.width * 0.5;

    return BlocProvider(
      create: (context) => AlarmConfigDetailBloc(
        context.read(),
        cameraId: widget.cameraId,
        type: widget.alarm.type.key,
        baseStatus: widget.alarm.status,
      )..add(GetAlarmConfigDetail()),
      child: IgnorePointer(
        ignoring: isSaving,
        child: AlertDialog(
          backgroundColor: Color(0xFFFCFDFD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          titlePadding: EdgeInsets.fromLTRB(24, 14, 24 - 12, 14),
          contentPadding: EdgeInsets.zero,
          title: _buildTitle(context),
          content: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: AppColors.greyF2F4FA)),
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            // right 8 + 12 padding scrollview (cho scrollbar ra ngoài)
            padding: EdgeInsets.fromLTRB(20, 0, 8, 16),
            width: dialogWidth,
            height: MediaQuery.of(context).size.height * 0.65,
            child: BlocBuilder<AlarmConfigDetailBloc, AlarmConfigDetailState>(
              buildWhen: (pre, cur) {
                if (pre is AlarmConfigDetailLoaded && cur is AlarmConfigDetailLoaded) {
                  return pre.alarmConfig != cur.alarmConfig;
                }

                return true;
              },
              builder: (context, state) => stateBuilder<AlarmConfigDetailLoaded>(
                state,
                errorBuilder: (message) => _buildErrorWidget(message, context),
                child: (state) => Column(
                  children: [
                    /* Content */
                    Expanded(
                      child: Scrollbar(
                        thickness: 8,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(right: 12, top: 16),
                          primary: true,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: PropertiesConfig(
                                      alarm: widget.alarm,
                                      alarmConfig: state.alarmConfig,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 3,
                                    child: ROIAreaConfig(
                                      alarmConfig: state.alarmConfig,
                                      cameraSource: widget.cameraSource,
                                    ),
                                  ),
                                ],
                              ),

                              /* Time range */
                              SizedBox(height: 18),
                              TimeRangesConfig(alarmConfig: state.alarmConfig),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /* Actions */
                    SizedBox(
                      height: 1,
                      child: OverflowBox(
                        maxWidth: dialogWidth - 12, // -12 padding scrollview
                        alignment: Alignment.center,
                        child: Container(height: 1, color: AppColors.greyF2F4FA),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(4, 12, 4 + 12, 0), // +12 padding scrollview
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          _buildActionBtn(
                            text: 'Hủy',
                            bgColor: AppColors.white,
                            fgColor: Color(0xFF374151),
                            borderColor: AppColors.greyD1D5DB,
                            onPressed: () => Navigator.pop(context),
                          ),
                          SizedBox(width: 18),
                          BlocBuilder<AlarmConfigDetailBloc, AlarmConfigDetailState>(
                            buildWhen: (pre, cur) =>
                                pre is AlarmConfigDetailLoaded &&
                                cur is AlarmConfigDetailLoaded &&
                                pre.canSave != cur.canSave,
                            builder: (context, state) {
                              final canSave = (state as AlarmConfigDetailLoaded?)?.canSave ?? false;

                              return _buildActionBtn(
                                text: 'Lưu',
                                bgColor: Color(0xFF005EB8),
                                fgColor: Colors.white,
                                onPressed: () => _handleSave(context),
                                enabled: canSave,
                                isLoading: isSaving,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        /* Icon */
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.string(widget.alarm.icon, width: 42, height: 42),
        ),

        /* Text */
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.alarm.name,
                style: AppTypography.style(
                  16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey0F172A,
                  lineHeight: 24 / 16,
                ),
              ),
              Text(
                widget.alarm.description,
                style: AppTypography.style(
                  12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey64748B,
                  lineHeight: 16 / 12,
                ),
              ),
            ],
          ),
        ),

        /* close */
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
          tooltip: 'Đóng',
        ),
      ],
    );
  }

  Widget _buildActionBtn({
    required String text,
    required Function() onPressed,
    required Color bgColor,
    required Color fgColor,
    Color? borderColor,
    bool enabled = true,
    bool? isLoading,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        minimumSize: Size(106, 42),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: borderColor != null ? BorderSide(width: 1, color: borderColor) : BorderSide.none,
        ),
        disabledMouseCursor: SystemMouseCursors.forbidden,
        disabledBackgroundColor: AppColors.greyD1D5DB,
      ),
      onPressed: enabled ? onPressed : null,
      child: isLoading == true
          ? SizedBox(width: 18, height: 18, child: CircularProgressIndicator())
          : Text(
              text,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w600,
                color: enabled ? fgColor : Color(0xFF9CA3AF),
                lineHeight: 20 / 14,
              ),
            ),
    );
  }

  Widget _buildErrorWidget(String message, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.read<AlarmConfigDetailBloc>().add(GetAlarmConfigDetail()),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w600,
                color: AppColors.redFF2F2F,
              ),
            ),
            SizedBox(height: 6),
            Icon(Icons.refresh, size: 28, color: AppColors.redFF2F2F),
          ],
        ),
      ),
    );
  }
}
