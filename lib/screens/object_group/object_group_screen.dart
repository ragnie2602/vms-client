import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/add_object_dialog.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/add_subject_group_dialog.dart';
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
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    context.read<ObjectGroupBloc>().add(
      const LoadObjectGroups(page: 1, size: 20),
    );
    context.read<ObjectGroupBloc>().add(const LoadSubjectGroups());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  void _onSearch() {
    final state = context.read<ObjectGroupBloc>().state;
    final selectedType = state.selectedObjectType;
    if (selectedType == null) return;

    final searchText = _searchController.text.trim();
    context.read<ObjectGroupBloc>().add(
      LoadObjects(
        objectTypeId: selectedType.id,
        search: searchText.isNotEmpty ? searchText : null,
      ),
    );
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
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
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
                    buildWhen: (previous, current) =>
                        previous.subjectGroupTree != current.subjectGroupTree,
                    builder: (context, state) {
                      final tree =
                          state.subjectGroupTree ??
                          TreeNode<SubjectGroup>.root();
                      return GroupObjectTreeWidget(
                        tree: tree,
                        actionBuilder: (node) {
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
                              key: ValueKey(node.key),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              splashRadius: 20,
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
                                switch (action) {
                                  case GroupObjectAction.add:
                                    final bloc = context
                                        .read<ObjectGroupBloc>();
                                    showDialog(
                                      context: context,
                                      builder: (_) => BlocProvider.value(
                                        value: bloc,
                                        child: AddSubjectGroupDialog(
                                          parentGroupName: node.data?.name,
                                          parentGroupId: node.data?.id,
                                        ),
                                      ),
                                    );
                                    break;
                                  case GroupObjectAction.addObject:
                                    // Handled by existing logic
                                    break;
                                  case GroupObjectAction.edit:
                                    // TODO: edit
                                    break;
                                  case GroupObjectAction.delete:
                                    // TODO: delete
                                    break;
                                }
                              },
                              itemBuilder: (context) {
                                List<GroupObjectAction> listAction = List.of(
                                  GroupObjectAction.values,
                                );

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
                                      const PopupMenuDivider(height: 1),
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
                          final bloc = context.read<ObjectGroupBloc>();
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: bloc,
                              child: const AddSubjectGroupDialog(),
                            ),
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
            child: BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status ||
                  previous.objectTypes != current.objectTypes ||
                  previous.selectedObjectType != current.selectedObjectType,
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
              EventCustomButton(
                backgroundColor: AppColors.white,
                borderColor: AppColors.blue005AA9,
                borderRadius: 3,
                label: 'Thêm đối tượng',
                onPressed: () async {
                  final state = context.read<ObjectGroupBloc>().state;
                  final selectedType = state.selectedObjectType;
                  if (selectedType == null) return;

                  final messenger = ScaffoldMessenger.of(context);
                  final repo = context.read<IObjectGroupRepository>();

                  try {
                    final objectTypeDetail = await repo.getObjectTypeDetail(
                      selectedType.id,
                    );
                    if (!context.mounted) return;
                    showDialog(
                      context: context,
                      builder: (_) =>
                          AddObjectDialog(objectType: objectTypeDetail),
                    );
                  } catch (e) {
                    messenger.showSnackBar(SnackBar(content: Text('Lỗi: $e')));
                  }
                },
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
