import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';

import 'add_camera_dropdown.dart';

import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  OverlayEntry? _overlayEntry;
  List<CameraEntity> _cameras = [];

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _onGetListCamera(c: context); // Lấy danh sách emap
      }
    });
  }

  Future<void> _onGetListCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
    required BuildContext c,
  }) async {
    c.read<EmapBloc>().add(
      GetAllListCameraEvent(
        cameraId: cameraId,
        status: status,
        ivaType: ivaType,
      ),
    );
  }

  void _showAddCameraDropdown(
    BuildContext context,
    BuildContext buttonContext,
    List<CameraEntity> listCamera,
  ) {
    final RenderBox renderBox = buttonContext.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => AddCameraDropdown(
        listCamera: listCamera,
        position: Offset(offset.dx, offset.dy + size.height),
        onClose: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
        onConfirm: (selectedCameras) {},
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildContent(BuildContext context, EmapState state) {
    if (state is EmapLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is EmapSuccessState) {
      if ((state.listEmap ?? []).isEmpty) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SvgPicture.asset(AppAssets.icEmptyEmap),
            ),
            Text(
              'Chưa có bản đồ camera nào. Click + để thêm bản đồ camera',
              style: AppTypography.style(
                14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey64748B,
              ),
            ),
          ],
        );
      }

      return Column(
        children: [
          _buildTopBar(context),
          if (state.emapSelected?.backgroundPath != null)
            Expanded(
              child: Image.network(
                state.emapSelected?.backgroundPath ?? '',
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                    ? child
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      );
    }

    return const SizedBox();
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 40,
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      child: SvgPicture.asset(AppAssets.icSearch),
                    ),
                    hintText: 'Nhập tên camera',
                    hintStyle: AppTypography.style(
                      14,
                      color: AppColors.grey64748B,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.greyE2E8F0,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.greyE2E8F0,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.greyE2E8F0,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Builder(
                builder: (buttonContext) => InkWell(
                  onTap: () {
                    _showAddCameraDropdown(
                      context,
                      buttonContext,
                      context.read<EmapBloc>().listCamera,
                    );
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: AppColors.secondary),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppAssets.icAdd),
                          const SizedBox(width: 8),
                          Text(
                            'Thêm camera',
                            style: AppTypography.style(
                              14,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: BlocConsumer<EmapBloc, EmapState>(
        listenWhen: (previous, current) {
          return true;
        },
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return true;
        },
        builder: (context, state) {
          return _buildContent(context, state);
        },
      ),
    );
  }
}
//"http://ipcam.vivas.vn:8888/vt/static/emap/EfCpkoDwXoS7jwJCwKggAg_preview.jpg"