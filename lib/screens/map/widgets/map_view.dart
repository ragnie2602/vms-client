import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/common_util.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/camera_list_popup.dart';

import 'emap_camera_portal.dart';

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
  // Lưu offset của chuột so với góc trên-trái của item khi bắt đầu kéo
  final Map<String, Offset> _dragOffsets = {};
  // Lưu GlobalKey cho mỗi item để lấy kích thước thực tế
  final Map<String, GlobalKey> _itemKeys = {};
  final Map<String, GlobalKey> _iconKeys = {};
  final Map<String, GlobalKey> _highlightedIconKeys = {};

  @override
  void initState() {
    super.initState();
    monitorBloc.add(GetAllCamera(refresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: BlocBuilder<EmapBloc, EmapState>(
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
        if (value == null) return const SizedBox();
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
                        loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                            ? child
                            : Center(child: CircularProgressIndicator()),
                      ),
                      ...widget.selectedEmap.value!.cameraMaps.map((cm) => _buildDragItem(cm)),

                      // ...widget.selectedEmap.value!.cameraMaps.map((item) => _buildDragItem(item)),
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
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) {
        if (state is MonitorSuccess) {
          final camera = state.cameras.firstWhere((c) => c.id.equals(cammap.cameraId));
        }

        return const SizedBox();
      },
    );
    // if (!_itemKeys.containsKey(item.id)) {
    //   _itemKeys[item.id] = GlobalKey();
    // }
    // if (!_iconKeys.containsKey(item.id)) {
    //   _iconKeys[item.id] = GlobalKey();
    // }
    // if (!_highlightedIconKeys.containsKey(item.id)) {
    //   _highlightedIconKeys[item.id] = GlobalKey();
    // }

    // return Positioned(
    //   left: item.position.dx,
    //   top: item.position.dy,
    //   child: GestureDetector(
    //     behavior: HitTestBehavior.opaque,
    //     onPanStart: (details) {
    //       // Lưu offset của chuột so với góc trên-trái của item khi bắt đầu kéo
    //       final RenderBox? imageBox = _imageKey.currentContext?.findRenderObject() as RenderBox?;
    //       if (imageBox != null) {
    //         final localPosition = imageBox.globalToLocal(details.globalPosition);
    //         _dragOffsets[item.id] = localPosition - item.position;
    //       }
    //     },
    //     onPanUpdate: (details) {
    //       // Sử dụng globalPosition để tính toán vị trí chính xác
    //       _updateItemPosition(item.id, details.globalPosition);
    //     },
    //     onPanEnd: (details) {
    //       // Xóa offset đã lưu khi thả item
    //       _dragOffsets.remove(item.id);

    //       // Lấy thông tin state và emap hiện tại
    //       final bloc = context.read<EmapBloc>();
    //       final state = bloc.state;

    //       if (state is EmapSuccessState /* && state.emapSelected != null */ ) {
    //         // Tìm item mới nhất từ state để lấy position đã cập nhật
    //         final updatedItem = state.dragItems?.firstWhere(
    //           (dragItem) => dragItem.id == item.id,
    //           orElse: () => item,
    //         );

    //         // Chỉ gọi API nếu có cameraEmapInfoId (camera đã tồn tại trên map)
    //         if (updatedItem?.cameraEmapInfoId != null &&
    //             updatedItem!.cameraEmapInfoId!.isNotEmpty) {
    //           // Tìm camera trong listCamera để lấy ID gốc
    //           final camera = bloc.listCamera.firstWhere(
    //             (c) => c.name == updatedItem.label,
    //             orElse: () => bloc.listCamera.first, // fallback
    //           );

    //           // Gọi API update position
    //           bloc.add(
    //             UpdateCameraEmapPositionEvent(
    //               emapId: [],
    //               cameraEmapInfoId: updatedItem.cameraEmapInfoId!,
    //               cameraId: camera.id,
    //               newPosition: updatedItem.position,
    //               typeIcon: 0, // default type icon
    //             ),
    //           );
    //         }
    //       }
    //     },
    //     child: IntrinsicWidth(
    //       key: _itemKeys[item.id],
    //       child: IntrinsicHeight(
    //         child: EmapCameraPortal(
    //           item: item,
    //           onDelete: () {
    //             _onDeleteCameraEmap(item);
    //           },
    //           highlightChild: Hero(
    //             tag: '${item.id}_portal',
    //             child: _buildCameraIcon(
    //               item,
    //               AppColors.blue005AA9,
    //               iconKey: _highlightedIconKeys[item.id],
    //             ),
    //           ),
    //           child: Hero(
    //             tag: item.id,
    //             child: _buildCameraIcon(item, AppColors.black, iconKey: _iconKeys[item.id]),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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

  void _onDeleteCameraEmap(DragItemModel item) {
    final bloc = context.read<EmapBloc>();
    final state = bloc.state;

    if (state is EmapSuccessState /* && state.emapSelected != null*/ ) {
      // Kiểm tra nếu có cameraEmapInfoId (camera đã tồn tại trên server)
      if (item.cameraEmapInfoId != null && item.cameraEmapInfoId!.isNotEmpty) {
        // Gọi API xóa + xóa UI
        bloc.add(
          RemoveCameraEmapEvent(
            itemId: item.id,
            emapId: [],
            cameraEmapInfoId: item.cameraEmapInfoId!,
          ),
        );
      } else {
        // Camera chưa lưu trên server, chỉ xóa UI
        bloc.add(RemoveDragItemEvent(itemId: item.id));
      }
    }
  }

  void _updateItemPosition(String itemId, Offset globalPosition) {
    final RenderBox? imageBox = _imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (imageBox == null) return;

    // Chuyển đổi global position sang local position (so với image container)
    final localPosition = imageBox.globalToLocal(globalPosition);

    // Trừ đi offset ban đầu để lấy vị trí góc trên-trái của item
    final dragOffset = _dragOffsets[itemId] ?? Offset.zero;
    final newPosition = localPosition - dragOffset;

    final imageSize = imageBox.size;

    // Lấy kích thước thực tế của item từ RenderBox
    final itemKey = _itemKeys[itemId];
    Size itemSize = const Size(100, 100); // Kích thước mặc định
    if (itemKey?.currentContext != null) {
      final RenderBox? itemBox = itemKey!.currentContext!.findRenderObject() as RenderBox?;
      if (itemBox != null) {
        itemSize = itemBox.size;
      }
    }

    // Lấy kích thước icon
    final iconKey = _iconKeys[itemId];
    Size iconSize = const Size(40, 40); // Kích thước mặc định, fallback
    if (iconKey?.currentContext != null) {
      final RenderBox? iconBox = iconKey!.currentContext!.findRenderObject() as RenderBox?;
      if (iconBox != null) {
        iconSize = iconBox.size;
      }
    }

    // Giới hạn vị trí trong phạm vi của ảnh, chỉ xét icon
    final iconOffsetX = (itemSize.width - iconSize.width) / 2;

    final clampedX = newPosition.dx.clamp(
      -iconOffsetX,
      imageSize.width - iconSize.width - iconOffsetX,
    );
    final clampedY = newPosition.dy.clamp(0.0, imageSize.height - iconSize.height);

    context.read<EmapBloc>().add(
      UpdateDragItemPositionEvent(itemId: itemId, newPosition: Offset(clampedX, clampedY)),
    );
  }

  Widget _buildCameraIcon(DragItemModel item, Color backgroundColor, {Key? iconKey}) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Popup
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
