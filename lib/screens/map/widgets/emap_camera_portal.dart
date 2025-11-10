import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/screens/group/widget/confirm_remove_view.dart';
import 'package:vms_flutter_client/screens/map/model/drag_item_model.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

class EmapCameraPortal extends StatefulWidget {
  const EmapCameraPortal({
    super.key,
    required this.item,
    required this.child,
    required this.onDelete,
  });
  final DragItemModel item;
  final Widget child;
  final Function() onDelete;

  @override
  State<EmapCameraPortal> createState() => _EmapCameraPortalState();
}

class _EmapCameraPortalState extends State<EmapCameraPortal> {
  final GlobalKey childKey = GlobalKey();
  bool showPlayer = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: childKey,
      onTap: () {
        showPlayer = false;
        final RenderBox box =
            childKey.currentContext!.findRenderObject() as RenderBox;
        final Offset globalOffset = box.localToGlobal(Offset.zero);

        Navigator.of(context, rootNavigator: true).push(
          PageRouteBuilder(
            opaque: false,
            fullscreenDialog: true,
            barrierDismissible: true,
            barrierLabel: '',
            barrierColor: Color(0x80000000),
            pageBuilder: (_, __, ___) => StatefulBuilder(
              builder: (context, setState) => CustomMultiChildLayout(
                delegate: EmapCameraActionsDelegate(
                  widgetOffset: globalOffset,
                  widgetSize: box.size,
                ),
                children: [
                  if (showPlayer)
                    LayoutId(
                      id: 0,
                      child: _wrapMaterial(_buildPlayer(setState)),
                    ),
                  LayoutId(id: 1, child: widget.child),
                  LayoutId(
                    id: 2,
                    child: _wrapMaterial(_buildActionItem(setState)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: widget.child,
    );
  }

  Widget _wrapMaterial(Widget child) =>
      Material(color: Colors.transparent, child: child);
  late final shadows = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      blurRadius: 15,
      offset: Offset(4, 4),
    ),
  ];

  Widget _buildPlayer(void Function(void Function()) setState) {
    return Container(
      width: 500,
      height: 281,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.9),
        boxShadow: shadows,
      ),
      padding: EdgeInsets.all(1),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CameraPlayer(
            source: widget.item.source,
            name: widget.item.label ?? '',
            mode: PlayerMode.monitoring,
            size: Size(500, 281),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () => setState(() => showPlayer = false),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.all(0.5),
                child: SvgPicture.asset(
                  AppAssets.icClose,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(void Function(void Function()) setState) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.9),
        borderRadius: BorderRadius.circular(3),
        boxShadow: shadows,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () => setState(() => showPlayer = !showPlayer),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                AppAssets.tabMonitor,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  showPlayer ? Color(0xFF15ABFF) : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showConfirmRemoveDialog(
                context,
                contentWidget: Text('camera này?'),
                onClickRemove: () {
                  widget.onDelete.call();
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                AppAssets.icDelete,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmapCameraActionsDelegate extends MultiChildLayoutDelegate {
  EmapCameraActionsDelegate({
    required this.widgetOffset,
    required this.widgetSize,
  });
  final Offset widgetOffset;
  final Size widgetSize;

  @override
  void performLayout(Size size) {
    double playerGap = 0;
    double actionGap = 0;

    /* Calculate children sizes */
    Size playerSize = Size.zero;
    Size actionsSize = Size.zero;
    if (hasChild(0)) {
      playerGap = 6;
      playerSize = layoutChild(0, BoxConstraints.loose(size));
    }
    if (hasChild(2)) {
      actionGap = 4;
      actionsSize = layoutChild(2, BoxConstraints.loose(size));
    }

    double _dx = 0;
    double _dy = 0;

    // Trường hợp tràn ra ngoài màn hình phía dưới
    double actionOffsetY = widgetOffset.dy + widgetSize.height + actionGap;
    if (actionOffsetY + actionsSize.height > size.height) {
      _dy = size.height - (actionOffsetY + actionsSize.height) - 1;
    }

    // Trường hợp tràn ra ngoài màn hình bên trái
    if (widgetOffset.dx < 0) _dx = 1;

    // Trường hợp tràn ra ngoài màn hình bên phải
    final edgeRight = widgetOffset.dx + widgetSize.width;
    if (edgeRight > size.width) _dx = size.width - edgeRight - 1;

    // Trường hợp tràn ra ngoài màn hình phía trên
    // Do chỉnh lại playerOffsetY, playerOffsetX nên phải đồng bộ vs _dx _dy ở trước nữa
    double playerOffsetY = widgetOffset.dy - playerGap - playerSize.height;
    double playerOffsetX =
        widgetOffset.dx + widgetSize.width / 2 - playerSize.width / 2;
    if (playerOffsetY < 0) _dy = playerOffsetY.abs() + 1;
    if (playerOffsetX + playerSize.width > size.width) {
      playerOffsetX =
          size.width - playerSize.width - 1 - _dx; // do position đã +_dx
    }
    if (playerOffsetX < 0) playerOffsetX = 1 - _dx; // do position đã +_dx

    /* Position children */
    if (hasChild(0)) {
      positionChild(0, Offset(_dx + playerOffsetX, _dy + playerOffsetY));
    }

    if (hasChild(1)) {
      layoutChild(1, BoxConstraints.tight(widgetSize));
      positionChild(1, widgetOffset + Offset(_dx, _dy));
    }

    if (hasChild(2)) {
      positionChild(
        2,
        Offset(
          _dx + (widgetOffset.dx + widgetSize.width - actionsSize.width),
          _dy + actionOffsetY,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
