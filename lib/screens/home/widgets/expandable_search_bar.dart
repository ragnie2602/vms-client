import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ExpandableSearchBar extends StatefulWidget {
  const ExpandableSearchBar({super.key});

  @override
  State<ExpandableSearchBar> createState() => _ExpandableSearchBarState();
}

class _ExpandableSearchBarState extends State<ExpandableSearchBar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final child = InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: SvgPicture.asset(AppAssets.icSearch, width: 20, height: 20),
    );

    return AnimatedContainer(
      duration: Durations.medium1,
      width: _isExpanded ? 355 : 20,
      height: _isExpanded ? 44 : 20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          !_isExpanded
              ? child
              : Expanded(
                  child: TextField(
                    style: AppTypography.style(14, fontWeight: FontWeight.w400),
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
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
                        child: child,
                      ),
                      prefixIconConstraints: BoxConstraints.tight(Size(20 + 16 + 12, 20)),
                      fillColor: Color(0xFFF2F4FA),
                      filled: true,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
