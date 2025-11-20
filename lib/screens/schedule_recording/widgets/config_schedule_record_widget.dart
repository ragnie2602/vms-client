import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_day.dart';
import 'package:vms_flutter_client/domain/entities/schedule/schedule_time_entity.dart';

const int durationTime = 24;

class ConfigScheduleRecordWidget extends StatefulWidget {
  const ConfigScheduleRecordWidget({super.key, required this.camera});
  final CameraEntity camera;
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

  @override
  void initState() {
    super.initState();
    scheduleTimeSelected =
        widget.camera.cameraConfig?.recording?.schedules ?? [];
    _initCheckAllDay();
    _initGridviewItemValue();
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

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // column chứa thứ
        Expanded(
          flex: 77,
          child: Padding(
            padding: EdgeInsetsGeometry.only(top: 29),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final day = ScheduleTimeDay.values[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Text(
                    day.displayName,
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black0D0D0D,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 15),
              itemCount: ScheduleTimeDay.values.length,
            ),
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
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // width available for the grid area
                    final gridWidth = constraints.maxWidth;

                    // lấy khoảng cách giữa các mốc/2 (tránh mốc cuối bị overflow)
                    final cellWidth =
                        gridWidth / ((TimeSlots.values.length - 1) * 2);
                    return SizedBox(
                      height: 14,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final timeSlot = TimeSlots.values[index];
                          return Container(
                            width: index < TimeSlots.values.length - 2
                                ? 2 * cellWidth
                                : cellWidth,
                            alignment: index < TimeSlots.values.length - 1
                                ? Alignment.centerLeft
                                : Alignment.centerRight,

                            child: Text(
                              timeSlot.displayName,
                              style: AppTypography.style(
                                12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.redFF0000,
                              ),
                            ),
                          );
                        },
                        itemCount: TimeSlots.values.length,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    // 24 columns, 23 gaps of 2px
                    // width = 24 * cellWidth + 23 * 2
                    // cellWidth = (width - 46) / 24
                    final cellWidth = (width - 46) / 24;
                    // cellHeight = cellWidth / childAspectRatio (1) = cellWidth
                    // mainAxisSpacing = 10
                    final cellHeight = cellWidth;

                    return GestureDetector(
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
                            _isDraggingToAdd = !listGridviewItemValue[index];
                            _draggedIndices.clear();
                            _setGridviewItem(index, _isDraggingToAdd!);
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
                            _setGridviewItem(index, _isDraggingToAdd!);
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                  '${columnIndex < 9 ? '0' : ''}${columnIndex}h:00',
                              child: Container(
                                decoration: BoxDecoration(
                                  color: listGridviewItemValue[index] == true
                                      ? AppColors.primary
                                      : AppColors.greyE9E9E9,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 13),
        // check box cả ngày
        Expanded(
          flex: 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cả ngày',
                style: AppTypography.style(
                  12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.redFF0000,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        side: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1.0,
                        ),
                        activeColor: AppColors.blue005AA9,
                        value: listCheckAllDay[index],
                        onChanged: (_) {
                          _updateCheckBox(index);
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  },
                  itemCount: ScheduleTimeDay.values.length,
                  separatorBuilder: (context, index) => SizedBox(height: 13),
                ),
              ),
            ],
          ),
        ),
        // padding right
        const SizedBox(width: 5),
      ],
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
