import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/event/components/event_filter_dropdown.dart';
import 'package:vms_flutter_client/screens/object_type/object_type_model.dart';
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

  // TODO: Replace with API data from bloc/repository
  List<ObjectType> _objectTypes = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Load mock data - TODO: Replace with API call
  void _loadData() {
    setState(() {
      _objectTypes = ObjectTypeMockData.getAll();
    });
  }

  /// Search data - TODO: Replace with API call
  void _onSearch() {
    setState(() {
      _objectTypes = ObjectTypeMockData.search(_searchController.text, _selectedStatus);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search & Filter Bar
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Search field
                Expanded(flex: 3, child: _buildSearchField()),
                const SizedBox(width: 16),
                // Status filter
                Expanded(flex: 2, child: _buildStatusDropdown()),
                const SizedBox(width: 16),
                // Search button
                EventCustomButton(
                  backgroundColor: AppColors.blue005AA9,
                  borderColor: AppColors.blue005AA9,
                  borderRadius: 3,
                  label: 'Tìm kiếm',
                  onPressed: _onSearch,
                  padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
                  prefix: SvgPicture.asset(
                    AppAssets.icSearch,
                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
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
                // Add button
                EventCustomButton(
                  borderColor: AppColors.secondary,
                  borderRadius: 3,
                  label: 'Thêm loại đối tượng',
                  onPressed: () => _showAddDialog(),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  prefix: SvgPicture.asset(AppAssets.icAdd, height: 16, width: 16),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  const ObjectTypeTitleWidget(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _objectTypes.isEmpty
                        ? Center(child: Text('Không có dữ liệu', style: AppTypography.style(14)))
                        : ListView.separated(
                            separatorBuilder: (_, __) =>
                                const Divider(height: 1, color: AppColors.greyF1F5F9),
                            itemCount: _objectTypes.length,
                            itemBuilder: (context, index) => ObjectTypeItemWidget(
                              item: _objectTypes[index],
                              index: index + 1,
                              onEdit: () => _showEditDialog(_objectTypes[index]),
                              onDelete: () => _onDelete(_objectTypes[index]),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tìm kiếm',
          style: AppTypography.style(14, color: AppColors.grey334155, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: SvgPicture.asset(AppAssets.icSearch),
              ),
              hintText: 'Nhập từ khóa tìm kiếm',
              hintStyle: AppTypography.style(
                14,
                color: AppColors.grey64748B,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0, width: 1),
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
          style: AppTypography.style(14, color: AppColors.grey334155, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        EventFilterDropdown<ObjectTypeStatus?>(
          isDense: true,
          itemBuilder: (item) => Text(
            item?.displayName ?? 'Tất cả',
            style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
          ),
          items: [null, ...ObjectTypeStatus.values],
          label: '',
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
          padding: const EdgeInsets.only(bottom: 12, left: 0, right: 12, top: 12),
        ),
      ],
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ObjectTypeDialog(
        onSubmit: (objectType) {
          // TODO: Call API to add object type
          setState(() {
            _objectTypes = [..._objectTypes, objectType];
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showEditDialog(ObjectType objectType) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ObjectTypeDialog(
        objectType: objectType,
        onSubmit: (updated) {
          // TODO: Call API to update object type
          setState(() {
            final index = _objectTypes.indexWhere((e) => e.id == updated.id);
            if (index != -1) {
              _objectTypes[index] = updated;
              _objectTypes = [..._objectTypes];
            }
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _onDelete(ObjectType objectType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc chắn muốn xóa loại đối tượng "${objectType.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              // TODO: Call API to delete
              setState(() {
                _objectTypes = _objectTypes.where((e) => e.id != objectType.id).toList();
              });
              Navigator.pop(context);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
