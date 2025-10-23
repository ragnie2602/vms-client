import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

enum ItemGroupAction { add, addCamera, edit, share, remove }

extension ItemGroupActionExt on ItemGroupAction {
  String getName() {
    switch (this) {
      case ItemGroupAction.add:
        return 'Thêm';
      case ItemGroupAction.edit:
        return 'Sửa';
      case ItemGroupAction.share:
        return 'Chia sẻ';
      case ItemGroupAction.remove:
        return 'Xóa';
      case ItemGroupAction.addCamera:
        return 'Thêm camera';
    }
  }

  String get icon {
    switch (this) {
      case ItemGroupAction.add:
        return AppAssets.iconAdd;
      case ItemGroupAction.edit:
        return AppAssets.iconEdit;
      case ItemGroupAction.share:
        return AppAssets.iconShare;
      case ItemGroupAction.remove:
        return AppAssets.iconRemove;
      case ItemGroupAction.addCamera:
        return AppAssets.iconAddCamToGroup;
    }
  }
}

class ItemActionWidget extends StatelessWidget {
  const ItemActionWidget({super.key, required this.item});
  final ItemGroupAction item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(right: 8),
          child: Center(child: SvgPicture.asset(item.icon)),
        ),
        Text(
          item.getName(),
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
