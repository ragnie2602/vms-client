import 'package:flutter/material.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';

class GroupTreeWidget extends StatelessWidget {
  const GroupTreeWidget({super.key, required this.groups});
  final List<DeviceGroup> groups;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: groups.map((group) => _buildNode(group)).toList(),
    );
  }

  Widget _buildNode(DeviceGroup group, {int depth = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 16.0),
      child: group.groups.isEmpty
          ? Text(group.name)
          : ExpansionTile(
              title: Text(group.name),
              children: group.groups
                  .map((e) => _buildNode(e, depth: depth + 1))
                  .toList(),
            ),
    );
  }
}
