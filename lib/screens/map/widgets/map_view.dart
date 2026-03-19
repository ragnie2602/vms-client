import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/common_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';
import 'package:vms_flutter_client/screens/map/widgets/emap_camera_portal.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/camera_list_popup.dart';

class MapView extends StatefulWidget {
  final ValueNotifier<EmapEntity?> selectedEmap;

  const MapView({super.key, required this.selectedEmap});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final EmapBloc bloc = context.read();
  late final monitorBloc = MonitorBloc(
    context.read(),
    context.read(),
    context.read(),
    context.read(),
  );

  OverlayEntry? _overlayEntry;
  final GlobalKey _imageKey = GlobalKey();
  final GlobalKey _addCameraButtonKey = GlobalKey();

  Offset _dragOffset = Offset.zero;
  final Map<String, Offset> _dragPositions = {};

  final Map<String, GlobalKey> _itemKeys = {};
  final Map<String, GlobalKey> _iconKeys = {};
  final Map<String, GlobalKey> _highlightedIconKeys = {};

  bool _imageRendered = false;
  String? _currentImageUrl;

  @override
  void initState() {
    super.initState();
    monitorBloc.add(GetAllCamera(refresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: BlocConsumer<EmapBloc, EmapState>(
        listener: (context, state) {
          if (state is AddCameraEmapSuccessState) {
            widget.selectedEmap.value = state.emap;
          } else if (state is UpdateCameraEmapSuccessState) {
            widget.selectedEmap.value = state.emap;
          } else if (state is RemoveCameraEmapSuccessState) {
            widget.selectedEmap.value = state.emap;
          } else if (state is AddCameraEmapFailState ||
              state is UpdateCameraEmapFailState ||
              state is RemoveCameraEmapFailState) {
            ToastUtil.toastFail(context: context, title: Text('Có lỗi xảy ra!'));
          }
        },
        builder: (context, state) => _buildContent(context, state),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  Widget _buildContent(BuildContext context, EmapState state) {
    if (state is EmapSuccessState && state.listEmap.isEmpty == true) {
      return Center(
        child: Column(
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
        ),
      );
    }

    return ValueListenableBuilder(
      valueListenable: widget.selectedEmap,
      builder: (context, value, child) {
        if (value == null) {
          if (_imageRendered && mounted) {
            _imageRendered = false;
            _currentImageUrl = null;
          }
          return const SizedBox();
        }
        if (_currentImageUrl != null && _currentImageUrl != value.imageUrl) _imageRendered = false;

        _currentImageUrl = value.imageUrl;

        return Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Stack(
                    children: [
                      Image.network(
                        key: _imageKey,
                        value.imageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (mounted) setState(() => _imageRendered = true);
                            });
                            return child;
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text('Lỗi tải ảnh: ${error.toString()}'));
                        },
                      ),
                      if (_imageRendered)
                        ...widget.selectedEmap.value!.cameraMaps.map((cm) => _buildDragItem(cm)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDragItem(CameraEmapInfoEntity cammap) {
    final RenderBox? imageBox = _imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (imageBox == null) return const SizedBox();
    final h = imageBox.size.height;
    final w = imageBox.size.width;
    final itemId = cammap.id.toString();

    if (!_itemKeys.containsKey(itemId)) _itemKeys[itemId] = GlobalKey();
    if (!_iconKeys.containsKey(itemId)) _iconKeys[itemId] = GlobalKey();
    if (!_highlightedIconKeys.containsKey(itemId)) _highlightedIconKeys[itemId] = GlobalKey();

    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) {
        if (state is MonitorSuccess) {
          final camera = state.cameras.firstWhereOrNull((c) => c.id.equals(cammap.cameraId));
          if (camera == null) return const SizedBox();

          final basePosition = Offset(cammap.xRatio * w, cammap.yRatio * h);
          final position = _dragPositions[itemId] ?? basePosition;

          final item = DragItemModel(
            id: itemId,
            position: position,
            cameraId: camera.id.toString(),
            label: camera.name,
            source: camera.subStreamUri.toString(),
            cameraEmapInfoId: [cammap.id],
          );

          return Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: (details) {
                final cursorPos = imageBox.globalToLocal(details.globalPosition);
                _dragOffset = cursorPos - position;
              },
              onPanUpdate: (details) {
                final cursorPos = imageBox.globalToLocal(details.globalPosition);
                final newPosition = cursorPos - _dragOffset;

                final imageSize = imageBox.size;

                final itemKey = _itemKeys[itemId];
                Size itemSize = const Size(100, 100);
                if (itemKey?.currentContext != null) {
                  final RenderBox? itemBox =
                      itemKey!.currentContext!.findRenderObject() as RenderBox?;
                  if (itemBox != null) itemSize = itemBox.size;
                }

                final iconKey = _iconKeys[itemId];
                Size iconSize = const Size(40, 40);
                if (iconKey?.currentContext != null) {
                  final RenderBox? iconBox =
                      iconKey!.currentContext!.findRenderObject() as RenderBox?;
                  if (iconBox != null) iconSize = iconBox.size;
                }

                final iconOffsetX = (itemSize.width - iconSize.width) / 2;
                final clampedX = newPosition.dx.clamp(
                  -iconOffsetX,
                  imageSize.width - iconSize.width - iconOffsetX,
                );
                final clampedY = newPosition.dy.clamp(0.0, imageSize.height - iconSize.height);

                setState(() => _dragPositions[itemId] = Offset(clampedX, clampedY));
              },
              onPanEnd: (details) {
                final finalPosition = _dragPositions[itemId];
                if (finalPosition != null && widget.selectedEmap.value != null) {
                  bloc.add(
                    UpdateCameraEmapEvent(
                      emapId: widget.selectedEmap.value!.id,
                      cammapId: cammap.id,
                      xRatio: finalPosition.dx / w,
                      yRatio: finalPosition.dy / h,
                    ),
                  );
                }
              },
              child: IntrinsicWidth(
                key: _itemKeys[itemId],
                child: IntrinsicHeight(
                  child: EmapCameraPortal(
                    item: item,
                    onDelete: () => context.read<EmapBloc>().add(
                      RemoveCameraEmapEvent(
                        emapId: widget.selectedEmap.value!.id,
                        cammapId: cammap.id,
                      ),
                    ),
                    highlightChild: Hero(
                      tag: '${itemId}_portal',
                      child: _buildCameraIcon(
                        item,
                        AppColors.blue005AA9,
                        iconKey: _highlightedIconKeys[itemId],
                      ),
                    ),
                    child: Hero(
                      tag: itemId,
                      child: _buildCameraIcon(item, AppColors.black, iconKey: _iconKeys[itemId]),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(
                builder: (buttonContext) => InkWell(
                  onTap: () => showCameraListPopup(context),
                  splashColor: Colors.transparent,
                  child: Container(
                    key: _addCameraButtonKey,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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

  Widget _buildCameraIcon(DragItemModel item, Color backgroundColor, {Key? iconKey}) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            key: iconKey,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SvgPicture.asset(AppAssets.icCameraMap),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: backgroundColor,
            ),
            child: Text(
              item.label ?? "",
              style: AppTypography.style(13, color: AppColors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  showCameraListPopup(BuildContext context) {
    // Lấy vị trí và kích thước của nút "Thêm camera"
    Offset? buttonPosition;
    Size? buttonSize;

    final RenderBox? buttonBox =
        _addCameraButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (buttonBox != null) {
      // Lấy vị trí global (so với màn hình)
      buttonPosition = buttonBox.localToGlobal(Offset.zero);
      buttonSize = buttonBox.size;
    }

    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            right: 22,
            top: buttonPosition != null && buttonSize != null
                ? buttonPosition.dy + buttonSize.height + 11
                : 100,
            child: Material(
              color: Colors.transparent,
              child: CameraListPopup(
                bloc: monitorBloc,
                excludedCameraIds:
                    widget.selectedEmap.value?.cameraMaps.map((item) => item.cameraId).toList() ??
                    [],
                onCameraSelected: (camera) => bloc.add(
                  AddCameraEmapEvent(
                    emapId: widget.selectedEmap.value!.id,
                    cameraEmapInfoEntity: CameraEmapInfoEntity(
                      id: 0,
                      cameraId: camera.id,
                      xRatio: 0.5,
                      yRatio: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
