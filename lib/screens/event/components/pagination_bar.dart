import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class PaginationBar extends StatefulWidget {
  final int totalEvents;

  const PaginationBar({super.key, required this.totalEvents});

  @override
  State<PaginationBar> createState() => _PaginationBarState();
}

class _PaginationBarState extends State<PaginationBar> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Text(
            'Hiển thị ${_currentItemCount()} trong số ${widget.totalEvents} sự kiện',
            style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.greyF2F4F6,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildArrowButton(Icons.chevron_left, -1),
                const SizedBox(width: 12),
                _buildPageButton('1', 1),
                const SizedBox(width: 8),
                _buildPageButton('2', 2),
                const SizedBox(width: 8),
                _buildPageButton('3', 3),
                const SizedBox(width: 8),
                _buildPageButton('...', 0),
                const SizedBox(width: 8),
                _buildPageButton('${widget.totalEvents ~/ 20 + 1}', widget.totalEvents ~/ 20 + 1),
                const SizedBox(width: 12),
                _buildArrowButton(Icons.chevron_right, 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton(String label, int page) {
    return InkWell(
      onTap: () => setState(() => currentPage = page),
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
          label,
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
    return InkWell(
      onTap: () => setState(() => currentPage += change),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.greyE2E8F0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon, size: 24, color: AppColors.grey94A3B8),
      ),
    );
  }

  int _currentItemCount() {
    if (currentPage * 20 < widget.totalEvents) {
      return 20;
    } else {
      return widget.totalEvents - (currentPage - 1) * 20;
    }
  }
}
