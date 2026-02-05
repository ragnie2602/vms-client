import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_type_schedule.dart';

import 'package:vms_flutter_client/screens/camera_configuration/widgets/button_config_widget.dart';
import 'package:vms_flutter_client/screens/camera_configuration/widgets/config_schedule_record_widget.dart';
import 'package:vms_flutter_client/screens/camera_configuration/tabs/general_config_camera_widget.dart';

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
                        child: PopupMenuButton<RecordingTypeSchedule>(
                          tooltip: '',
                          offset: Offset(0, 50),
                          constraints: BoxConstraints(
                            minWidth: 250,
                            maxWidth: 250,
                          ),
                          onSelected: (value) {
                            setState(() {
                              typeSelected = value;
                            });
                          },
                          itemBuilder: (context) => RecordingTypeSchedule.values
                              .map(
                                (e) => PopupMenuItem(
                                  // padding: EdgeInsets.zero,
                                  height: 32,
                                  value: e,
                                  child: Text(
                                    e.displayName,
                                    style: AppTypography.style(
                                      14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: AppColors.greyE2E8F0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: AppColors.greyE2E8F0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                            ),
                            child: Text(
                              typeSelected?.displayName ?? '',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
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
                      schedules: [],
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
