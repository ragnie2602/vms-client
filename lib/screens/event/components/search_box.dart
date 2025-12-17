import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return !isSearching
        ? EventCustomButton(
            backgroundColor: AppColors.white,
            borderColor: AppColors.blue005AA9,
            borderRadius: 3,
            label: 'Tìm kiếm',
            onPressed: () => setState(() => isSearching = true),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            textStyle: AppTypography.style(
              14,
              color: AppColors.blue005AA9,
              fontWeight: FontWeight.w500,
            ),
          )
        : Flexible(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                ),
                constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                ),
                hintText: 'Tìm kiếm',
                hintStyle: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey64748B,
                ),
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () => setState(() => isSearching = false),
                  icon: Icon(Icons.close, size: 16),
                ),
                suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
              ),
            ),
          );
  }
}
