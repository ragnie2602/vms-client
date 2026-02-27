import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ObjectGroupSidebar extends StatelessWidget {
  const ObjectGroupSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Box
          TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppAssets.icSearch),
              ),
              hintText: 'Nhập tên nhóm',
              hintStyle: AppTypography.style(14, color: AppColors.grey64748B),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.greyE2E8F0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tạo nhóm quản lý đối tượng',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyE2E8F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.icAdd,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTreeItem(
                    'Tất cả',
                    isRoot: true,
                    icon: Icons.folder,
                    isExpanded: true,
                  ),
                  _buildTreeItem(
                    'Trường Tiểu học Lê Văn Tám',
                    isRoot: true,
                    icon: Icons.folder,
                    isExpanded: true,
                  ),
                  _buildTreeItem(
                    'Khối lớp 1',
                    icon: Icons.remove,
                    isExpanded: true,
                    level: 1,
                  ),
                  _buildTreeItem(
                    'Lớp 1A1',
                    icon: null,
                    isExpanded: false,
                    level: 2,
                    isSelected: true,
                    showMenu: true,
                  ),
                  _buildTreeItem(
                    'Lớp 1A2',
                    icon: null,
                    isExpanded: false,
                    level: 2,
                  ),
                  _buildTreeItem(
                    'Lớp 1A3',
                    icon: null,
                    isExpanded: false,
                    level: 2,
                  ),
                  _buildTreeItem(
                    'Lớp 1A4',
                    icon: null,
                    isExpanded: false,
                    level: 2,
                  ),
                  _buildTreeItem(
                    'Lớp 1A5',
                    icon: null,
                    isExpanded: false,
                    level: 2,
                  ),
                  _buildTreeItem(
                    'Khối lớp 2',
                    icon: Icons.remove,
                    isExpanded: false,
                    level: 1,
                  ),
                  _buildTreeItem(
                    'Khối lớp 3',
                    icon: Icons.remove,
                    isExpanded: false,
                    level: 1,
                  ),
                  _buildTreeItem(
                    'Khối lớp 4',
                    icon: Icons.remove,
                    isExpanded: false,
                    level: 1,
                  ),
                  _buildTreeItem(
                    'Khối lớp 5',
                    icon: Icons.remove,
                    isExpanded: false,
                    level: 1,
                  ),
                  _buildTreeItem(
                    'Cán bộ giáo viên',
                    isRoot: true,
                    icon: Icons.folder_open,
                    isExpanded: false,
                  ),
                  _buildTreeItem(
                    'Bảo vệ',
                    isRoot: true,
                    icon: Icons.folder_open,
                    isExpanded: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreeItem(
    String title, {
    bool isRoot = false,
    IconData? icon,
    bool isExpanded = false,
    int level = 0,
    bool isSelected = false,
    bool showMenu = false,
  }) {
    return Container(
      color: isSelected ? AppColors.greyF1F5F9 : Colors.transparent,
      padding: EdgeInsets.only(left: level * 16.0, top: 8, bottom: 8),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, size: 16, color: AppColors.grey64748B)
          else
            const SizedBox(width: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: AppTypography.style(
                14,
                color: AppColors.grey334155,
                fontWeight: isRoot ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
          if (showMenu)
            Icon(Icons.more_horiz, size: 16, color: AppColors.grey64748B),
        ],
      ),
    );
  }
}
