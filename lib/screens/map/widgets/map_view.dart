import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/data/models/drag_item_model.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

import 'add_camera_dropdown.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _imageKey = GlobalKey();
  // Lưu offset của chuột so với góc trên-trái của item khi bắt đầu kéo
  final Map<String, Offset> _dragOffsets = {};

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void _updateItemPosition(String itemId, Offset globalPosition) {
    final RenderBox? imageBox =
        _imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (imageBox == null) return;

    // Chuyển đổi global position sang local position (so với image container)
    final localPosition = imageBox.globalToLocal(globalPosition);

    // Trừ đi offset ban đầu để lấy vị trí góc trên-trái của item
    final dragOffset = _dragOffsets[itemId] ?? Offset.zero;
    final newPosition = localPosition - dragOffset;

    final imageSize = imageBox.size;
    const itemSize = 100.0;

    // Giới hạn vị trí trong phạm vi của ảnh
    final clampedX = newPosition.dx.clamp(0.0, imageSize.width - itemSize);
    final clampedY = newPosition.dy.clamp(0.0, imageSize.height - itemSize);

    context.read<EmapBloc>().add(
      UpdateDragItemPositionEvent(
        itemId: itemId,
        newPosition: Offset(clampedX, clampedY),
      ),
    );
  }

  void _showAddCameraDropdown(
    BuildContext context,
    BuildContext buttonContext,
  ) {
    final RenderBox renderBox = buttonContext.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => AddCameraDropdown(
        position: Offset(offset.dx, offset.dy + size.height),
        onClose: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
        onSelectCamera: (cameraName) {
          final newItem = DragItemModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(), // hoặc UUID
            position: Offset(100, 100), // vị trí mặc định
            label: cameraName,
          );

          context.read<EmapBloc>().add(AddDragItemEvent(item: newItem));

          _overlayEntry?.remove();
          _overlayEntry = null;
        },
        onDeselectCamera: (String cameraName) {
          context.read<EmapBloc>().add(RemoveDragItemEvent(itemId: cameraName));
        },
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: BlocBuilder<EmapBloc, EmapState>(
        builder: (context, state) => state is EmapSuccessState
            ? ((state.listEmap ?? []).isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.only(bottom: 16),
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
                    )
                  : Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 40,
                                    child: TextField(
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        prefixIcon: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 12,
                                          ),
                                          child: SvgPicture.asset(
                                            AppAssets.icSearch,
                                          ),
                                        ),
                                        hintText: 'Nhập tên camera',
                                        hintStyle: AppTypography.style(
                                          14,
                                          color: AppColors.grey64748B,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 12,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColors.greyE2E8F0,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColors.greyE2E8F0,
                                            width: 1,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
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
                                      onTap: () => _showAddCameraDropdown(
                                        context,
                                        buttonContext,
                                      ),
                                      splashColor: Colors.transparent,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.secondary,
                                          ),
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
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              // Wrap Image với Container có key để lấy kích thước chính xác
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return Container(
                                    key: _imageKey,
                                    child: Image.network(
                                      state.emapSelected?.backgroundPath ?? '',
                                      fit: BoxFit.contain,
                                      loadingBuilder:
                                          (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) => loadingProgress == null
                                          ? child
                                          : Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                    ),
                                  );
                                },
                              ),
                              ...(state.dragItems ?? []).map(
                                (item) => _buildDragItem(item),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
            : const SizedBox(),
      ),
    );
  }

  Widget _buildDragItem(DragItemModel item) {
    return Positioned(
      left: item.position.dx,
      top: item.position.dy,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (details) {
          // Lưu offset của chuột so với góc trên-trái của item khi bắt đầu kéo
          final RenderBox? imageBox =
              _imageKey.currentContext?.findRenderObject() as RenderBox?;
          if (imageBox != null) {
            final localPosition = imageBox.globalToLocal(
              details.globalPosition,
            );
            _dragOffsets[item.id] = localPosition - item.position;
          }
        },
        onPanUpdate: (details) {
          // Sử dụng globalPosition để tính toán vị trí chính xác
          _updateItemPosition(item.id, details.globalPosition);
        },
        onPanEnd: (details) {
          // Xóa offset đã lưu khi thả item
          _dragOffsets.remove(item.id);
          print('Item ${item.id} dropped at: ${item.position}');
          // Có thể lưu vào database tại đây
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(child: SvgPicture.asset(AppAssets.icCameraMap)),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.black,
              ),
              child: Text(
                item.label ?? "",
                style: AppTypography.style(
                  13,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//"http://ipcam.vivas.vn:8888/vt/static/emap/EfCpkoDwXoS7jwJCwKggAg_preview.jpg"