import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_type_schedule.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_entity.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/button_config_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/check_box_all_day_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/schedule_time_day_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/time_slot_widget.dart';

const int durationTime = 24;

class ConfigScheduleRecordWidget extends StatefulWidget {
  const ConfigScheduleRecordWidget({
    super.key,
    required this.camera,
    required this.onSave,
    this.isSaving = false,
  });

  final CameraEntity camera;
  final Function(RecordingEntity?) onSave;
  final bool isSaving;

  @override
  State<ConfigScheduleRecordWidget> createState() =>
      _ConfigScheduleRecordWidgetState();
}

class _ConfigScheduleRecordWidgetState
    extends State<ConfigScheduleRecordWidget> {
  // init list schedule time
  List<ScheduleTimeEntity>? scheduleTimeSelected;
  // check box cả ngày
  List<bool> listCheckAllDay = List.generate(
    ScheduleTimeDay.values.length,
    (index) => false,
  );
  int gridItemCount = ScheduleTimeDay.values.length * durationTime;
  // list value in gridview
  List<bool> listGridviewItemValue = List.generate(
    ScheduleTimeDay.values.length * durationTime,
    (e) => false,
  );

  // drag state
  bool? _isDraggingToAdd;
  final Set<int> _draggedIndices = {};

  // lưu record
  RecordingEntity? newRecording;

  @override
  void initState() {
    super.initState();
    scheduleTimeSelected = List.from(
      widget.camera.cameraConfig?.recording?.schedules ?? [],
    );
    _initCheckAllDay();
    _initGridviewItemValue();
  }

  @override
  void dispose() {
    scheduleTimeSelected?.clear();
    listCheckAllDay.clear();
    listGridviewItemValue.clear();
    super.dispose();
  }

  void _initCheckAllDay() {
    for (int i = 0; i < ScheduleTimeDay.values.length; i++) {
      // get day
      final day = ScheduleTimeDay.values[i];
      // check all day
      listCheckAllDay[i] =
          widget.camera.cameraConfig?.recording?.checkAllDay(day) ?? false;
    }
  }

  void _initGridviewItemValue() {
    if ((scheduleTimeSelected ?? []).isEmpty) {
      return;
    }
    for (ScheduleTimeEntity e in scheduleTimeSelected!) {
      // schedule time day (t2 -> CN)
      ScheduleTimeDay? _day = e.dayRecord;
      // start time
      int? _startTime = e.startTime;
      if (_day != null && _startTime != null) {
        // tính row index = dayRecord (t2-CN)
        // tính column index = start time
        // update giá trị cho gridview
        int _rIndex = _day.getIndex;
        int _cIndex = _startTime;

        int indexOfGridView = _rIndex * durationTime + _cIndex;

        if (indexOfGridView >= 0 &&
            indexOfGridView < listGridviewItemValue.length) {
          listGridviewItemValue[indexOfGridView] = true;
        }
      }
    }
  }

  void _updateCheckBox(int index) {
    setState(() {
      listCheckAllDay[index] = !listCheckAllDay[index];
      // update gridview theo checkbox cả ngày
      // index = row index từ t2 - CN (0-6)
      // update cả row theo giá trị mới của checkbox
      for (int i = 0; i < durationTime; i++) {
        int gridIndex = index * durationTime + i;
        if (gridIndex < listGridviewItemValue.length) {
          listGridviewItemValue[gridIndex] = listCheckAllDay[index];
        }
      }
    });
  }

  void _updateGridviewItem(int gridviewIndex) {
    _setGridviewItem(gridviewIndex, !listGridviewItemValue[gridviewIndex]);
  }

  void _setGridviewItem(int gridviewIndex, bool value) {
    setState(() {
      listGridviewItemValue[gridviewIndex] = value;

      // update checkbox cả ngày
      // tính row index
      int rowIndex = getRowIndex(gridviewIndex);
      // check tất cả giá trị của row đó
      // nếu tồn tại 1 ô = false => checkbox cả ngày sẽ = false
      bool isAllDay = true;
      for (int i = 0; i < durationTime; i++) {
        int currentIndex = rowIndex * durationTime + i;
        if (currentIndex < listGridviewItemValue.length &&
            listGridviewItemValue[currentIndex] == false) {
          isAllDay = false;
          break;
        }
      }
      listCheckAllDay[rowIndex] = isAllDay;
    });
  }

  int getRowIndex(int gridItem) {
    return gridItem ~/ durationTime;
  }

  int getColumnIndex(int gridItem) {
    return gridItem % durationTime;
  }

  // update record theo các ô được đánh dấu trong gridview
  void _updateRecord() {
    final currentRecording = widget.camera.cameraConfig?.recording;
    List<ScheduleTimeEntity> schedules = [];
    for (int i = 0; i < listGridviewItemValue.length; i++) {
      if (listGridviewItemValue[i]) {
        int rowIndex = getRowIndex(i);
        int colIndex = getColumnIndex(i);
        schedules.add(
          ScheduleTimeEntity(
            startTime: colIndex,
            endTime: colIndex + 1,
            dayRecord: ScheduleTimeDay.values[rowIndex],
            scheduleTimeEnable: true,
          ),
        );
      }
    }
    newRecording = RecordingEntity(
      turnOnRecording: currentRecording?.turnOnRecording,
      typeScheduleRecording: RecordingTypeSchedule.customizeRecord,
      prefixPath: currentRecording?.prefixPath,
      schedules: schedules,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1. tính tổng width của cả view
        // 2. tính width của gridview = (tổng width - các sizedbox fix cứng width) * tỉ lệ của flex
        // 3. => tính được width, height của từng ô trong grid (vì childAspectRatio = 1 => width = height)
        // 4.1. từ height của ô => set khoảng cách cho cột thứ (thứ 2-CN) và cho checkbox cả ngày
        // 4.2. từ width và height của ô => tính vị trí khi thao tác kéo ô trong grid

        final totalWidth = constraints.maxWidth;
        // Calculate the width of the grid column (flex 648)
        // Fixed widths: 12 + 13 + 5 = 30
        // Total flex: 77 + 648 + 50 = 775
        final availableWidth = totalWidth - 30;
        final gridColumnWidth = availableWidth * 648 / 775;

        // 24 cột, 23 khoảng cách mỗi khoảng 2px -> 46px spacing
        final cellWidth = (gridColumnWidth - 46) / 24;
        final cellHeight = cellWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // column chứa thứ
                Expanded(
                  flex: 77,
                  child: ScheduleTimeDayWidget(
                    rowHeight: cellHeight,
                    spacing: 10,
                  ),
                ),
                Container(width: 12),
                // colum chưa giờ + gridview
                Expanded(
                  flex: 648,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(child: TimeSlotWidget()),
                      const SizedBox(height: 6),
                      Flexible(
                        child: Stack(
                          children: [
                            Container(
                              // color: Colors.pink,
                              padding: EdgeInsets.only(top: 8),
                              child: GestureDetector(
                                onPanStart: (details) {
                                  // calculate index
                                  final localPosition = details.localPosition;
                                  final x = localPosition.dx;
                                  final y = localPosition.dy;

                                  int col = (x / (cellWidth + 2)).floor();
                                  int row = (y / (cellHeight + 10)).floor();

                                  if (col >= 0 && col < 24 && row >= 0) {
                                    int index = row * 24 + col;
                                    if (index >= 0 && index < gridItemCount) {
                                      _isDraggingToAdd =
                                          !listGridviewItemValue[index];
                                      _draggedIndices.clear();
                                      _setGridviewItem(
                                        index,
                                        _isDraggingToAdd!,
                                      );
                                      _draggedIndices.add(index);
                                    }
                                  }
                                },
                                onPanUpdate: (details) {
                                  if (_isDraggingToAdd == null) return;
                                  final localPosition = details.localPosition;
                                  final x = localPosition.dx;
                                  final y = localPosition.dy;

                                  int col = (x / (cellWidth + 2)).floor();
                                  int row = (y / (cellHeight + 10)).floor();

                                  if (col >= 0 && col < 24 && row >= 0) {
                                    int index = row * 24 + col;
                                    if (index >= 0 &&
                                        index < gridItemCount &&
                                        !_draggedIndices.contains(index)) {
                                      _setGridviewItem(
                                        index,
                                        _isDraggingToAdd!,
                                      );
                                      _draggedIndices.add(index);
                                    }
                                  }
                                },
                                onPanEnd: (details) {
                                  _isDraggingToAdd = null;
                                  _draggedIndices.clear();
                                },
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 24,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 2,
                                        childAspectRatio: 1, // adjust height
                                      ),
                                  itemCount: gridItemCount,
                                  itemBuilder: (context, index) {
                                    int columnIndex = getColumnIndex(index);
                                    return InkWell(
                                      onTap: () {
                                        _updateGridviewItem(index);
                                      },
                                      child: Tooltip(
                                        message:
                                            '${columnIndex < 9 ? '0' : ''}$columnIndex:00',
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                listGridviewItemValue[index] ==
                                                    true
                                                ? AppColors.primary
                                                : AppColors.greyE9E9E9,
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: IgnorePointer(
                                child: CustomPaint(
                                  painter: GridLinePainter(
                                    cellWidth: cellWidth,
                                    spacing: 2,
                                    // color: Colors.amber,
                                    color: AppColors.greyE2E8F0,
                                    // color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 13),
                // check box cả ngày
                Expanded(
                  flex: 50,
                  child: CheckBoxAllDayWidget(
                    listCheckAllDay: listCheckAllDay,
                    updateCheckBox: (value) {
                      _updateCheckBox(value);
                    },
                    rowHeight: cellHeight,
                    spacing: 10,
                  ),
                ),
                // padding right
                const SizedBox(width: 5),
              ],
            ),
            ButtonConfigWidget(
              isLoading: widget.isSaving,
              onSave: () {
                _updateRecord();
                widget.onSave.call(newRecording);
              },
            ),
          ],
        );
      },
    );
  }
}

enum TimeSlots { t0, t6, t12, t18, t24 }

extension TimeSlotsExt on TimeSlots {
  String get displayName {
    switch (this) {
      case TimeSlots.t0:
        return '0h00';
      case TimeSlots.t6:
        return '6h00';
      case TimeSlots.t12:
        return '12h00';
      case TimeSlots.t18:
        return '18h00';
      case TimeSlots.t24:
        return '24h00';
    }
  }
}

class GridLinePainter extends CustomPainter {
  final double cellWidth;
  final double spacing;
  final Color color;

  GridLinePainter({
    required this.cellWidth,
    required this.spacing,
    this.color = AppColors.greyE2E8F0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    // 0, 6, 12, 18
    // chỉ vẽ line start cho các mốc 0-18, mốc 24 vẽ line end
    final cols = [0, 6, 12, 18];
    for (var col in cols) {
      // Draw at the start of the column (left edge)
      // This keeps the spacing visible to the left of the line
      double x = col * (cellWidth + spacing);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // 24h (end)
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
