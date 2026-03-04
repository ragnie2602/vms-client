import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

enum GroupObjectAction { addObject, add, edit, delete }

extension ItemGroupActionExt on GroupObjectAction {
  String getName() {
    switch (this) {
      case GroupObjectAction.addObject:
        return 'Thêm đối tượng';
      case GroupObjectAction.add:
        return 'Thêm nhóm đối tượng';
      case GroupObjectAction.edit:
        return 'Sửa';
      case GroupObjectAction.delete:
        return 'Xóa';
    }
  }

  String get icon {
    switch (this) {
      case GroupObjectAction.addObject:
        return AppAssets.iconAdd;
      case GroupObjectAction.add:
        return AppAssets.iconAdd;
      case GroupObjectAction.edit:
        return AppAssets.iconEdit;
      case GroupObjectAction.delete:
        return AppAssets.iconRemove;
    }
  }

  Widget get widgetView {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(right: 8),
          child: Center(child: SvgPicture.asset(icon)),
        ),
        Text(
          getName(),
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
