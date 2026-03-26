import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/add_object_dialog.dart';
import 'package:vms_flutter_client/screens/object_type/widget/confirm_delete_dialog.dart';

class ObjectListTable extends StatefulWidget {
  const ObjectListTable({super.key});

  @override
  State<ObjectListTable> createState() => _ObjectListTableState();
}

class _ObjectListTableState extends State<ObjectListTable> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _mainVerticalController = ScrollController();
  final ScrollController _actionVerticalController = ScrollController();
  bool _isSyncingScroll = false;

  @override
  void initState() {
    super.initState();
    _mainVerticalController.addListener(() {
      if (_isSyncingScroll) return;
      if (_actionVerticalController.hasClients && _mainVerticalController.hasClients) {
        if (_actionVerticalController.offset != _mainVerticalController.offset) {
          _isSyncingScroll = true;
          _actionVerticalController.jumpTo(_mainVerticalController.offset);
          _isSyncingScroll = false;
        }
      }
    });
    _actionVerticalController.addListener(() {
      if (_isSyncingScroll) return;
      if (_actionVerticalController.hasClients && _mainVerticalController.hasClients) {
        if (_mainVerticalController.offset != _actionVerticalController.offset) {
          _isSyncingScroll = true;
          _mainVerticalController.jumpTo(_actionVerticalController.offset);
          _isSyncingScroll = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _mainVerticalController.dispose();
    _actionVerticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
      builder: (context, state) {
        if (state.status == ObjectGroupStatus.loading &&
            state.objects.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.objects.isEmpty) {
          return Center(
            child: Text(
              state.subjectGroups.isEmpty
                  ? 'Bạn chưa có nhóm nào. Vui lòng tạo nhóm để bắt đầu thêm đối tượng.'
                  : 'Danh sách trống',
            ),
          );
        }

        // Dynamically resolve column keys from the first object's fieldValues
        final fieldKeys = _getFieldKeys(state.objects);

        return Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final sttBaseWidth = 50.0;
                  final imgBaseWidth = 100.0; 
                  final actionWidth = 80.0;
                  final spacingWidth = 40.0; // 16(L padding) + 12(gap) + 12(R padding)
                  final fixedColsWidthLeft = sttBaseWidth + imgBaseWidth + spacingWidth;
                  
                  final fieldBaseWidth = 200.0; 
                  final minNeededLeftWidth = fixedColsWidthLeft + (fieldBaseWidth * fieldKeys.length);
                  
                  final leftTableConstraintsWidth = constraints.maxWidth - actionWidth;
                  final hasHorizontalScroll = minNeededLeftWidth > leftTableConstraintsWidth;
                  final leftTableWidth = hasHorizontalScroll 
                       ? minNeededLeftWidth 
                       : leftTableConstraintsWidth;
                       
                  final availableFieldsWidth = leftTableWidth - fixedColsWidthLeft;
                  final fieldWidth = fieldKeys.isEmpty 
                       ? 0.0 
                       : availableFieldsWidth / fieldKeys.length;

                  final sttWidth = sttBaseWidth;
                  final imgWidth = imgBaseWidth;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Scrollable Left part
                      Expanded(
                        child: Scrollbar(
                          controller: _horizontalScrollController,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: _horizontalScrollController,
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: leftTableWidth,
                              child: Column(
                                children: [
                                  // Header Left
                                  Container(
                                    height: 44, // Fixed height for header matching Right side
                                    color: AppColors.greyF8F9FE,
                                    padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 12),
                                    child: Row(
                                      children: [
                                        _buildHeaderCell('STT', width: sttWidth),
                                        _buildHeaderCell('Ảnh đại diện', width: imgWidth),
                                        const SizedBox(width: 12),
                                        ...fieldKeys.map(
                                          (key) => _buildHeaderCell(_formatHeader(key), width: fieldWidth),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Body Left
                                  Expanded(
                                    child: Scrollbar(
                                      controller: _mainVerticalController,
                                      thumbVisibility: true,
                                      child: ListView.separated(
                                        controller: _mainVerticalController,
                                        itemCount: state.objects.length,
                                        separatorBuilder: (context, index) =>
                                            const Divider(height: 1, color: AppColors.greyF1F3FA),
                                        itemBuilder: (context, index) {
                                          return _buildLeftRow(
                                            context,
                                            state,
                                            state.objects[index],
                                            index,
                                            fieldKeys,
                                            sttWidth,
                                            imgWidth,
                                            fieldWidth,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      // Fixed Right Action Part
                      Container(
                        width: actionWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: hasHorizontalScroll 
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: const Offset(-2, 0),
                                  )
                                ]
                              : null,
                        ),
                        child: Column(
                          children: [
                            // Header Right
                            Container(
                              height: 44,
                              color: AppColors.greyF8F9FE,
                              alignment: Alignment.center,
                              child: _buildHeaderCell('Thao tác', width: actionWidth, align: TextAlign.center),
                            ),
                            // Body Right
                            Expanded(
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                child: ListView.separated(
                                  controller: _actionVerticalController,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: state.objects.length,
                                  separatorBuilder: (context, index) =>
                                      const Divider(height: 1, color: AppColors.greyF1F3FA),
                                  itemBuilder: (context, index) {
                                    return _buildRightRow(
                                      context,
                                      state,
                                      state.objects[index],
                                      actionWidth,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Table Footer (Pagination)
            _buildPagination(context, state),
          ],
        );
      },
    );
  }

  /// Image field keys that should be displayed as images, not text
  static const _imageFieldKeys = [
    'Ảnh đại diện',
    'Ảnh nhận diện khuôn mặt',
    'Ảnh đại diện khuôn mặt',
  ];

  /// Get all field keys from the first object's fieldValues map.
  /// Filters out image array fields since they are shown in the image column.
  List<String> _getFieldKeys(List<ObjectData> objects) {
    if (objects.isEmpty) return [];
    final firstObj = objects.first;
    return firstObj.fieldValues.keys
        .where((key) => !_imageFieldKeys.contains(key))
        .take(6)
        .toList();
  }

  /// Get the first image URL from the object's fieldValues image array fields.
  String? _getImageUrl(ObjectData data) {
    for (final key in _imageFieldKeys) {
      final value = data.fieldValues[key];
      if (value is List && value.isNotEmpty) {
        return value.first.toString();
      }
      if (value is String && value.isNotEmpty) {
        return value;
      }
    }
    return null;
  }

  /// Format a camelCase or snake_case key into a more readable header.
  String _formatHeader(String key) {
    if (key.isEmpty) return key;
    return key[0].toUpperCase() + key.substring(1);
  }

  Widget _buildHeaderCell(
    String text, {
    required double width,
    TextAlign align = TextAlign.left,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: AppTypography.style(
          12,
          color: AppColors.grey64748B,
          fontWeight: FontWeight.w500,
        ),
        textAlign: align,
      ),
    );
  }

  Widget _buildLeftRow(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
    int index,
    List<String> fieldKeys,
    double sttWidth,
    double imgWidth,
    double fieldWidth,
  ) {
    return SizedBox(
      height: 66,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: sttWidth,
              child: Text(
                '${(state.currentObjectsPage > 0 ? (state.currentObjectsPage - 1) * 20 : 0) + index + 1}',
                style: AppTypography.style(14, color: AppColors.grey334155),
              ),
            ),
            SizedBox(
              width: imgWidth,
              child: Builder(
                builder: (context) {
                  final imageUrl = _getImageUrl(data);
                  if (imageUrl != null && imageUrl.isNotEmpty) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 50,
                            height: 50,
                            color: AppColors.greyE2E8F0,
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 50,
                            height: 50,
                            color: AppColors.greyE2E8F0,
                            child: const Icon(
                              Icons.broken_image,
                              size: 20,
                              color: AppColors.grey6F767E,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox(width: 50, height: 50);
                },
              ),
            ),
            SizedBox(width: 12),
            ...fieldKeys.map((key) {
              final value = data.fieldValues[key] ?? '';
              if (value is List && value.isNotEmpty) {
                final firstUrl = value.first.toString();
                return SizedBox(
                  width: fieldWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          imageUrl: firstUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 50,
                            height: 50,
                            color: AppColors.greyE2E8F0,
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 50,
                            height: 50,
                            color: AppColors.greyE2E8F0,
                            child: const Icon(
                              Icons.broken_image,
                              size: 20,
                              color: AppColors.grey6F767E,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return SizedBox(
                width: fieldWidth,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    value.toString(),
                    style: AppTypography.style(
                      14,
                      color: AppColors.grey334155,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRightRow(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
    double actionWidth,
  ) {
    return SizedBox(
      height: 66,
      child: Center(
        child: SizedBox(
          width: actionWidth,
          child: PopupMenuButton<String>(
            tooltip: '',
            icon: const Icon(
              Icons.more_horiz,
              color: AppColors.grey6F767E,
              size: 20,
            ),
            menuPadding: EdgeInsets.zero,
            splashRadius: 16,
            offset: const Offset(0, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white,
            onSelected: (value) {
              if (value == 'edit') {
                _onEditObject(context, state, data);
              } else if (value == 'delete') {
                _onDeleteObject(context, state, data);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(AppAssets.icEdit),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Sửa',
                      style: AppTypography.style(
                        13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuDivider(height: 1, color: AppColors.greyF2F4FA),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(AppAssets.icDelete),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Xóa',
                      style: AppTypography.style(
                        13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onEditObject(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
  ) async {
    if (state.selectedObjectType == null) return;

    final repo = context.read<IObjectGroupRepository>();
    final bloc = context.read<ObjectGroupBloc>();

    try {
      // Fetch full object type detail (with fields) like create dialog does
      final objectTypeDetail = await repo.getObjectTypeDetail(
        state.selectedObjectType!.id,
      );
      if (!context.mounted) return;

      final result = await showDialog<bool>(
        context: context,
        builder: (_) => AddObjectDialog(
          objectType: objectTypeDetail,
          existingObject: data,
          subjectGroups: bloc.state.subjectGroups,
        ),
      );

      if (result == true) {
        bloc.add(
          LoadObjects(
            objectTypeId: state.selectedObjectType!.id,
            subjectGroupId: state.selectedSubjectGroup?.id ?? 0,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ToastUtil.toastFail(context: context, title: Text('Lỗi: $e'));
      }
    }
  }

  void _onDeleteObject(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
  ) {
    final repo = context.read<IObjectGroupRepository>();
    final bloc = context.read<ObjectGroupBloc>();

    final objectName = data.fieldValues['Tên đối tượng'] ?? 'đối tượng';

    showDialog(
      context: context,
      builder: (_) => ConfirmDeleteDialog(
        title: 'Xóa đối tượng',
        content: 'Bạn có chắc chắn muốn xóa đối tượng $objectName?',
        onConfirm: () async {
          try {
            await repo.deleteObject(data.id);
            if (context.mounted) {
              ToastUtil.toastSuccess(
                context: context,
                title: const Text('Xóa đối tượng thành công'),
              );
              bloc.add(
                LoadObjects(
                  objectTypeId: state.selectedObjectType!.id,
                  subjectGroupId: state.selectedSubjectGroup?.id ?? 0,
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ToastUtil.toastFail(
                context: context,
                title: Text('Xóa đối tượng thất bại: $e'),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildPagination(BuildContext context, ObjectGroupState state) {
    final currentPage = state.currentObjectsPage;
    final totalPages = state.totalPages;
    final pageSize = 20;
    final fromIndex = (currentPage - 1) * pageSize + 1;
    final toIndex = ((currentPage - 1) * pageSize) + state.objects.length;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hiển thị từ $fromIndex đến $toIndex trong số ${state.totalObjects} mục',
            style: AppTypography.style(14, color: AppColors.grey64748B),
          ),
          if (totalPages > 1)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Previous button
                _buildPageButton(
                  context: context,
                  icon: Icons.chevron_left,
                  enabled: currentPage > 1,
                  onTap: () => _goToPage(context, state, currentPage - 1),
                ),
                const SizedBox(width: 4),
                // Page number buttons
                ..._buildPageNumbers(context, state, currentPage, totalPages),
                const SizedBox(width: 4),
                // Next button
                _buildPageButton(
                  context: context,
                  icon: Icons.chevron_right,
                  enabled: currentPage < totalPages,
                  onTap: () => _goToPage(context, state, currentPage + 1),
                ),
              ],
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageNumbers(
    BuildContext context,
    ObjectGroupState state,
    int currentPage,
    int totalPages,
  ) {
    final pages = <Widget>[];
    const maxVisible = 5;

    int start = currentPage - (maxVisible ~/ 2);
    if (start < 1) start = 1;
    int end = start + maxVisible - 1;
    if (end > totalPages) {
      end = totalPages;
      start = end - maxVisible + 1;
      if (start < 1) start = 1;
    }

    if (start > 1) {
      pages.add(_buildPageNumberButton(context, state, 1, currentPage));
      if (start > 2) {
        pages.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '...',
              style: AppTypography.style(14, color: AppColors.grey64748B),
            ),
          ),
        );
      }
    }

    for (int i = start; i <= end; i++) {
      pages.add(_buildPageNumberButton(context, state, i, currentPage));
    }

    if (end < totalPages) {
      if (end < totalPages - 1) {
        pages.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '...',
              style: AppTypography.style(14, color: AppColors.grey64748B),
            ),
          ),
        );
      }
      pages.add(
        _buildPageNumberButton(context, state, totalPages, currentPage),
      );
    }

    return pages;
  }

  Widget _buildPageNumberButton(
    BuildContext context,
    ObjectGroupState state,
    int page,
    int currentPage,
  ) {
    final isActive = page == currentPage;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: isActive ? null : () => _goToPage(context, state, page),
        child: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.blue005AA9 : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: isActive ? null : Border.all(color: AppColors.greyE2E8F0),
          ),
          child: Text(
            '$page',
            style: AppTypography.style(
              13,
              color: isActive ? Colors.white : AppColors.grey334155,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageButton({
    required BuildContext context,
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.greyE2E8F0),
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? AppColors.grey334155 : AppColors.greyE2E8F0,
        ),
      ),
    );
  }

  void _goToPage(BuildContext context, ObjectGroupState state, int page) {
    if (state.selectedObjectType == null) return;

    if (_mainVerticalController.hasClients) {
      _mainVerticalController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    if (_horizontalScrollController.hasClients) {
      _horizontalScrollController.jumpTo(0);
    }

    context.read<ObjectGroupBloc>().add(
      LoadObjects(
        objectTypeId: state.selectedObjectType!.id,
        page: page,
        subjectGroupId: state.selectedSubjectGroup?.id ?? 0,
        search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      ),
    );
  }
}
