import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class PaginationBar extends StatelessWidget {
  final int totalEvents;
  final int currentPage;
  final int pageSize;
  final Function(int) onPageChanged;

  const PaginationBar({
    super.key,
    required this.totalEvents,
    required this.currentPage,
    this.pageSize = 20,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Text(
            'Hiển thị ${_currentItemCount()} trong số $totalEvents sự kiện',
            style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                _buildArrowButton(Icons.chevron_left, -1),
                ..._getPageButtons().map((e) => _buildPageButton(e)).toList(),
                _buildArrowButton(Icons.chevron_right, 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton(int page) {
    return InkWell(
      onTap: page != 0 ? () => onPageChanged(page) : null,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: currentPage == page ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.greyD1D5DB),
        ),
        child: Text(
          page == 0 ? '...' : page.toString(),
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w500,
            color: currentPage == page ? AppColors.white : AppColors.grey94A3B8,
          ),
        ),
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, int change) {
    final newPage = currentPage + change;
    final bool isDisabled = newPage < 1 || newPage > totalPage;

    return InkWell(
      onTap: isDisabled ? null : () => onPageChanged(newPage),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.greyE2E8F0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          icon,
          size: 24,
          color: isDisabled ? AppColors.greyE2E8F0 : AppColors.grey94A3B8,
        ),
      ),
    );
  }

  int _currentItemCount() {
    if (currentPage * pageSize < totalEvents) {
      return pageSize;
    } else {
      return totalEvents - (currentPage - 1) * pageSize;
    }
  }

  List<int> _getPageButtons() {
    if (totalPage <= 0) return [];
    List<int> _res = List.generate(totalPage + 1, (i) => i);
    if (totalPage - currentPage > 2) _res.replaceRange(currentPage + 2, totalPage, [0]);
    if (currentPage > 3) _res.replaceRange(2, currentPage - 1, [0]);

    return _res..removeAt(0);
  }

  int get totalPage => (totalEvents / pageSize).ceil();
}
