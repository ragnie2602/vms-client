import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_event.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tag_dropdown.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/tag_management_dialog.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';

import '../bloc/monitor/monitor_bloc.dart';

class MonitorCameras extends StatefulWidget {
  const MonitorCameras({
    super.key,
    required this.maxWidth,
    this.onTap,
    this.selectedCamera,
    this.highlightSelected = false,
  });
  final double maxWidth;
  final Function(CameraEntity)? onTap;
  final CameraEntity? selectedCamera;
  final bool highlightSelected;

  @override
  State<MonitorCameras> createState() => _MonitorCamerasState();
}

class _MonitorCamerasState extends State<MonitorCameras>
    with StateBuilderMixin {
  final _searchController = TextEditingController();
  late Function(CameraEntity) onTap;
  late CameraEntity? selectedCamera;

  late final MonitorBloc _monitorBloc;
  final LayerLink layerLink = LayerLink();
  final Set<TagEntity> _selectedTags = {};
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    context.read<ControlCameraBloc>().add(GetAllTagsEvent());
    onTap = widget.onTap ?? (_) {};
    selectedCamera = widget.selectedCamera;
    super.initState();

    if (mounted) {
      _monitorBloc = MonitorBloc(context.read(), context.read(), context.read())
        ..add(GetAllCamera());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MonitorCameras oldWidget) {
    super.didUpdateWidget(oldWidget);
    onTap = widget.onTap ?? (_) {};
    selectedCamera = widget.selectedCamera;
  }

  bool _filterFunc(CameraEntity camera) {
    bool matchesSearch = true;
    if (_searchController.text.isNotEmpty) {
      matchesSearch = removeDiacritics(
        camera.name.toLowerCase(),
      ).contains(removeDiacritics(_searchController.text.toLowerCase()));
    }

    bool matchesTags = true;
    if (_selectedTags.isNotEmpty) {
      // Check if camera has ANY of the selected tags
      matchesTags = camera.tags.any(
        (cameraTag) => _selectedTags.contains(cameraTag),
      );
    }

    return matchesSearch && matchesTags;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      bloc: _monitorBloc,
      builder: (context, state) => stateBuilder<MonitorSuccess>(
        state,
        child: (state) => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 36,
                child: TextField(
                  controller: _searchController,
                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Tìm kiếm',
                    hintStyle: AppTypography.style(
                      14,
                      color: Color(0xFF8F95B2),
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    prefixIcon: Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 16, left: 12),
                      child: SvgPicture.asset(AppAssets.icSearch),
                    ),
                    prefixIconConstraints: BoxConstraints.tight(
                      Size(20 + 16 + 12, 20),
                    ),
                    suffixIcon: ValueListenableBuilder(
                      valueListenable: _searchController,
                      builder: (context, value, child) => value.text.isEmpty
                          ? const SizedBox.shrink()
                          : InkWell(
                              onTap: () => _searchController.clear(),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: SvgPicture.asset(AppAssets.icClose),
                              ),
                            ),
                    ),
                    fillColor: Color(0xFFF2F4FA),
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            InkWell(
              onTap: () {
                _showAddCameraDropdownTag(context, context, []);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CompositedTransformTarget(
                  link: layerLink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _selectedTags.isEmpty
                            ? "Thẻ Tags"
                            : _selectedTags.length == 1
                            ? _selectedTags.first.name
                            : "${_selectedTags.length} thẻ",
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: _selectedTags.isEmpty
                              ? AppColors.black
                              : AppColors.blue005AA9,
                        ),
                      ),
                      if (_selectedTags.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTags.clear();
                            });
                          },
                          child: Icon(
                            Icons.cancel,
                            size: 16,
                            color: AppColors.blue005AA9,
                          ),
                        ),
                      ],
                      if (_selectedTags.isEmpty)
                        Icon(Icons.arrow_drop_down, color: AppColors.black),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20 - 6),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Scrollbar(
                  child: ValueListenableBuilder(
                    valueListenable: _searchController,
                    builder: (context, value, child) {
                      final cameras = state.cameras.where(_filterFunc).toList();

                      if (cameras.isEmpty &&
                          (value.text.isNotEmpty || _selectedTags.isNotEmpty)) {
                        return _buildSearchEmpty();
                      }

                      return ListView.builder(
                        padding: EdgeInsets.only(bottom: 20),
                        primary: true,
                        itemCount: cameras.length,
                        itemBuilder: (context, index) =>
                            _cameraItem(context, cameras[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchEmpty() {
    return Center(
      child: Text(
        'Không có dữ liệu hiển thị',
        style: AppTypography.style(
          14,
          fontWeight: FontWeight.w600,
          color: AppColors.blackOrWhite,
        ),
      ),
    );
  }

  void _showAddCameraDropdownTag(
    BuildContext mainContext,
    BuildContext buttonContext,
    List<TagEntity> listCamera,
  ) {
    final RenderBox renderBox = buttonContext.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    final excludedCameraNames = <String>{};
    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => BlocProvider.value(
        value: mainContext.read<ControlCameraBloc>(),
        child: TagDropdown(
          excludedCameraNames:
              excludedCameraNames, // Truyền danh sách camera đã có
          onClose: () {
            _overlayEntry?.remove();
            _overlayEntry = null;
          },
          onOpenTagManagement: (tags) {
            _overlayEntry?.remove();
            _overlayEntry = null;
            _showTagManagementDialog(mainContext, tags);
          },
          onTagSelected: (tag) {
            setState(() {
              if (_selectedTags.contains(tag)) {
                _selectedTags.remove(tag);
              } else {
                _selectedTags.add(tag);
              }
            });
          },
          selectedTags: _selectedTags,
          tagLayerLink: layerLink,
          targeterOffset: Offset(offset.dx, offset.dy + size.height),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _showTagManagementDialog(
    BuildContext mainContext,
    List<TagEntity> tags,
  ) {
    showDialog(
      context: mainContext,
      builder: (context) => BlocProvider.value(
        value: mainContext.read<ControlCameraBloc>(),
        child: TagManagementDialog(tags: tags),
      ),
    );
  }

  Widget _cameraItem(BuildContext context, CameraEntity camera) {
    return InkWell(
      onTap: () {
        if (selectedCamera?.id == camera.id) return;
        onTap(camera);
        if (widget.highlightSelected) setState(() => selectedCamera = camera);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        color: selectedCamera?.camId == camera.camId
            ? AppColors.greyF2F4FA
            : Colors.transparent,
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            children: [
              if (constraints.maxWidth >= 20 + 16) ...[
                Container(
                  height: 35,
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppAssets.icVideoOn,
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(width: 16),
              ],
              if (constraints.maxWidth >= 20 + 16)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        camera.name,
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackOrWhite,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: 6),
                      Text(
                        camera.isOnline ? "Đang hoạt động" : "Dừng hoạt động",
                        style: AppTypography.style(
                          12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF647488),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              if (constraints.maxWidth >= widget.maxWidth - 24 - 24) ...[
                SizedBox(width: 8),
                SizedBox.square(
                  dimension: 8,
                  child: CircleAvatar(
                    backgroundColor: camera.isOnline
                        ? Color(0xFF21CCC3)
                        : Color(0xFF64748B),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
