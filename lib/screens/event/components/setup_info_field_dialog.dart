import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';

class SetupInfoFieldDialog extends StatefulWidget {
  final int typeConfig;
  final List<TypeEventDetectEntity>? typeEvents;

  const SetupInfoFieldDialog({super.key, required this.typeConfig, this.typeEvents});

  @override
  State<SetupInfoFieldDialog> createState() => _SetupInfoFieldDialogState();
}

class _SetupInfoFieldDialogState extends State<SetupInfoFieldDialog> {
  late final SetupEventDisplayBloc bloc;
  late final EventBloc eventBloc;

  String _selectedEventType = '';

  @override
  void initState() {
    super.initState();

    bloc = context.read();
    eventBloc = context.read()..add(GetAllEventType());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
        height: max(479, MediaQuery.heightOf(context) * 479 / 900),
        width: max(613, MediaQuery.widthOf(context) * 613 / 1600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            Expanded(
              child: BlocBuilder<EventBloc, EventState>(
                buildWhen: (previous, current) =>
                    current is GettingAllEventType ||
                    current is GetAllEventTypeSuccess ||
                    current is GetAllEventTypeFailure,
                builder: (context, state) {
                  if (state is GettingAllEventType) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is! GetAllEventTypeSuccess) {
                    return const Center(child: Text('Có lỗi xảy ra'));
                  }

                  if (state.eventTypes.isEmpty) return Center(child: Text('Không có dữ liệu'));

                  return Row(
                    children: [
                      Expanded(
                        flex: 200,
                        child: LayoutBuilder(
                          builder: (context, constraints) => Container(
                            color: AppColors.greyF9FAFB,
                            height: constraints.maxHeight,
                            padding: const EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              child: StatefulBuilder(
                                builder: (context, setState) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 4,
                                  children: state.eventTypes.map((et) {
                                    return _buildVerticalTab(
                                      context,
                                      et,
                                      onSelected: () {
                                        bloc.add(
                                          GetEventDisplayConfig(et.eventKey, widget.typeConfig),
                                        );
                                        setState(() => _selectedEventType = et.eventKey);
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 413,
                        child: LayoutBuilder(
                          builder: (context, constraints) => Container(
                            height: constraints.maxHeight,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                            child: CustomReorderableListView(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }
  // ...

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cài đặt hiển thị cảnh báo',
            style: AppTypography.style(20, fontWeight: FontWeight.w600),
          ),
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
        ],
      ),
    );
  }

  Widget _buildVerticalTab(
    BuildContext context,
    EventType typeEvent, {
    required Function() onSelected,
  }) {
    final isSelected = typeEvent.eventKey == _selectedEventType;

    return StatefulBuilder(
      builder: (context, setState) => Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onSelected,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: isSelected ? AppColors.blueEFF6FF : null,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            child: Text(
              typeEvent.name,
              maxLines: 3,
              style: AppTypography.style(
                14,
                color: isSelected ? AppColors.blue005EB8 : AppColors.grey64748B,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          EventCustomButton(
            backgroundColor: AppColors.white,
            borderColor: AppColors.greyD1D5DB,
            borderRadius: 5,
            label: 'Huỷ',
            onPressed: () => Navigator.pop(context),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            textStyle: AppTypography.style(
              14,
              color: const Color(0xFF374151),
              lineHeight: 20 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 17),
          BlocBuilder<SetupInfoFieldBloc, SetupInfoFieldState>(
            buildWhen: (previous, current) => previous.saveStatus != current.saveStatus,
            builder: (context, state) {
              final isLoading = state.saveStatus == SetupInfoFieldStatus.loading;
              return EventCustomButton(
                backgroundColor: AppColors.secondary,
                borderColor: AppColors.secondary,
                borderRadius: 5,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.blue3B82F6.withAlpha(51),
                    offset: Offset(0, 2),
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    blurRadius: 6,
                    color: AppColors.blue3B82F6.withAlpha(51),
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  ),
                ],
                label: 'Lưu',
                prefix: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : null,
                prefixGap: isLoading ? 8 : null,
                onPressed: isLoading
                    ? () {}
                    : () {
                        context.read<SetupInfoFieldBloc>().add(
                          SetupInfoFieldSave(widget.typeConfig),
                        );
                      },
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: AppTypography.style(
                  14,
                  color: AppColors.white,
                  lineHeight: 20 / 14,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomReorderableListView extends StatefulWidget {
  const CustomReorderableListView({super.key});

  @override
  State<CustomReorderableListView> createState() => _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  final GlobalKey _listKey = GlobalKey();
  OverlayEntry? _popupEntry;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupEventDisplayBloc, SetupEventDisplayState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trường dữ liệu', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            DragBoundary(
              child: ReorderableListView(
                key: _listKey,
                buildDefaultDragHandles: false,
                dragBoundaryProvider: (context) => DragBoundary.forRectOf(context),
                onReorder: (int oldIndex, int newIndex) {
                  if (oldIndex < newIndex) newIndex -= 1;
                  context.read<SetupEventDisplayBloc>().add(
                    SetupInfoFieldReorder(oldIndex, newIndex),
                  );
                },
                shrinkWrap: true,
                children: List.generate(state.currentFields.length, (index) {
                  final item = state.currentFields[index];
                  return Container(
                    key: ValueKey(item.code),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyE2E8F0),
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.white,
                    ),
                    margin: const EdgeInsets.only(bottom: 2.5, top: 2.5),
                    child: Row(
                      children: [
                        ReorderableDragStartListener(
                          index: index,
                          child: Container(
                            color: AppColors.greyE2E8F0,
                            height: 40,
                            width: 23,
                            child: Center(child: SvgPicture.asset(AppAssets.icDrawable)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            spacing: 8,
                            children: [
                              SizedBox(width: 24, height: 24, child: _getIconForField(item)),
                              Text(
                                item.label ?? item.code ?? '',
                                style: AppTypography.style(14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: SvgPicture.asset(AppAssets.icClose, height: 20, width: 20),
                          onPressed: () {
                            context.read<SetupInfoFieldBloc>().add(SetupInfoFieldRemoveField(item));
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: (state.availableFields.length == state.currentFields.length)
                  ? null
                  : () => showAddDataPopup(context, state.availableFields, state.currentFields),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: (state.availableFields.length == state.currentFields.length)
                        ? AppColors.grey64748B
                        : AppColors.secondary,
                    size: 18,
                  ),
                  Text(
                    'Thêm trường thông tin',
                    style: AppTypography.style(
                      14,
                      color: (state.availableFields.length == state.currentFields.length)
                          ? AppColors.grey64748B
                          : AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _removePopup();
    super.dispose();
  }

  Widget _getIconForField(FieldConfigEntity item) {
    final iconPath = item.icon;
    if (iconPath == null || iconPath.isEmpty) {
      return SvgPicture.asset(AppAssets.icEventType, height: 24, width: 24);
    }

    final isSvg = iconPath.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.network(
        iconPath,
        width: 20,
        height: 20,
        placeholderBuilder: (context) => const SizedBox(
          width: 20,
          height: 20,
          child: Center(child: CircularProgressIndicator(strokeWidth: 1)),
        ),
        fit: BoxFit.contain,
      );
    }

    return Image.network(
      iconPath,
      width: 24,
      height: 24,
      errorBuilder: (context, error, stackTrace) =>
          SvgPicture.asset(AppAssets.icEventType, height: 24, width: 24),
    );
  }

  void showAddDataPopup(
    BuildContext context,
    List<FieldConfigEntity> availableFields,
    List<FieldConfigEntity> currentFields,
  ) {
    if (_popupEntry != null) {
      _removePopup();
      return;
    }

    final listContext = _listKey.currentContext;
    if (listContext == null) return;

    final overlayState = Overlay.of(context);
    final RenderBox listBox = listContext.findRenderObject() as RenderBox;
    final RenderBox overlayBox = overlayState.context.findRenderObject() as RenderBox;

    final Offset listBottom = listBox.localToGlobal(
      Offset(0, listBox.size.height),
      ancestor: overlayBox,
    );

    final bloc = context.read<SetupInfoFieldBloc>();

    // Filter danh sách cac field có thể thêm (loại các trường đã được setup)
    final optionsToShow = availableFields
        .where((af) => !currentFields.any((cf) => cf.code == af.code))
        .toList();

    _popupEntry = OverlayEntry(
      builder: (ctx) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _removePopup,
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned(
            left: listBottom.dx,
            top: listBottom.dy + 4,
            width: listBox.size.width,
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 60,
                      color: AppColors.grey93989A.withAlpha(51),
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 220),
                  child: ListView.separated(
                    itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        bloc.add(SetupInfoFieldAddField(optionsToShow[index]));
                        _removePopup();
                      },

                      style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          optionsToShow[index].label ?? optionsToShow[index].code ?? '',
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    itemCount: optionsToShow.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    shrinkWrap: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlayState.insert(_popupEntry!);
  }

  void _removePopup() {
    _popupEntry?.remove();
    _popupEntry = null;
  }
}
