import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';

import 'add_camera_dropdown.dart';
import 'emap_camera_portal.dart';

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
  // Lưu GlobalKey cho mỗi item để lấy kích thước thực tế
  final Map<String, GlobalKey> _itemKeys = {};

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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

  void _onDeleteCameraEmap(DragItemModel item) {
    final bloc = context.read<EmapBloc>();
    final state = bloc.state;

    if (state is EmapSuccessState && state.emapSelected != null) {
      // Kiểm tra nếu có cameraEmapInfoId (camera đã tồn tại trên server)
      if (item.cameraEmapInfoId != null && item.cameraEmapInfoId!.isNotEmpty) {
        // Gọi API xóa + xóa UI
        bloc.add(
          RemoveCameraEmapEvent(
            itemId: item.id,
            emapId: state.emapSelected!.emapId ?? [],
            cameraEmapInfoId: item.cameraEmapInfoId!,
          ),
        );
      } else {
        // Camera chưa lưu trên server, chỉ xóa UI
        bloc.add(RemoveDragItemEvent(itemId: item.id));
      }
    }
  }

  void _onAddCameraEmap(CameraEntity cameraEntity) {
    final bloc = context.read<EmapBloc>();
    final state = bloc.state;

    if (state is! EmapSuccessState) return;

    // Tìm camera theo tên
    final camera = bloc.listCamera.firstWhere(
      (c) => c.name == cameraEntity.name,
      orElse: () => throw Exception('Camera not found'),
    );

    // Tạo random position
    final randomPosition = _getRandomPosition() ?? Offset.zero;
    // Gọi API thông qua AddCameraEmapEvent
    // Bloc sẽ tự động thêm camera vào dragItems và emit EmapSuccessState
    bloc.add(
      AddCameraEmapEvent(
        emapId: state.emapSelected?.emapId ?? [],
        cameraEmapInfoEntity: CameraEmapInfoEntity(
          cameraId: camera.id,
          typeIcon: 0, // default type icon
          xCoordinate: randomPosition.dx.toInt(),
          yCoordinate: randomPosition.dy.toInt(),
          cameraEmapInfoId: [], // server sẽ tạo ID mới
        ),
      ),
    );

    // Không đóng dropdown, để user tiếp tục chọn camera khác
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

    // Lấy kích thước thực tế của item từ RenderBox
    final itemKey = _itemKeys[itemId];
    Size itemSize = Size(100, 100); // Kích thước mặc định
    if (itemKey?.currentContext != null) {
      final RenderBox? itemBox =
          itemKey!.currentContext!.findRenderObject() as RenderBox?;
      if (itemBox != null) {
        itemSize = itemBox.size;
      }
    }

    // Giới hạn vị trí trong phạm vi của ảnh
    final clampedX = newPosition.dx.clamp(
      0.0,
      imageSize.width - itemSize.width,
    );
    final clampedY = newPosition.dy.clamp(
      0.0,
      imageSize.height - itemSize.height,
    );

    context.read<EmapBloc>().add(
      UpdateDragItemPositionEvent(
        itemId: itemId,
        newPosition: Offset(clampedX, clampedY),
      ),
    );
  }

  /// Trả về vị trí ngẫu nhiên trong khu vực hiển thị của ảnh
  /// Returns null nếu image chưa được render
  Offset? _getRandomPosition() {
    final RenderBox? imageBox =
        _imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (imageBox == null) return null;

    final imageSize = imageBox.size;
    const itemSize = 100.0; // Kích thước của item (icon + label)

    // Tính toán phạm vi hợp lệ để item không bị tràn ra ngoài
    final maxX = imageSize.width - itemSize;
    final maxY = imageSize.height - itemSize;

    // Nếu image quá nhỏ, không thể đặt item
    if (maxX <= 0 || maxY <= 0) {
      return Offset.zero;
    }

    final random = Random();
    final randomX = random.nextDouble() * maxX;
    final randomY = random.nextDouble() * maxY;

    return Offset(randomX, randomY);
  }

  void _showAddCameraDropdown(
    BuildContext context,
    BuildContext buttonContext,
    List<CameraEntity> listCamera,
  ) {
    final RenderBox renderBox = buttonContext.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    // Lấy danh sách tên camera đã có trên map hiện tại
    final bloc = context.read<EmapBloc>();
    final state = bloc.state;
    final excludedCameraNames = <String>{};
    if (state is EmapSuccessState) {
      excludedCameraNames.addAll(
        state.dragItems
                ?.map((item) => item.label ?? '')
                .where((name) => name.isNotEmpty) ??
            [],
      );
    }

    List<CameraEntity> listCameraEntity = List.from(listCamera);
    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => AddCameraDropdown(
        listCamera: listCameraEntity,
        excludedCameraNames:
            excludedCameraNames, // Truyền danh sách camera đã có
        position: Offset(offset.dx, offset.dy + size.height),
        onClose: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
        onSelectCamera: (cameraEntity) {
          _onAddCameraEmap(cameraEntity);
        },
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
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                              ? child
                              : Center(child: CircularProgressIndicator()),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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

  Widget _buildDragItem(DragItemModel item) {
    // Tạo hoặc lấy GlobalKey cho item này
    if (!_itemKeys.containsKey(item.id)) {
      _itemKeys[item.id] = GlobalKey();
    }

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

          // Lấy thông tin state và emap hiện tại
          final bloc = context.read<EmapBloc>();
          final state = bloc.state;

          if (state is EmapSuccessState && state.emapSelected != null) {
            // Tìm item mới nhất từ state để lấy position đã cập nhật
            final updatedItem = state.dragItems?.firstWhere(
              (dragItem) => dragItem.id == item.id,
              orElse: () => item,
            );

            // Chỉ gọi API nếu có cameraEmapInfoId (camera đã tồn tại trên map)
            if (updatedItem?.cameraEmapInfoId != null &&
                updatedItem!.cameraEmapInfoId!.isNotEmpty) {
              // Tìm camera trong listCamera để lấy ID gốc
              final camera = bloc.listCamera.firstWhere(
                (c) => c.name == updatedItem.label,
                orElse: () => bloc.listCamera.first, // fallback
              );

              debugPrint(
                'Updating camera position: ${updatedItem.label} at (${updatedItem.position.dx.toInt()}, ${updatedItem.position.dy.toInt()})',
              );

              // Gọi API update position
              bloc.add(
                UpdateCameraEmapPositionEvent(
                  emapId: state.emapSelected!.emapId ?? [],
                  cameraEmapInfoId: updatedItem.cameraEmapInfoId!,
                  cameraId: camera.id,
                  newPosition: updatedItem.position,
                  typeIcon: 0, // default type icon
                ),
              );
            }
          }
        },
        child: EmapCameraPortal(
          item: item,
          onDelete: () {
            _onDeleteCameraEmap(item);
          },
          highlightChild: Hero(
            tag: item.id,
            child: _buildCameraIcon(item, AppColors.blue005AA9),
          ),
          child: Hero(
            tag: item.id,
            child: _buildCameraIcon(item, AppColors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildCameraIcon(DragItemModel item, Color backgroundColor) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          // Popup
          IntrinsicWidth(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(child: SvgPicture.asset(AppAssets.icCameraMap)),
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: backgroundColor,
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
    );
  }
}

//"http://ipcam.vivas.vn:8888/vt/static/emap/EfCpkoDwXoS7jwJCwKggAg_preview.jpg"
