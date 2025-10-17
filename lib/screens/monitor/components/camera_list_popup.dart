import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class CameraListPopup extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  CameraListPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.widthOf(context) * 281 / 1600,
        maxHeight: MediaQuery.heightOf(context) * 515 / 900,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: AppColors.grey92929D.withValues(alpha: 0.1),
            offset: Offset(0, 10),
          ),
        ],
        color: AppColors.blackOrWhiteReverse,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, size: 20),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Tìm kiếm',
                hintStyle: AppTypography.style(
                  14,
                  color: Color(0xFF8F95B2),
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(3),
                ),
                prefixIcon: Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 16, left: 12),
                  child: SvgPicture.asset(AppAssets.icSearch),
                ),
                prefixIconConstraints: BoxConstraints.tight(Size(20 + 16 + 12, 20)),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: searchController,
                  builder: (context, value, child) => value.text.isEmpty
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () => searchController.clear(),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(AppAssets.icClose),
                          ),
                        ),
                ),
                fillColor: Color(0xFFF2F4FA),
                filled: true,
              ),
              keyboardType: TextInputType.text,
              style: AppTypography.style(14, fontWeight: FontWeight.w400),
              textInputAction: TextInputAction.search,
            ),
          ),
          Text('Camera List'),
        ],
      ),
    );
  }
}
