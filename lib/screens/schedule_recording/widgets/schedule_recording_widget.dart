import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_type_schedule.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dropdown_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/button_config_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/config_schedule_record_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/general_config_camera_widget.dart';

class ScheduleRecordingWidget extends StatefulWidget {
  const ScheduleRecordingWidget({
    super.key,
    required this.camera,
    required this.onSave,
    this.isSaving = false,
  });
  final CameraEntity camera;
  final Function(RecordingEntity?) onSave;
  final bool isSaving;

  @override
  State<ScheduleRecordingWidget> createState() =>
      _ScheduleRecordingWidgetState();
}

class _ScheduleRecordingWidgetState extends State<ScheduleRecordingWidget> {
  RecordingTypeSchedule? typeSelected;

  // get init data schedule record
  @override
  void initState() {
    super.initState();
    // init type record
    typeSelected =
        widget.camera.cameraConfig?.recording?.typeScheduleRecording ??
        RecordingTypeSchedule.alwaysRecord;
    // init data schedule record
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tên
          LineInforWidget(title: 'Tên camera:', content: widget.camera.name),
          // dropdown
          Padding(
            padding: EdgeInsetsGeometry.only(bottom: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Lịch ghi hình:',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: CustomCommonDropdown<RecordingTypeSchedule>(
                          items: RecordingTypeSchedule.values,
                          value: typeSelected,
                          height: 41,
                          onChanged: (p0) {
                            setState(() {
                              typeSelected = p0;
                            });
                          },
                          itemAsString: (p0) => p0.displayName,
                          contentTextStyle: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          hint: Text(
                            'Luôn ghi',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          typeSelected == RecordingTypeSchedule.customizeRecord
              ? ConfigScheduleRecordWidget(
                  camera: widget.camera,
                  isSaving: widget.isSaving,
                  onSave: (value) {
                    widget.onSave.call(value);
                  },
                )
              : ButtonConfigWidget(
                  onSave: () {
                    // lưu luôn với record type là always
                    RecordingEntity? currentRecord =
                        widget.camera.cameraConfig?.recording;
                    RecordingEntity? record = RecordingEntity(
                      turnOnRecording: currentRecord?.turnOnRecording,
                      prefixPath: currentRecord?.prefixPath,
                      typeScheduleRecording: RecordingTypeSchedule.alwaysRecord,
                      schedules: []
                    );
                    widget.onSave.call(record);
                  },
                ),
          Spacer(),
        ],
      ),
    );
  }
}
