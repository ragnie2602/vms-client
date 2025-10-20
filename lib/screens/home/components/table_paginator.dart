import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class TablePaginator extends StatefulWidget {
  final int _totalPages;
  final Function(int pageNumber) onChangePage;

  TablePaginator(this._totalPages, this.onChangePage, {super.key});

  @override
  State<TablePaginator> createState() => _TablePaginatorState();
}

class _TablePaginatorState extends State<TablePaginator> {
  final NumberPaginatorController _controller = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      controller: _controller,
      numberPages: widget._totalPages,
      onPageChange: (int index) {
        widget.onChangePage(index);
      },
       child: SizedBox(
    height: 64,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: _CustomButton(
              AppAssets.icArrowChevronLeft,
              onTap: () => _controller.prev(),
              text: '<',
              isSelected: false,
            ),
          ),
          Expanded(
            child: ScrollableNumberContent(
              buttonBuilder: (context, index, isSelected) => _CustomButton(
                null,
                onTap: () => _controller.navigateToPage(index),
                text: '${index + 1}',
                isSelected: isSelected,
              ),
            ),
          ),
          _CustomButton(
            AppAssets.icArrowChevronRight,
            onTap: () => _controller.next(),
            text: '>',
            isSelected: false,
          ),
        ],
      ),
    ),
    )
    );
  }
}


// define any custom button widget that you like
class _CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  final String? image;

  const _CustomButton(
    this.image, 
    {
      required this.onTap,
      required this.text,
      this.isSelected = false,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.black : Colors.white,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            padding: EdgeInsets.zero,
          ),
          child: image != null ? SvgPicture.asset(image!, color: AppColors.grey64748B,) :
          Text(
            text, 
            style: TextStyle(
              fontSize: 13, 
              fontWeight: FontWeight.w500, 
              color: isSelected ? Colors.white : AppColors.grey94A3B8
              ),
            ),
        ),
      ),
    );
  }
}
