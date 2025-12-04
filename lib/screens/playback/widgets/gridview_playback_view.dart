import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/playback/widgets/camera_selection_popup.dart';
import 'package:vms_flutter_client/screens/shared/player/playback_player.dart';

class GridviewPlaybackView extends StatefulWidget {
  const GridviewPlaybackView({super.key});

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
    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 5;
        const double padding = 100;
        final double availableWidth = constraints.maxWidth - (padding * 2);
        final double availableHeight = constraints.maxHeight - 20;

        final double itemWidth = (availableWidth - spacing) / 2;
        final double itemHeight = (availableHeight - spacing) / 2;

        final double aspectRatio = itemWidth / itemHeight;

        return Container(
          padding: EdgeInsets.only(left: padding, right: padding, top: 20),
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
                          return Stack(
                            children: [
                              (item.listVideoPlaybacks ?? []).isEmpty
                                  ? _EmptyRecordCameraWidget()
                                  : PlaybackPlayer(
                                      initialIndex: 0,
                                      name: item.camera.name,
                                      controller: item.playerController,
                                      playlist: item.listVideoPlaybacks ?? [],
                                    ),
                              // Close button
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    context.read<MultiPlaybackBloc>().add(
                                      RemoveCameraEvent(
                                        camera: item.camera,
                                        indexCam: index,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: const Color(0x99000000),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 9,
                                    ),
                                    child: SvgPicture.asset(
                                      AppAssets.icClose,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // tên cam
                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.icVideoOn,
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        item.camera.name,
                                        style: AppTypography.style(
                                          9,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
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

class _EmptyRecordCameraWidget extends StatelessWidget {
  const _EmptyRecordCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.icCameraRecord),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 5),
              child: Text(
                'Không có dữ liệu ghi hình tại thời điểm này',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
