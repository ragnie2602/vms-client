import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';
import 'package:vms_flutter_client/screens/shared/popup_menu.dart';
import 'package:vms_flutter_client/screens/shared/primary_checkbox.dart';

class AlertFilterBtn extends StatefulWidget {
  const AlertFilterBtn({super.key});

  @override
  State<AlertFilterBtn> createState() => _AlertFilterBtnState();
}

class _AlertFilterBtnState extends State<AlertFilterBtn> {
  late final CustomPopupMenuController _controller = CustomPopupMenuController();

  final List<int> _selectedTypes = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetectBloc, DetectState>(
      builder: (context, state) {
        if (state.status == DetectStatus.loading) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33),
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.black),
                ),
                const SizedBox(width: 6),
                Text(
                  'Đang tải...',
                  style: AppTypography.style(
                    13,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }

        if (state.status == DetectStatus.failure) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33),
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text(
              'Lỗi tải bộ lọc',
              style: AppTypography.style(13, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          );
        }

        if (state.status != DetectStatus.success) {
          return SizedBox.shrink();
        }

        final typeEvents = state.typeEvents;

        return CustomPopupMenu(
          barrierColor: Colors.transparent,
          controller: _controller,
          hideOnItemTap: false,
          horizontalMargin: 0,
          menuBuilder: () => _buildMenu(typeEvents),
          position: PreferredPosition.bottom,
          pressType: PressType.singleClick,
          showArrow: false,
          verticalMargin: -60,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33),
              color: _selectedTypes.isNotEmpty ? AppColors.blueE7F3FF : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getLabel(typeEvents),
                  style: AppTypography.style(
                    13,
                    color: _selectedTypes.isNotEmpty ? AppColors.blue005AA9 : AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6),
                _selectedTypes.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          setState(() => _selectedTypes.clear());
                          context.read<DetectBloc>().add(const UpdateFilterTypes([]));
                        },
                        child: SvgPicture.asset(AppAssets.icCloseRounded, height: 12, width: 12),
                      )
                    : SvgPicture.asset(AppAssets.icArrowdown, height: 4, width: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMenu(List<EventType> typeEvents) {
    return StatefulBuilder(
      builder: (context, menuSetState) {
        void _select(int type) {
          setState(() {
            if (_selectedTypes.contains(type)) {
              _selectedTypes.remove(type);
            } else {
              _selectedTypes.add(type);
            }
          });
          menuSetState(() {});
          context.read<DetectBloc>().add(UpdateFilterTypes(List.from(_selectedTypes)));
        }

        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.white),
          padding: const EdgeInsets.all(15),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: typeEvents.map((typeEvent) {
                final type = typeEvent.type;
                final name = typeEvent.name;
                final isSelected = _selectedTypes.contains(type);

                return InkWell(
                  onTap: () => _select(type),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryCheckbox(onChanged: (v) => _select(type), value: isSelected),
                        const SizedBox(width: 8),
                        Text(
                          name,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  String _getLabel(List<EventType> typeEvents) {
    if (_selectedTypes.length == 1) {
      final selectedType = typeEvents.firstWhereOrNull((e) => e.type == _selectedTypes.first);
      return selectedType?.name ?? '';
    }
    if (_selectedTypes.length > 1) return '${_selectedTypes.length} loại';
    return 'Lọc';
  }
}
