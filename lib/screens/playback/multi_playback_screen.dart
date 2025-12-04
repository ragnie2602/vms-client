import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/playback/widgets/camera_selection_popup.dart';
import 'package:vms_flutter_client/screens/playback/widgets/menu_select_date_playback.dart';
import 'package:vms_flutter_client/screens/playback/widgets/multi_playback_timeshift_widget.dart';
import 'package:vms_flutter_client/screens/shared/action_item.dart';
import 'package:vms_flutter_client/screens/shared/player/playback_player.dart';
import 'package:vms_flutter_client/screens/shared/player/sources.dart';

class MultiPlaybackScreen extends StatefulWidget {
  const MultiPlaybackScreen({super.key});

  @override
  State<MultiPlaybackScreen> createState() => _MultiPlaybackScreenState();
}

class _MultiPlaybackScreenState extends State<MultiPlaybackScreen> {
  @override
  void initState() {
    _initState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initState() {
    context.read<MultiPlaybackBloc>().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // thanh menu: date + back
          _MenuAction(),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.scaffoldBg,
          ),
          // gridview camera
          Flexible(
            child:
                BlocSelector<
                  MultiPlaybackBloc,
                  MultiPlaybackState,
                  MultiPlaybackStatus
                >(
                  selector: (state) => state.multiPlaybackStatus,
                  builder: (context, multiPlaybackStatus) => Stack(
                    children: [
                      GridviewPlaybackView(),
                      if (multiPlaybackStatus == MultiPlaybackStatus.loading)
                        Positioned.fill(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 10,
                            ),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                    ],
                  ),
                ),
          ),
          // time shift
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 100,
              vertical: 10,
            ),
            child: MultiPlaybackTimeshiftWidget(
              size: Size(double.infinity, 55),
              normalStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.2),
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
              ),
              highlightStyle: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.2),
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
              ),
              playbackColor: Color.fromRGBO(21, 171, 255, 0.4),
              centralLineColor: Color.fromRGBO(33, 204, 195, 1),
            ),
          ),
          // thanh điều khiển (pause, tua)
        ],
      ),
    );
  }
}

class _MenuAction extends StatelessWidget {
  const _MenuAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.contentBg,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuSelectDatePlayback(),
          ActionItem(
            title: 'Xem từng camera',
            icon: AppAssets.icMenu,
            isSelected: false,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

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
                          return PlaybackPlayer(
                            initialIndex: 0,
                            name: item.camera.name,
                            controller: item.playerController,
                            playlist: item.listVideoPlaybacks ?? [],
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
