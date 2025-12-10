import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/playback/widgets/camera_selection_popup.dart';
import 'package:vms_flutter_client/screens/playback/widgets/item_camera_playback_widget.dart';

class GridviewPlaybackView extends StatefulWidget {
  const GridviewPlaybackView({super.key, required this.isOpenFullscreen});
  final bool isOpenFullscreen;

  @override
  State<GridviewPlaybackView> createState() => _GridviewPlaybackViewState();
}

class _GridviewPlaybackViewState extends State<GridviewPlaybackView> {
  final List<LayerLink> _layerLinks = List.generate(4, (index) => LayerLink());
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showCameraPopup(BuildContext context, int index) {
    _removeOverlay();

    final bloc = context.read<MultiPlaybackBloc>();
    final cameras = bloc.state.listCameraOrigin ?? [];

    _overlayEntry = OverlayEntry(
      builder: (context) {
        // Determine alignment based on column (assuming 2 columns)
        // If left column (index % 2 == 0), show to right.
        // If right column (index % 2 == 1), show to left.
        final isLeftColumn = index % 2 == 0;
        final targetAnchor = isLeftColumn
            ? Alignment.centerRight
            : Alignment.centerLeft;
        final followerAnchor = isLeftColumn
            ? Alignment.centerLeft
            : Alignment.centerRight;
        final offset = isLeftColumn
            ? const Offset(10, 0)
            : const Offset(-10, 0);

        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _removeOverlay,
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),
            ),
            CompositedTransformFollower(
              link: _layerLinks[index],
              showWhenUnlinked: false,
              targetAnchor: targetAnchor,
              followerAnchor: followerAnchor,
              offset: offset,
              child: CameraSelectionPopup(
                cameras: cameras,
                onClose: _removeOverlay,
                onCameraSelected: (camera) {
                  bloc.add(AddCameraEvent(newCam: camera, indexCam: index));
                  _removeOverlay();
                },
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    double paddingHorizontal = widget.isOpenFullscreen ? 0 : 100;
    double paddingTop = widget.isOpenFullscreen ? 0 : 20;
    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 5;
        final double availableWidth =
            constraints.maxWidth - (paddingHorizontal * 2);
        final double availableHeight = constraints.maxHeight - paddingTop;

        final double itemWidth = (availableWidth - spacing) / 2;
        final double itemHeight = (availableHeight - spacing) / 2;

        final double aspectRatio = itemWidth / itemHeight;

        return Container(
          padding: EdgeInsets.only(
            left: paddingHorizontal,
            right: paddingHorizontal,
            top: paddingTop,
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: AppColors.white,
                // check view cam
                child:
                    BlocSelector<
                      MultiPlaybackBloc,
                      MultiPlaybackState,
                      List<ItemPlaybackModel>?
                    >(
                      selector: (state) => state.listItemCamPlayback,
                      builder: (context, List<ItemPlaybackModel>? listItem) {
                        // nếu cam được add vào index nào của gridview => update view vào đó
                        final ItemPlaybackModel? item = listItem
                            ?.firstWhereOrNull((e) => e.index == index);
                        if (item != null) {
                          return ItemCameraPlaybackWidget(item: item);
                        }
                        return Center(
                          child: CompositedTransformTarget(
                            link: _layerLinks[index],
                            child: InkWell(
                              onTap: () => _showCameraPopup(context, index),
                              child: SvgPicture.asset(
                                AppAssets.icAddCam,
                                colorFilter: ColorFilter.mode(
                                  AppColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              );
            },
          ),
        );
      },
    );
  }
}
