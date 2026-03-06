import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dropdown_widget.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/home/components/table_paginator.dart';
import 'package:vms_flutter_client/screens/object_type/bloc/object_type_bloc.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';
import 'package:vms_flutter_client/screens/object_type/widget/confirm_delete_dialog.dart';
import 'package:vms_flutter_client/screens/object_type/widget/object_type_dialog.dart';
import 'package:vms_flutter_client/screens/object_type/widget/object_type_item_widget.dart';
import 'package:vms_flutter_client/screens/object_type/widget/object_type_title_widget.dart';

class ObjectTypeScreen extends StatefulWidget {
  const ObjectTypeScreen({super.key});

  @override
  State<ObjectTypeScreen> createState() => _ObjectTypeScreenState();
}

class _ObjectTypeScreenState extends State<ObjectTypeScreen> {
  final TextEditingController _searchController = TextEditingController();
  ObjectTypeStatus? _selectedStatus;

  int _currentPage = 1;
  final int _pageSize = 20;
  int _totalPages = 1;
  String? _lastDeletedName;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<ObjectTypeBloc>().add(
      LoadObjectTypes(
        page: _currentPage,
        size: _pageSize,
        keyword: _searchController.text.isNotEmpty
            ? _searchController.text
            : null,
        status: _selectedStatus?.name.toUpperCase(),
      ),
    );
  }

  void _onSearch() {
    _currentPage = 1;
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ObjectTypeBloc, ObjectTypeState>(
        listener: (context, state) {
          if (state is ObjectTypeCreated) {
            ToastUtil.toastSuccess(
              context: context,
              message: 'Thêm mới loại đối tượng thành công',
            );
            _loadData();
          } else if (state is ObjectTypeCreateError) {
            ToastUtil.toastFail(
              context: context,
              message: 'Có lỗi xảy ra, vui lòng thử lại',
            );
          } else if (state is ObjectTypeUpdated) {
            ToastUtil.toastSuccess(
              context: context,
              message: 'Cập nhật loại đối tượng thành công',
            );
            _loadData();
          } else if (state is ObjectTypeUpdateError) {
            ToastUtil.toastFail(
              context: context,
              message: 'Có lỗi xảy ra, vui lòng thử lại',
            );
          } else if (state is ObjectTypeDeleted) {
            ToastUtil.toastSuccess(
              context: context,
              message: 'Xóa ${_lastDeletedName ?? 'loại đối tượng'} thành công!',
            );
            _loadData();
          } else if (state is ObjectTypeDeleteError) {
            ToastUtil.toastFail(
              context: context,
              message: 'Có lỗi xảy ra, vui lòng thử lại',
            );
          }
        },
        child: Column(
          children: [
            // Search & Filter Bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(flex: 3, child: _buildSearchField()),
                  const SizedBox(width: 16),
                  Expanded(flex: 2, child: _buildStatusDropdown()),
                  const SizedBox(width: 16),
                  EventCustomButton(
                    backgroundColor: AppColors.blue005AA9,
                    borderColor: AppColors.blue005AA9,
                    borderRadius: 3,
                    label: 'Tìm kiếm',
                    onPressed: _onSearch,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 12,
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
                  const SizedBox(width: 12),
                  EventCustomButton(
                    borderColor: AppColors.secondary,
                    borderRadius: 3,
                    label: 'Thêm loại đối tượng',
                    onPressed: () => _showAddDialog(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    prefix: SvgPicture.asset(
                      AppAssets.icAdd,
                      height: 16,
                      width: 16,
                    ),
                    prefixGap: 8,
                    textStyle: AppTypography.style(
                      14,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Data Table
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    const ObjectTypeTitleWidget(),
                    const SizedBox(height: 16),
                    Expanded(child: _buildContent()),
                    // Pagination
                    if (_totalPages > 1)
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 48,
                          child: TablePaginator(
                            _totalPages,
                            _currentPage - 1, // TablePaginator is 0-indexed
                            (pageIndex) {
                              setState(() => _currentPage = pageIndex + 1);
                              _loadData();
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<ObjectTypeBloc, ObjectTypeState>(
      buildWhen: (previous, current) =>
          current is ObjectTypeLoading ||
          current is ObjectTypeLoaded ||
          current is ObjectTypeError,
      builder: (context, state) {
        if (state is ObjectTypeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ObjectTypeError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Có lỗi xảy ra',
                  style: AppTypography.style(14, color: Colors.red),
                ),
                const SizedBox(height: 8),
                Text(
                  state.message,
                  style: AppTypography.style(12, color: AppColors.grey64748B),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadData,
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }
        if (state is ObjectTypeLoaded) {
          // Update totalPages for pagination widget
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _totalPages != state.totalPages) {
              setState(() => _totalPages = state.totalPages);
            }
          });
          if (state.objectTypes.isEmpty) {
            return Center(
              child: Text('Không có dữ liệu', style: AppTypography.style(14)),
            );
          }
          return ListView.separated(
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: AppColors.greyF1F5F9),
            itemCount: state.objectTypes.length,
            itemBuilder: (context, index) => ObjectTypeItemWidget(
              item: state.objectTypes[index],
              index: index + 1 + (_currentPage - 1) * _pageSize,
              onEdit: () => _showEditDialog(state.objectTypes[index]),
              onDelete: () => _onDelete(state.objectTypes[index]),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tìm kiếm',
          style: AppTypography.style(
            14,
            color: AppColors.grey334155,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            onSubmitted: (_) => _onSearch(),
            decoration: InputDecoration(
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: SvgPicture.asset(AppAssets.icSearch),
              ),
              hintText: 'Nhập tên loại đối tượng hoặc mô tả',
              hintStyle: AppTypography.style(
                14,
                color: AppColors.grey64748B,
                fontWeight: FontWeight.w400,
              ),
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
                  color: AppColors.greyE2E8F0,
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

  Widget _buildStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trạng thái',
          style: AppTypography.style(
            14,
            color: AppColors.grey334155,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomCommonDropdown<ObjectTypeStatus?>(
          items: [null, ...ObjectTypeStatus.values],
          value: _selectedStatus,
          itemAsString: (item) => item?.displayName ?? 'Tất cả',
          hint: Text(
            'Tất cả',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
          padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
        ),
      ],
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => ObjectTypeDialog(
        onSubmit: (objectType) {
          Navigator.pop(dialogContext);
          context.read<ObjectTypeBloc>().add(
            CreateObjectType(objectType: objectType),
          );
        },
      ),
    );
  }

  void _showEditDialog(ObjectType objectType) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => ObjectTypeDialog(
        objectType: objectType,
        onSubmit: (updated) {
          Navigator.pop(dialogContext);
          context.read<ObjectTypeBloc>().add(
            UpdateObjectType(id: objectType.id, objectType: updated),
          );
        },
      ),
    );
  }

  void _onDelete(ObjectType objectType) {
    // SRS: If object type has data objects, block deletion with toast
    if (objectType.objectCount > 0) {
      ToastUtil.toastFail(
        context: context,
        message:
            'Loại đối tượng đang có dữ liệu đối tượng đi kèm, không thể xóa',
      );
      return;
    }

    // SRS: No data → show confirmation popup
    showDialog(
      context: context,
      builder: (_) => ConfirmDeleteDialog(
        title: 'Xóa loại đối tượng',
        content: 'Bạn có chắc chắn muốn xóa ${objectType.name}?',
        onConfirm: () {
          _lastDeletedName = objectType.name;
          context.read<ObjectTypeBloc>().add(
            DeleteObjectType(id: objectType.id),
          );
        },
      ),
    );
  }
}
