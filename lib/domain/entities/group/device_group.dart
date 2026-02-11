import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:diacritic/diacritic.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_status.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_type.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group_role.dart';

class DeviceGroup {
  final String name;
  final List<int> parentGroupId;
  final DeviceGroupStatus status;
  final int level;
  final int createdDate;
  final int lastUpdate;
  final List<int> userCreated;
  final List<DeviceGroup> groups;
  final List<int> groupId;
  final DeviceGroupType groupType;
  final DeviceGroupRole groupRole;
  final String idStr;
  final String parentIdStr;

  DeviceGroup({
    required this.name,
    required this.parentGroupId,
    required this.status,
    required this.level,
    required this.createdDate,
    required this.lastUpdate,
    required this.userCreated,
    required this.groups,
    required this.groupId,
    required this.groupType,
    required this.groupRole,
  }) : idStr = String.fromCharCodes(groupId),
       parentIdStr = String.fromCharCodes(parentGroupId);

  TreeNode<DeviceGroup> toTreeNode() {
    final node = TreeNode<DeviceGroup>(data: this);

    for (final child in groups) {
      node.add(child.toTreeNode());
    }

    return node;
  }

  bool isContainGroupName({required String keywordGroupName}) {
    String _key = removeDiacritics(keywordGroupName.trim().toLowerCase());
    if (removeDiacritics(name.toLowerCase().trim()).contains(_key)) {
      return true;
    }
    for (var e in groups) {
      if (e.isContainGroupName(keywordGroupName: keywordGroupName)) {
        return true;
      }
    }
    return false;
  }

  List<DeviceGroup> convertToOneLevel({int? hideFromLevel}) {
    if (hideFromLevel != null && level >= hideFromLevel) {
      return [];
    }
    List<DeviceGroup> ans = [this];
    for (var e in groups) {
      ans.addAll(e.convertToOneLevel(hideFromLevel: hideFromLevel));
    }
    return ans;
  }
}

extension TreeGroupExt on List<DeviceGroup> {
  TreeNode<DeviceGroup> get convertTree {
    TreeNode<DeviceGroup> tree = TreeNode.root();
    for (var group in this) {
      tree.add(group.toTreeNode());
    }
    return tree;
  }
}
