import 'dart:async';
import 'dart:io';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/add_edit_group_object_widget.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/add_object_dialog.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/confirm_remove_group_widget.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/group_object_action.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/group_object_tree_widget.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/object_list_table.dart';

class ObjectGroupScreen extends StatefulWidget {
  const ObjectGroupScreen({super.key});

  @override
  State<ObjectGroupScreen> createState() => _ObjectGroupScreenState();
}

class _ObjectGroupScreenState extends State<ObjectGroupScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _groupSearchController = TextEditingController();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<ObjectGroupBloc>();
    // reset clear data cũ
    bloc.add(const ResetObjectGroupState());
    _groupSearchController.text = '';
    // load init data mới
    bloc.add(const LoadObjectTypes(page: 1, size: 20));
    bloc.add(const LoadSubjectGroups());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _groupSearchController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  void _onSearch() {
    final bloc = context.read<ObjectGroupBloc>();
    final state = bloc.state;
    final selectedType = state.selectedObjectType;
    if (selectedType == null) return;

    final searchText = _searchController.text.trim();
    bloc.add(
      LoadObjects(
        objectTypeId: selectedType.id,
        subjectGroupId: state.selectedSubjectGroup?.id ?? 0,
        search: searchText.isNotEmpty ? searchText : null,
      ),
    );
  }

  // === Template download ===
  Future<void> _onDownloadTemplate(BuildContext context) async {
    final state = context.read<ObjectGroupBloc>().state;
    final selectedType = state.selectedObjectType;
    if (selectedType == null) {
      ToastUtil.toastFail(
        context: context,
        title: const Text('Vui lòng chọn loại đối tượng'),
      );
      return;
    }

    try {
      ToastUtil.toastSuccess(
        context: context,
        title: const Text('Đang tải file mẫu...'),
      );
      final repo = context.read<IObjectGroupRepository>();
      final tempPath = await repo.downloadTemplate(selectedType.id);

      // Copy to Downloads or let user choose save location
      final downloadsDir =
          await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
      final dateStr = DateFormat('ddMMyyyy').format(DateTime.now());
      final fileName = 'File mẫu_${selectedType.name}_$dateStr.xlsx';
      final savePath = '${downloadsDir.path}/$fileName';

      await File(tempPath).copy(savePath);
      await File(tempPath).delete();

      if (context.mounted) {
        ToastUtil.toastSuccess(
          context: context,
          title: Text('Đã tải file mẫu: $fileName'),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ToastUtil.toastFail(
          context: context,
          title: Text('Tải file mẫu thất bại: $e'),
        );
      }
    }
  }

  // === Import data ===
  Future<void> _onImportData(BuildContext context) async {
    final state = context.read<ObjectGroupBloc>().state;
    final selectedType = state.selectedObjectType;
    if (selectedType == null) {
      ToastUtil.toastFail(
        context: context,
        title: const Text('Vui lòng chọn loại đối tượng'),
      );
      return;
    }

    // Pick file
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );

    if (result == null || result.files.isEmpty) return;
    final filePath = result.files.first.path;
    if (filePath == null) return;

    // Validate file extension
    final ext = p.extension(filePath).toLowerCase();
    if (ext != '.xlsx') {
      if (context.mounted) {
        ToastUtil.toastFail(
          context: context,
          title: const Text('File không đúng định dạng, vui lòng chọn lại.'),
        );
      }
      return;
    }

    // Validate file size (max 5MB)
    final fileSize = await File(filePath).length();
    if (fileSize > 5 * 1024 * 1024) {
      if (context.mounted) {
        ToastUtil.toastFail(
          context: context,
          title: const Text('File vượt quá 5MB, vui lòng chọn lại.'),
        );
      }
      return;
    }

    try {
      final repo = context.read<IObjectGroupRepository>();
      final subjectGroupId = state.selectedSubjectGroup?.id ?? 0;
      final subjectGroupIds = subjectGroupId > 0 ? [subjectGroupId] : <int>[];

      // Upload file and get import result
      final importResult = await repo.importObjects(
        selectedType.id,
        filePath,
        subjectGroupIds,
      );

      if (!context.mounted) return;

      final successfulRows = importResult['successfulRows'] ?? 0;
      final failedRows = importResult['failedRows'] ?? 0;
      final status = (importResult['status'] ?? '').toString().toUpperCase();

      if (status == 'COMPLETED' || status == 'DONE' || status == 'SUCCESS') {
        if (failedRows == 0 && successfulRows > 0) {
          // Case 1: 100% success
          ToastUtil.toastSuccess(
            context: context,
            title: Text('Tải lên thành công $successfulRows đối tượng.'),
          );
        } else if (successfulRows > 0 && failedRows > 0) {
          // Case 2: Partial success
          ToastUtil.toastWarning(
            message:
                'Tải thành công $successfulRows đối tượng. Bỏ qua $failedRows bản ghi không hợp lệ.',
          );
        } else {
          // Case 3: All failed
          ToastUtil.toastFail(
            context: context,
            title: const Text(
              'Tải lên không thành công. Không có bản ghi nào hợp lệ.',
            ),
          );
        }
      } else {
        // Unexpected status — show generic message
        ToastUtil.toastFail(
          context: context,
          title: Text(
            'Import thất bại: ${importResult['message'] ?? 'Lỗi không xác định'}',
          ),
        );
      }

      // Refresh objects list
      context.read<ObjectGroupBloc>().add(
        LoadObjects(
          objectTypeId: selectedType.id,
          subjectGroupId: subjectGroupId,
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ToastUtil.toastFail(
          context: context,
          title: Text('Import thất bại: $e'),
        );
      }
    }
  }

  // === Export data ===
  Future<void> _onExportData(BuildContext context) async {
    final state = context.read<ObjectGroupBloc>().state;
    final selectedType = state.selectedObjectType;
    if (selectedType == null) {
      ToastUtil.toastFail(
        context: context,
        title: const Text('Vui lòng chọn loại đối tượng'),
      );
      return;
    }

    try {
      ToastUtil.toastSuccess(
        context: context,
        title: const Text('Đang xuất file...'),
      );
      final repo = context.read<IObjectGroupRepository>();
      final subjectGroupId = state.selectedSubjectGroup?.id ?? 0;
      final searchQuery = state.searchQuery;
      final tempPath = await repo.exportObjects(
        selectedType.id,
        subjectGroupId: subjectGroupId > 0 ? subjectGroupId : null,
        search: searchQuery.isNotEmpty ? searchQuery : null,
      );

      // Copy to Downloads
      final downloadsDir =
          await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
      final dateStr = DateFormat('ddMMyyyy').format(DateTime.now());
      final groupName = state.selectedSubjectGroup?.name ?? 'Tất cả';
      final fileName =
          'Danhsach_${selectedType.name}_${groupName}_$dateStr.xlsx';
      final savePath = '${downloadsDir.path}/$fileName';

      await File(tempPath).copy(savePath);
      await File(tempPath).delete();

      if (context.mounted) {
        ToastUtil.toastSuccess(
          context: context,
          title: Text('Đã xuất file: $fileName'),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ToastUtil.toastFail(
          context: context,
          title: Text('Xuất file thất bại: $e'),
        );
      }
    }
  }

  // add group
  void _onShowDialogAddGroupObject({
    required BuildContext c,
    required TreeNode<SubjectGroup> tree,
    SubjectGroup? parentGroup,
  }) {
    List<SubjectGroup> listGroupOneLevel = tree
        .convertTreeToListOneLevel()
        .where((g) => g.id != 0)
        .toList();

    showDialogAddEditGroupObject(
      c,
      listGroupAvailable: listGroupOneLevel,
      parentGroup: parentGroup,
      addEditType: AddEditGroupObjectType.add,
      onConfirm:
          ({
            String? nameNewGroup,
            SubjectGroup? parentGroup,
            SubjectGroup? currentGroup,
          }) async {
            final bloc = c.read<ObjectGroupBloc>();
            if (nameNewGroup != null) {
              final completer = Completer<void>();
              bloc.add(
                CreateSubjectGroup(
                  name: nameNewGroup,
                  parentId: parentGroup?.id ?? 0,
                  completer: completer,
                ),
              );
              await completer.future;
            }
          },
    );
  }

  // edit group
  void _onShowDialogEditGroupObject({
    required BuildContext c,
    required TreeNode<SubjectGroup> tree,
    SubjectGroup? parentGroup,
    SubjectGroup? currentGroup,
  }) {
    List<SubjectGroup> listGroupOneLevel = tree
        .convertTreeToListOneLevel()
        .where((g) => g.id != 0)
        .toList();

    showDialogAddEditGroupObject(
      c,
      listGroupAvailable: listGroupOneLevel,
      parentGroup: parentGroup,
      addEditType: AddEditGroupObjectType.edit,
      currentGroup: currentGroup,
      onConfirm:
          ({
            String? nameNewGroup,
            SubjectGroup? parentGroup,
            SubjectGroup? currentGroup,
          }) async {
            final bloc = c.read<ObjectGroupBloc>();
            if (nameNewGroup != null) {
              final completer = Completer<void>();
              bloc.add(
                UpdateSubjectGroup(
                  id: currentGroup?.id ?? 0,
                  subjectGroup: SubjectGroup(
                    name: nameNewGroup,
                    parentId:
                        parentGroup?.id ?? 0, // ko có group cha -> truyền 0
                  ),
                  completer: completer,
                ),
              );
              await completer.future;
            }
          },
    );
  }

  void _onShowDialogRemoveGroupObject({
    required BuildContext c,
    SubjectGroup? currentGroup,
    bool hasChildren = false,
  }) {
    if (currentGroup == null) return;
    showDialog(
      context: c,
      builder: (BuildContext context) {
        return RemoveGroupObjectDialog(
          hasChildren: hasChildren,
          groupName: currentGroup.name,
          onConfirm: () {
            final bloc = c.read<ObjectGroupBloc>();
            bloc.add(DeleteSubjectGroup(id: currentGroup.id ?? 0));
          },
        );
      },
    );
  }

  Future<void> _onShowDialogAddObject(
    BuildContext context, {
    SubjectGroup? initialGroup,
  }) async {
    final state = context.read<ObjectGroupBloc>().state;
    final selectedType = state.selectedObjectType;
    if (selectedType == null) return;

    final repo = context.read<IObjectGroupRepository>();

    try {
      final objectTypeDetail = await repo.getObjectTypeDetail(selectedType.id);
      if (!context.mounted) return;
      final result = await showDialog<bool>(
        context: context,
        builder: (_) => AddObjectDialog(
          objectType: objectTypeDetail,
          subjectGroups: context.read<ObjectGroupBloc>().state.subjectGroups,
          initialSubjectGroup:
              initialGroup ??
              (state.selectedSubjectGroup?.id == 0
                  ? null // ID=0 is 'Danh sách đối tượng', shouldn't be pre-selected
                  : state.selectedSubjectGroup),
        ),
      );
      if (result == true && context.mounted) {
        context.read<ObjectGroupBloc>().add(
          LoadObjects(
            objectTypeId: selectedType.id,
            subjectGroupId: state.selectedSubjectGroup?.id ?? 0,
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ToastUtil.toastFail(context: context, title: Text('Lỗi: $e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 270,
            color: Colors.white,
            child: Column(
              children: [
                BlocListener<ObjectGroupBloc, ObjectGroupState>(
                  listenWhen: (previous, current) =>
                      previous.searchQuery != current.searchQuery,
                  listener: (context, state) {
                    if (_groupSearchController.text != state.searchQuery) {
                      _groupSearchController.text = state.searchQuery;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: TextField(
                      controller: _groupSearchController,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppAssets.icSearch),
                        ),
                        hintText: 'Nhập tên nhóm',
                        hintStyle: AppTypography.style(
                          14,
                          color: AppColors.grey64748B,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: AppColors.greyE2E8F0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: AppColors.greyE2E8F0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                      onChanged: (value) {
                        context.read<ObjectGroupBloc>().add(
                          SearchSubjectGroup(query: value),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
                    buildWhen: (previous, current) =>
                        previous.treeKey != current.treeKey ||
                        previous.filteredSubjectGroupTree !=
                            current.filteredSubjectGroupTree ||
                        previous.isTreeLoading != current.isTreeLoading,
                    builder: (context, state) {
                      if (state.isTreeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Tree to display (filtered by bloc via SearchSubjectGroupUsecase)
                      final displayTree =
                          state.filteredSubjectGroupTree ??
                          state.subjectGroupTree ??
                          TreeNode<SubjectGroup>.root();

                      // Full tree used by add/edit dialogs (always shows all groups)
                      final fullTree =
                          state.subjectGroupTree ??
                          TreeNode<SubjectGroup>.root();

                      return GroupObjectTreeWidget(
                        treeKey: state.treeKey,
                        tree: displayTree,
                        selectedObjectId: (state.selectedSubjectGroup?.id ?? 0)
                            .toString(),
                        onClickObjectNode: (subjectGroup) {
                          context.read<ObjectGroupBloc>().add(
                            SelectSubjectGroup(subjectGroup),
                          );
                        },
                        actionBuilder: (node) {
                          if (node.data?.id == 0) {
                            return const SizedBox.shrink();
                          }
                          return Theme(
                            data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              iconTheme: const IconThemeData(size: 20),
                            ),
                            child: PopupMenuButton<GroupObjectAction>(
                              tooltip: '',
                              key: ValueKey(node.data?.id),
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              menuPadding: EdgeInsets.zero,
                              position: PopupMenuPosition.under,
                              offset: const Offset(0, 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 3,
                              shadowColor: const Color(0x1A000000),
                              surfaceTintColor: Colors.transparent,
                              color: Colors.white,
                              onSelected: (action) {
                                context.read<ObjectGroupBloc>().add(
                                  SelectSubjectGroup(node.data),
                                );

                                switch (action) {
                                  case GroupObjectAction.add:
                                    _onShowDialogAddGroupObject(
                                      c: context,
                                      tree: fullTree,
                                      parentGroup: node.data,
                                    );
                                    break;
                                  case GroupObjectAction.addObject:
                                    _onShowDialogAddObject(
                                      context,
                                      initialGroup: node.data,
                                    );
                                    break;
                                  case GroupObjectAction.edit:
                                    final parentNode = node.parent;
                                    final parentGroup =
                                        parentNode is TreeNode<SubjectGroup>
                                        ? parentNode.data
                                        : null;
                                    _onShowDialogEditGroupObject(
                                      c: context,
                                      tree: fullTree,
                                      parentGroup: parentGroup,
                                      currentGroup: node.data,
                                    );
                                    break;
                                  case GroupObjectAction.delete:
                                    if (node.data != null) {
                                      context.read<ObjectGroupBloc>().add(
                                        CheckSubjectGroupForDelete(
                                          subjectGroup: node.data!,
                                        ),
                                      );
                                    }
                                    break;
                                }
                              },
                              itemBuilder: (context) {
                                List<GroupObjectAction> listAction = List.of(
                                  GroupObjectAction.values,
                                );
                                // cấp 5 => không cho thêm nhóm con nữa
                                if (node.level >=
                                    AppConfig.OBJECT_GROUP_MAX_LEVEL) {
                                  listAction.remove(GroupObjectAction.add);
                                }
                                final List<PopupMenuEntry<GroupObjectAction>>
                                entries = [];
                                for (int i = 0; i < listAction.length; i++) {
                                  final action = listAction[i];
                                  entries.add(
                                    PopupMenuItem<GroupObjectAction>(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      value: action,
                                      child: action.widgetView,
                                    ),
                                  );
                                  if (i != listAction.length - 1) {
                                    entries.add(
                                      const PopupMenuDivider(
                                        height: 1,
                                        color: AppColors.greyF2F4FA,
                                      ),
                                    );
                                  }
                                }
                                return entries;
                              },
                              child: const Icon(
                                Icons.more_horiz,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        },
                        onClickAddGroup: () {
                          _onShowDialogAddGroupObject(
                            c: context,
                            tree: fullTree,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Main Content Area
          Expanded(
            child: BlocConsumer<ObjectGroupBloc, ObjectGroupState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                switch (state.status) {
                  case ObjectGroupStatus.createGroupSuccess:
                    ToastUtil.toastSuccess(
                      context: context,
                      title: const Text('Thêm mới nhóm đối tượng thành công'),
                    );
                    break;
                  case ObjectGroupStatus.updateGroupSuccess:
                    ToastUtil.toastSuccess(
                      context: context,
                      title: const Text('Sửa nhóm đối tượng thành công'),
                    );
                    break;
                  case ObjectGroupStatus.deleteGroupSuccess:
                    ToastUtil.toastSuccess(
                      context: context,
                      title: const Text('Xóa nhóm đối tượng thành công!'),
                    );
                    break;
                  case ObjectGroupStatus.checkGroupForDeleteSuccess:
                    // check trước khi xóa nhóm
                    if (state.checkSubjectGroupModel != null &&
                        state.selectedSubjectGroup != null) {
                      final data = state.checkSubjectGroupModel;
                      final currentGroup = state.selectedSubjectGroup;
                      bool apiHasChildren = data?.hasChildren ?? false;
                      bool apiHasVmsObjects = data?.hasVmsObjects ?? false;

                      _onShowDialogRemoveGroupObject(
                        c: context,
                        currentGroup: currentGroup,
                        hasChildren: apiHasChildren || apiHasVmsObjects,
                      );
                    }
                    break;
                  case ObjectGroupStatus.error:
                  case ObjectGroupStatus.createGroupFailure:
                  case ObjectGroupStatus.updateGroupFailure:
                  case ObjectGroupStatus.deleteGroupFailure:
                    ToastUtil.toastFail(
                      context: context,
                      title: Text(state.errorMessage ?? 'Đã xảy ra lỗi'),
                    );
                    break;
                  default:
                    break;
                }
              },
              buildWhen: (previous, current) =>
                  previous.status != current.status ||
                  previous.objectTypes != current.objectTypes ||
                  previous.selectedObjectType != current.selectedObjectType ||
                  previous.subjectGroups != current.subjectGroups,
              builder: (context, state) {
                if (state.status == ObjectGroupStatus.loading &&
                    state.objectTypes.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == ObjectGroupStatus.error) {
                  return Center(
                    child: Text(
                      'Đã xảy ra lỗi: ${state.errorMessage}',
                      style: AppTypography.style(14, color: Colors.red),
                    ),
                  );
                }

                if (state.objectTypes.isEmpty) {
                  return Center(
                    child: Text(
                      'Không có dữ liệu',
                      style: AppTypography.style(14),
                    ),
                  );
                }

                // Ensure TabController is initialized/recreated when objectTypes change
                if (_tabController == null ||
                    _tabController!.length != state.objectTypes.length) {
                  _tabController?.dispose();
                  _tabController = TabController(
                    length: state.objectTypes.length,
                    vsync: this,
                  );

                  _tabController!.addListener(() {
                    if (!_tabController!.indexIsChanging) {
                      final selectedType =
                          state.objectTypes[_tabController!.index];
                      context.read<ObjectGroupBloc>().add(
                        SelectObjectType(selectedType),
                      );
                    }
                  });
                }

                // Sync selected tab index
                if (state.selectedObjectType != null) {
                  final selectedIndex = state.objectTypes.indexOf(
                    state.selectedObjectType!,
                  );
                  if (selectedIndex >= 0 &&
                      _tabController!.index != selectedIndex) {
                    _tabController!.index = selectedIndex;
                  }
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tabs Header – no left padding
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        indicatorColor: AppColors.primary,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.grey64748B,
                        labelStyle: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                        ),
                        tabAlignment: TabAlignment.start,
                        padding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        tabs: state.objectTypes
                            .map((type) => Tab(text: type.name))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Search and Action Bar
                    _buildActionBar(),
                    const SizedBox(height: 8),

                    // Data Table Area
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: const EdgeInsets.only(bottom: 10, right: 10),
                        child: const ObjectListTable(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBar() {
    final state = context.read<ObjectGroupBloc>().state;
    final hasSubjectGroups = state.subjectGroups.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Search field + Search button
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.greyF2F4FA,
            ),
            child: Row(
              children: [
                Expanded(child: _buildSearchField()),
                const SizedBox(width: 20),
                EventCustomButton(
                  backgroundColor: AppColors.blue005AA9,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Tìm kiếm',
                  onPressed: _onSearch,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                    vertical: 10,
                  ),
                  prefix: SvgPicture.asset(
                    AppAssets.icSearch,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                    height: 16,
                    width: 16,
                  ),
                  prefixGap: 8,
                  textStyle: AppTypography.style(
                    14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Row 2: Left (Tải file mẫu, Import dữ liệu, Xuất file) — Right (Thêm đối tượng)
          Row(
            children: [
              EventCustomButton(
                borderColor: AppColors.secondary,
                borderRadius: 3,
                label: 'Tải file mẫu',
                onPressed: () => _onDownloadTemplate(context),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                prefix: SvgPicture.asset(
                  AppAssets.icFile,
                  height: 16,
                  width: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                prefixGap: 8,
                textStyle: AppTypography.style(
                  14,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              EventCustomButton(
                borderColor: AppColors.secondary,
                borderRadius: 3,
                label: 'Import dữ liệu',
                onPressed: () => _onImportData(context),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                prefix: SvgPicture.asset(
                  AppAssets.icUpload2,
                  height: 16,
                  width: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                prefixGap: 8,
                textStyle: AppTypography.style(
                  14,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              EventCustomButton(
                borderColor: AppColors.secondary,
                borderRadius: 3,
                label: 'Xuất file',
                onPressed: () => _onExportData(context),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                prefix: SvgPicture.asset(
                  AppAssets.icDownloadFile,
                  height: 16,
                  width: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                prefixGap: 8,
                textStyle: AppTypography.style(
                  14,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (hasSubjectGroups)
                EventCustomButton(
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Thêm đối tượng',
                  onPressed: () => _onShowDialogAddObject(context),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  prefix: const Icon(
                    Icons.add,
                    color: AppColors.blue005AA9,
                    size: 16,
                  ),
                  prefixGap: 8,
                  textStyle: AppTypography.style(
                    14,
                    color: AppColors.blue005AA9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: SvgPicture.asset(AppAssets.icSearch),
              ),
              fillColor: AppColors.white,
              filled: true,
              hintText: 'Nhập từ khoá tìm kiếm',
              hintStyle: AppTypography.style(14, color: AppColors.grey64748B),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.greyE2E8F0,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.greyE2E8F0,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
