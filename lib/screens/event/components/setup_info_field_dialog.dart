import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';

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
        height: MediaQuery.heightOf(context) * 552 / 900,
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
                    flex: 224,
                    child: Container(
                      color: AppColors.greyF2F4FA,
                      child: Column(
                        children: [
                          _buildVerticalTab('Phát hiện chuyển động', 0),
                          _buildVerticalTab('Phát hiện xâm nhập', 1),
                          _buildVerticalTab('Phân biệt đối tượng', 2),
                          _buildVerticalTab('Phát hiện vượt hàng rào ảo', 3),
                          _buildVerticalTab('Phát hiện vật bị bỏ quên', 4),
                          _buildVerticalTab('Phát hiện vật nguy hiểm', 5),
                        ],
                      ),
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
                        _buildTabContent(4),
                        _buildTabContent(5),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          CustomReorderableListView(),
          const SizedBox(height: 16),

          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 125,
                child: AppButton.outline(label: 'Hủy', onPressed: () => Navigator.pop(context)),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 125,
                child: AppButton.filled(label: 'Lưu', onPressed: () => Navigator.pop(context)),
              ),
              const Spacer(flex: 99),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalTab(String text, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          selectedTabIndex.value = index;
          pageController.jumpToPage(index);
        },
        child: ValueListenableBuilder(
          valueListenable: selectedTabIndex,
          builder: (context, value, child) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  left: value == index
                      ? BorderSide(color: AppColors.secondary, width: 2)
                      : BorderSide.none,
                ),
                color: value == index ? AppColors.white : null,
              ),
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 14),
              width: double.infinity,
              child: Text(
                text,
                maxLines: 3,
                style: AppTypography.style(
                  14,
                  color: AppColors.grey64748B,
                  fontWeight: FontWeight.w600,
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
  const CustomReorderableListView({super.key});

  @override
  State<CustomReorderableListView> createState() => _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  final GlobalKey _listKey = GlobalKey();

  final List<String> _items = ["Thời gian", "Thiết bị"];
  final List<String> _allOptions = [
    "Thời gian",
    "Thiết bị",
    "Địa điểm",
    "Biển số xe",
    "Kênh camera",
    "Người xử lý",
  ];

  OverlayEntry? _popupEntry;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trường dữ liệu', style: AppTypography.style(14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyE2E8F0),
            borderRadius: BorderRadius.circular(3),
            color: AppColors.greyF2F4FA,
          ),
          padding: EdgeInsets.only(bottom: 10, left: 15, right: 12, top: 10),
          width: double.infinity,
          child: Text('Loại sự kiện'),
        ),
        const SizedBox(height: 5),
        ReorderableListView(
          key: _listKey,
          buildDefaultDragHandles: false,
          onReorder: (int oldIndex, int newIndex) => setState(() {
            if (oldIndex < newIndex) newIndex -= 1;
            final String item = _items.removeAt(oldIndex);
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
                  Container(
                    color: AppColors.greyE2E8F0,
                    height: 40,
                    child: ReorderableDragStartListener(
                      index: index,
                      child: Icon(Icons.drag_indicator, color: AppColors.grey64748B),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _items[index],
                      style: AppTypography.style(14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: SvgPicture.asset(AppAssets.icCloseFilled),
                    onPressed: () => setState(() => _items.removeAt(index)),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: showAddDataPopup,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.add, color: AppColors.secondary, size: 18),
              Text(
                'Thêm phân loại',
                style: AppTypography.style(
                  14,
                  color: AppColors.secondary,
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
    _searchController.dispose();
    super.dispose();
  }

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

    _searchController.clear();

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
                  boxShadow: [BoxShadow(blurRadius: 60, color: AppColors.grey93989A.withAlpha(52))],
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.all(8.0),
                child: StatefulBuilder(
                  builder: (context, setStatePopup) {
                    final keyword = _searchController.text.trim().toLowerCase();
                    final availableOptions = _allOptions
                        .where((o) => !_items.contains(o))
                        .where((o) => keyword.isEmpty || o.toLowerCase().contains(keyword))
                        .toList();

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.secondary, width: 1),
                            ),
                            hintText: 'Nhập tên dữ liệu',
                            hintStyle: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey92929D,
                            ),
                            isDense: true,
                          ),
                          onChanged: (_) => setStatePopup(() {}),
                        ),
                        const SizedBox(height: 8),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 220),
                          child: availableOptions.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Không có kết quả phù hợp',
                                    style: AppTypography.style(12, color: AppColors.grey64748B),
                                  ),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) => TextButton(
                                    onPressed: () {
                                      setState(() => _items.add(availableOptions[index]));
                                      _removePopup();
                                    },
                                    style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Text(
                                        availableOptions[index],
                                        style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  itemCount: availableOptions.length,
                                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                                ),
                        ),
                      ],
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
