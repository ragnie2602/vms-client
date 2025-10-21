import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/camera_live/camera_live_screen.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';

import '../bloc/monitor/monitor_bloc.dart';

class MonitorCameras extends StatefulWidget {
  const MonitorCameras({super.key, required this.maxWidth, this.onTap, this.selectedCamera});
  final double maxWidth;
  final Function(CameraEntity)? onTap;
  final CameraEntity? selectedCamera;

  @override
  State<MonitorCameras> createState() => _MonitorCamerasState();
}

class _MonitorCamerasState extends State<MonitorCameras> with StateBuilderMixin {
  final _searchController = TextEditingController();
  late Function(CameraEntity) onTap;
  late CameraEntity? selectedCamera;

  @override
  void initState() {
    onTap = widget.onTap ?? (_) {};
    selectedCamera = widget.selectedCamera;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MonitorCameras oldWidget) {
    super.didUpdateWidget(oldWidget);
    onTap = widget.onTap ?? (_) {};
    selectedCamera = widget.selectedCamera;
  }

  bool _filterFunc(CameraEntity camera) {
    if (_searchController.text.isEmpty) return true;

    return camera.name.toLowerCase().contains(_searchController.text.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => stateBuilder<MonitorSuccess>(
        state,
        child: (state) => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                  prefixIconConstraints: BoxConstraints.tight(Size(20 + 16 + 12, 20)),
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

            SizedBox(height: 20 - 6),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Scrollbar(
                  child: ValueListenableBuilder(
                    valueListenable: _searchController,
                    builder: (context, value, child) {
                      final cameras = state.cameras.where(_filterFunc).toList();

                      return ListView.builder(
                        padding: EdgeInsets.only(bottom: 20),
                        primary: true,
                        itemCount: cameras.length,
                        itemBuilder: (context, index) => _cameraItem(context ,cameras[index]),
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

  Widget _cameraItem(BuildContext context, CameraEntity camera) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.livecamera.name, extra: CameraLiveScreenArgs(data: camera));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        color: selectedCamera?.id == camera.id ? AppColors.greyF2F4FA : Colors.transparent,
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            children: [
              if (constraints.maxWidth >= 20 + 16) ...[
                Container(
                  height: 35,
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppAssets.icVideoOn, width: 20, height: 20),
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
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Đang hoạt động",
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
                  child: CircleAvatar(backgroundColor: Color(0xFF21CCC3)),
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
