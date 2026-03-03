import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';

class SetupInfoFieldDialog extends StatefulWidget {
  final int typeConfig;
  final List<TypeEventDetectEntity>? typeEvents;

  const SetupInfoFieldDialog({super.key, required this.typeConfig, this.typeEvents});

  @override
  State<SetupInfoFieldDialog> createState() => _SetupInfoFieldDialogState();
}

class _SetupInfoFieldDialogState extends State<SetupInfoFieldDialog> {
  late final EventBloc eventBloc;
  late final SetupEventDisplayBloc bloc;

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
              child: BlocConsumer<EventBloc, EventState>(
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
                                      onSelected: () => _changeTab(et),
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
                            child: BlocBuilder<SetupEventDisplayBloc, SetupEventDisplayState>(
                              buildWhen: (previous, current) =>
                                  current is SEDGetEventDisplayConfigSuccess ||
                                  current is SEDGettingEventDisplayConfig ||
                                  current is SEDGetEventDisplayConfigFailure,
                              builder: (context, state) {
                                if (state is SEDGetEventDisplayConfigSuccess) {
                                  return CustomReorderableListView(state.config);
                                } else if (state is SEDGetEventDisplayConfigFailure) {
                                  return Center(child: Text('Không có dữ liệu'));
                                }
                                return Center(child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                listener: (context, state) {
                  if (state is GetAllEventTypeSuccess) {
                    _changeTab(state.eventTypes.first);
                  }
                },
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // WIDGETS
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
          IconButton(
            onPressed: () {
              bloc.add(const CancelChangeConfigs());
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
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
            onPressed: () {
              bloc.add(const CancelChangeConfigs());
              Navigator.pop(context);
            },
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            textStyle: AppTypography.style(
              14,
              color: const Color(0xFF374151),
              lineHeight: 20 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 17),
          BlocBuilder<SetupEventDisplayBloc, SetupEventDisplayState>(
            builder: (context, state) {
              final isLoading = state is SEDSavingConfigs;

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
                label: isLoading ? '' : 'Lưu',
                prefix: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : null,
                prefixGap: isLoading ? 8 : null,
                onPressed: isLoading ? () {} : () => bloc.add(const SaveConfigs()),
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

  // FUNCTIONS
  void _changeTab(EventType et) {
    bloc.add(GetEventDisplayConfig(et.eventKey, widget.typeConfig));
    setState(() => _selectedEventType = et.eventKey);
  }
}

class CustomReorderableListView extends StatefulWidget {
  final EventDisplayConfig config;

  const CustomReorderableListView(this.config, {super.key});

  @override
  State<CustomReorderableListView> createState() => _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  late final SetupEventDisplayBloc bloc;

  final GlobalKey _listKey = GlobalKey();
  OverlayEntry? _popupEntry;

  @override
  void initState() {
    super.initState();
    if (mounted) bloc = context.read();
  }

  @override
  Widget build(BuildContext context) {
    final sf = sortedFields();

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
              setState(() {
                final k = widget.config.sorting.removeAt(oldIndex);
                widget.config.sorting.insert(newIndex, k);
              });
              bloc.add(ChangeConfig(widget.config));
            },
            shrinkWrap: true,
            children: List.generate(sf.length, (index) {
              final f = sf[index];

              return Container(
                key: ValueKey(f.fieldKey),
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
                          SizedBox(width: 24, height: 24, child: _getIconForField(f.icon)),
                          Text(
                            f.fieldName,
                            style: AppTypography.style(14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: SvgPicture.asset(AppAssets.icClose, height: 20, width: 20),
                      onPressed: () {
                        setState(() => widget.config.sorting.remove(f.fieldKey));
                        bloc.add(ChangeConfig(widget.config));
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
          onTap: (canAppend) ? () => showAddDataPopup(context) : null,
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: (canAppend) ? AppColors.secondary : AppColors.grey64748B,
                size: 18,
              ),
              Text(
                'Thêm trường thông tin',
                style: AppTypography.style(
                  14,
                  color: (canAppend) ? AppColors.secondary : AppColors.grey64748B,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _removePopup();
    bloc.add(const CancelChangeConfigs());
    super.dispose();
  }

  bool get canAppend => widget.config.fields.length > widget.config.sorting.length;

  List<Fields> get availableFields =>
      widget.config.fields.where((f) => !widget.config.sorting.contains(f.fieldKey)).toList();

  List<Fields> sortedFields() {
    final Map<String, Fields> fieldsByKey = {for (final f in widget.config.fields) f.fieldKey: f};

    return [
      for (final key in widget.config.sorting)
        if (fieldsByKey.containsKey(key)) fieldsByKey[key]!,
    ];
  }

  Widget _getIconForField(String? url) {
    if (url == null || url.isEmpty) return SizedBox(height: 24, width: 24);

    final isSvg = url.toLowerCase().endsWith('.svg');
    if (isSvg) {
      return SvgPicture.network(
        url,
        width: 20,
        height: 20,
        placeholderBuilder: (context) => const SizedBox(
          width: 20,
          height: 20,
          child: Center(child: CircularProgressIndicator(strokeWidth: 1)),
        ),
        fit: BoxFit.contain,
      );
    } else {
      return Image.network(
        url,
        width: 24,
        height: 24,
        errorBuilder: (context, error, stackTrace) =>
            SvgPicture.asset(AppAssets.icEventType, height: 24, width: 24),
      );
    }
  }

  void _removePopup() {
    _popupEntry?.remove();
    _popupEntry = null;
  }

  void showAddDataPopup(BuildContext context) {
    final _fieldsToShow = availableFields;

    final listContext = _listKey.currentContext;
    if (listContext == null) return;

    final overlayState = Overlay.of(context);
    final RenderBox listBox = listContext.findRenderObject() as RenderBox;
    final RenderBox overlayBox = overlayState.context.findRenderObject() as RenderBox;

    final Offset listBottom = listBox.localToGlobal(
      Offset(0, listBox.size.height),
      ancestor: overlayBox,
    );

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
                        // bloc.add(SetupInfoFieldAddField(optionsToShow[index]));
                        _removePopup();
                      },
                      style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          _fieldsToShow[index].fieldName,
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    itemCount: _fieldsToShow.length,
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
}
