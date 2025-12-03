import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/utils/common_util.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

class HierarchyDeviceGroupDropdown extends StatefulWidget {
  final List<DeviceGroup> groups;
  final List<List<int>>? initGroupIdChain;
  final Function(List<List<int>>)? onSelectGroup;

  const HierarchyDeviceGroupDropdown(this.groups, {this.initGroupIdChain, this.onSelectGroup, super.key});

  @override
  State<HierarchyDeviceGroupDropdown> createState() => _HierarchyDeviceGroupDropdownState();
}

class _HierarchyDeviceGroupDropdownState extends State<HierarchyDeviceGroupDropdown> {
  DeviceGroup? selected;

  @override
  void initState() {
    super.initState();
    _updateSelectedFromInit();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColors.greyE2E8F0),
            borderRadius: BorderRadius.circular(3),
          ),
          child: DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            isDense: true,
            isExpanded: true,
            items: widget.groups.map((group) => DropdownMenuItem(value: group, child: Text(group.name))).toList(),
            onChanged: (item) {
              widget.onSelectGroup?.call([item!.groupId]);
              setState(() => selected = item);
            },
            padding: EdgeInsets.symmetric(horizontal: 11, vertical: 12),
            underline: Container(),
            value: selected,
          ),
        ),
        if (selected != null && selected!.groups.isNotEmpty)
          HierarchyDeviceGroupDropdown(
            selected!.groups,
            key: ValueKey(selected!.groupId),
            initGroupIdChain: widget.initGroupIdChain?.copy()?..removeAt(0),
            onSelectGroup: (idChain) => widget.onSelectGroup?.call([selected!.groupId, ...idChain]),
          ),
      ],
    );
  }

  @override
  void didUpdateWidget(HierarchyDeviceGroupDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initGroupIdChain != widget.initGroupIdChain) {
      _updateSelectedFromInit();
    }
  }

  void _updateSelectedFromInit() {
    if (widget.initGroupIdChain?.isNotEmpty == true) {
      selected = widget.groups.firstWhereOrNull((group) => widget.initGroupIdChain!.first.equals(group.groupId));
    } else {
      selected = null;
    }
  }
}
