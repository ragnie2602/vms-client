import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/alert/alert_field.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';

class SetupInfoFieldDialog extends StatefulWidget {
  const SetupInfoFieldDialog({super.key});

  @override
  State<SetupInfoFieldDialog> createState() => _SetupInfoFieldDialogState();
}

class _SetupInfoFieldDialogState extends State<SetupInfoFieldDialog> with TickerProviderStateMixin {
  final ValueNotifier<int> selectedTabIndex = ValueNotifier(0);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
        height: MediaQuery.heightOf(context) * 479 / 900,
        width: MediaQuery.widthOf(context) * 613 / 1600,
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
                    flex: 200,
                    child: Container(
                      color: AppColors.greyF9FAFB,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        spacing: 4,
                        children: [
                          _buildVerticalTab('Cảnh báo xâm nhập', 0),
                          _buildVerticalTab('Cảnh báo hút thuốc', 1),
                          _buildVerticalTab('Sử dụng điện thoại', 2),
                          _buildVerticalTab('Cảnh báo tụ tập', 3),
                          _buildVerticalTab('Cảnh báo cháy', 4),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 413,
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      children: [
                        _buildTabContent(0),
                        _buildTabContent(1),
                        _buildTabContent(2),
                        _buildTabContent(3),
                        _buildTabContent(4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  EventCustomButton(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.greyD1D5DB,
                    borderRadius: 5,
                    label: 'Huỷ',
                    onPressed: () => Navigator.pop(context),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle: AppTypography.style(
                      14,
                      color: Color(0xFF374151),
                      lineHeight: 20 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 17),
                  EventCustomButton(
                    backgroundColor: AppColors.secondary,
                    borderColor: AppColors.secondary,
                    borderRadius: 5,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: AppColors.blue3B82F6.withAlpha(51),
                        offset: Offset(0, 2),
                        spreadRadius: -2,
                      ),
                      BoxShadow(
                        blurRadius: 6,
                        color: AppColors.blue3B82F6.withAlpha(51),
                        offset: Offset(0, 4),
                        spreadRadius: -1,
                      ),
                    ],
                    label: 'Lưu',
                    onPressed: () => Navigator.pop(context),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle: AppTypography.style(
                      14,
                      color: AppColors.white,
                      lineHeight: 20 / 14,
                      fontWeight: FontWeight.w600,
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(children: [CustomReorderableListView(type: index)]),
    );
  }

  Widget _buildVerticalTab(String text, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          selectedTabIndex.value = index;
          pageController.jumpToPage(index);
        },
        child: ValueListenableBuilder(
          valueListenable: selectedTabIndex,
          builder: (context, value, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: value == index ? AppColors.blueEFF6FF : null,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              child: Text(
                text,
                maxLines: 3,
                style: AppTypography.style(
                  14,
                  color: value == index ? AppColors.blue005EB8 : AppColors.grey64748B,
                  fontWeight: value == index ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomReorderableListView extends StatefulWidget {
  final int type;

  const CustomReorderableListView({super.key, required this.type});

  @override
  State<CustomReorderableListView> createState() => _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  final GlobalKey _listKey = GlobalKey();

  final List<AlertField> _items = [
    AlertField(id: 1, name: "Loại sự kiện", icon: SvgPicture.asset(AppAssets.icEventType)),
    AlertField(id: 2, name: "Thời gian", icon: SvgPicture.asset(AppAssets.icTimeCircle)),
    AlertField(id: 3, name: "Tên camera", icon: SvgPicture.asset(AppAssets.icVideoOn)),
  ];
  final List<AlertField> _allOptions = [
    AlertField(id: 1, name: "Loại sự kiện", icon: SvgPicture.asset(AppAssets.icEventType)),
    AlertField(id: 2, name: "Thời gian", icon: SvgPicture.asset(AppAssets.icTimeCircle)),
    AlertField(id: 3, name: "Tên camera", icon: SvgPicture.asset(AppAssets.icVideoOn)),
  ];

  OverlayEntry? _popupEntry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trường dữ liệu', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        ReorderableListView(
          key: _listKey,
          buildDefaultDragHandles: false,
          onReorder: (int oldIndex, int newIndex) => setState(() {
            if (oldIndex < newIndex) newIndex -= 1;
            final AlertField item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          }),
          shrinkWrap: true,
          children: List.generate(
            _items.length,
            (index) => Container(
              key: UniqueKey(),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyE2E8F0),
                borderRadius: BorderRadius.circular(3),
                color: AppColors.white,
              ),
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  ReorderableDragStartListener(
                    index: index,
                    child: Container(
                      color: AppColors.greyE2E8F0,
                      height: 40,
                      width: 23,
                      child: Center(child: SvgPicture.asset(AppAssets.icDrawable)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _items[index].name,
                      style: AppTypography.style(14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: SvgPicture.asset(AppAssets.icClose, height: 20, width: 20),
                    onPressed: () => setState(() => _items.removeAt(index)),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: _isSelectedAll ? null : showAddDataPopup,
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: _isSelectedAll ? AppColors.grey64748B : AppColors.secondary,
                size: 18,
              ),
              Text(
                'Thêm trường thông tin',
                style: AppTypography.style(
                  14,
                  color: _isSelectedAll ? AppColors.grey64748B : AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _removePopup();
    super.dispose();
  }

  bool get _isSelectedAll => _allOptions.length == _items.length;

  void showAddDataPopup() {
    if (_popupEntry != null) {
      _removePopup();
      return;
    }

    final listContext = _listKey.currentContext;
    if (listContext == null) return;

    final overlayState = Overlay.of(context);
    final RenderBox listBox = listContext.findRenderObject() as RenderBox;
    final RenderBox overlayBox = overlayState.context.findRenderObject() as RenderBox;

    final Offset listBottom = listBox.localToGlobal(
      Offset(0, listBox.size.height),
      ancestor: overlayBox,
    );

    _popupEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _removePopup,
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned(
            left: listBottom.dx,
            top: listBottom.dy + 4,
            width: listBox.size.width,
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 60,
                      color: AppColors.grey93989A.withAlpha(51),
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.all(8.0),
                child: StatefulBuilder(
                  builder: (context, setStatePopup) {
                    final availableOptions = _allOptions.where((o) => !_items.contains(o)).toList();

                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 220),
                      child: ListView.separated(
                        itemBuilder: (context, index) => TextButton(
                          onPressed: () {
                            setState(() => _items.add(availableOptions[index]));
                            _removePopup();
                          },
                          style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              availableOptions[index].name,
                              style: AppTypography.style(14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        itemCount: availableOptions.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 4),
                        shrinkWrap: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlayState.insert(_popupEntry!);
  }

  void _removePopup() {
    _popupEntry?.remove();
    _popupEntry = null;
  }
}
