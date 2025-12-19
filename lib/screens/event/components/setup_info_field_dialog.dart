import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

class SetupInfoFieldDialog extends StatefulWidget {
  const SetupInfoFieldDialog({super.key});

  @override
  State<SetupInfoFieldDialog> createState() => _SetupInfoFieldDialogState();
}

class _SetupInfoFieldDialogState extends State<SetupInfoFieldDialog> with TickerProviderStateMixin {
  final ValueNotifier<int> selectedTabIndex = ValueNotifier(0);
  final PageController pageController = PageController();

  late final List<List<Widget>> data = [
    [
      Text('1', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
      SvgPicture.asset(AppAssets.icVideoOn, alignment: AlignmentGeometry.centerLeft),
      Text('Loại sự kiện', style: AppTypography.style(14)),
      IconButton(
        constraints: BoxConstraints(),
        icon: Icon(Icons.delete_outline),
        onPressed: () => setState(() => data.removeAt(0)),
        padding: EdgeInsets.zero,
      ),
    ],
    [
      Text('2', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
      SvgPicture.asset(AppAssets.icVideoOn, alignment: AlignmentGeometry.centerLeft),
      Text('Thời gian', style: AppTypography.style(14)),
      IconButton(
        constraints: BoxConstraints(),
        icon: Icon(Icons.delete_outline),
        onPressed: () => setState(() => data.removeAt(1)),
        padding: EdgeInsets.zero,
      ),
    ],
    [
      Text('3', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
      SvgPicture.asset(AppAssets.icVideoOn, alignment: AlignmentGeometry.centerLeft),
      Text('Thiết bị', style: AppTypography.style(14)),
      IconButton(
        constraints: BoxConstraints(),
        icon: Icon(Icons.delete_outline),
        onPressed: () => setState(() => data.removeAt(2)),
        padding: EdgeInsets.zero,
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
        height: MediaQuery.heightOf(context) * 552 / 900,
        width: MediaQuery.widthOf(context) * 980 / 1600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cài đặt nội dung cảnh báo',
                    style: AppTypography.style(20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 224,
                    child: Column(
                      children: [
                        _buildVerticalTab('Phát hiện chuyển động', 0),
                        _buildVerticalTab('Phát hiện xâm nhập', 1),
                        _buildVerticalTab('Phân biệt đối tượng', 2),
                        _buildVerticalTab('Vượt hàng rào ảo', 3),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 756,
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      children: [
                        _buildTabContent(0),
                        _buildTabContent(1),
                        _buildTabContent(2),
                        _buildTabContent(3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    selectedTabIndex.dispose();
    super.dispose();
  }

  Widget _buildTabContent(int index) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTable(
            data: CustomTableData(
              columnFlexes: [1, 1, 10, 1],
              data: data,
              headers: ['STT', 'Icon', 'Trường dữ liệu', ''],
            ),
            headerBuilder: (value) =>
                Text(value, style: AppTypography.style(14, fontWeight: FontWeight.w600)),
            rowSpacing: 4,
            verticalBorder: Divider(color: AppColors.greyF2F4FA),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => setState(() {
              data.add([
                Text(
                  '${data.length + 1}',
                  style: AppTypography.style(14, fontWeight: FontWeight.w600),
                ),
                SvgPicture.asset(AppAssets.icVideoOn, alignment: AlignmentGeometry.centerLeft),
                Text('Trường dữ liệu', style: AppTypography.style(14)),
                IconButton(
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.delete_outline),
                  onPressed: () => setState(() => data.removeLast()),
                  padding: EdgeInsets.zero,
                ),
              ]);
            }),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: AppColors.secondary),
                Text(
                  'Thêm phân loại sự kiện',
                  style: AppTypography.style(
                    16,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: AppButton.outline(label: 'Hủy', onPressed: () => Navigator.pop(context)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton.filled(label: 'Lưu', onPressed: () => Navigator.pop(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalTab(String text, int index) {
    return Material(
      child: InkWell(
        onTap: () {
          selectedTabIndex.value = index;
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: ValueListenableBuilder(
          valueListenable: selectedTabIndex,
          builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: value == index ? AppColors.blue005AA9 : Colors.transparent,
              ),
              child: Text(
                text,
                style: AppTypography.style(
                  14,
                  color: value == index ? AppColors.white : AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
