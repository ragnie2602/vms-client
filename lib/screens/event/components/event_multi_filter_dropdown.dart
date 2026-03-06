import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class EventMultiFilterDropdown<T> extends StatefulWidget {
  final bool allMode;
  final double? dropdownMaxHeight;
  final String? hint;
  final bool isDense;
  final bool isExpanded;
  final Widget Function(T item)? itemBuilder;
  final List<T> items;
  final List<T>? initialValue;
  final String? label;
  final TextStyle? labelStyle;
  final void Function(List<T>?) onChanged;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;

  const EventMultiFilterDropdown({
    super.key,
    this.allMode = false,
    this.dropdownMaxHeight,
    this.hint,
    this.isDense = false,
    this.isExpanded = true,
    this.itemBuilder,
    required this.items,
    this.initialValue,
    this.label,
    this.labelStyle,
    required this.onChanged,
    this.padding,
    this.style,
  });

  @override
  State<EventMultiFilterDropdown<T>> createState() => _EventMultiFilterDropdownState<T>();
}

class _EventMultiFilterDropdownState<T> extends State<EventMultiFilterDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  List<T>? _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label!, style: widget.labelStyle),
        const SizedBox(height: 8),
        CompositedTransformTarget(
          link: _layerLink,
          child: InkWell(
            borderRadius: BorderRadius.circular(3),
            onTap: _toggleOverlay,
            child: Container(
              key: _buttonKey,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyE2E8F0, width: 1),
                borderRadius: BorderRadius.circular(3),
              ),
              height: widget.style?.height ?? 17 + (widget.padding?.vertical ?? 0),
              padding: _padding(),
              child: Row(
                children: [
                  Expanded(child: _display()),
                  SvgPicture.asset(AppAssets.icDropdown),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant EventMultiFilterDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_selectedValues != null) {
      _selectedValues = _selectedValues!.where((v) => widget.items.contains(v)).toList();
    }

    if (widget.initialValue != oldWidget.initialValue) {
      final nextInitial = widget.initialValue;

      if (nextInitial == null) {
        if (_selectedValues != null) {
          setState(() => _selectedValues = null);
        }
        return;
      }

      if (nextInitial.isEmpty) {
        if (_selectedValues != null && _selectedValues!.isNotEmpty) {
          setState(() => _selectedValues = <T>[]);
        }
        return;
      }

      if (!nextInitial.every((e) => widget.items.contains(e))) return;

      final current = _selectedValues ?? <T>[];
      final currentSet = current.toSet();
      final nextSet = nextInitial.toSet();

      if (currentSet.length != nextSet.length || !currentSet.containsAll(nextSet)) {
        setState(() => _selectedValues = List<T>.from(nextInitial));
      }
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  Widget _display() {
    if (_selectedValues == null) {
      return Text(
        'Tất cả',
        style: AppTypography.style(14, color: AppColors.grey64748B, fontWeight: FontWeight.w400),
      );
    }
    if (_selectedValues!.isEmpty) return Text('');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyDFE4EA),
              borderRadius: BorderRadius.circular(6),
              color: const Color.fromARGB(255, 215, 216, 220),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
            child: Row(
              children: [
                InkWell(
                  onTap: () => setState(() {
                    _selectedValues!.removeAt(0);
                    widget.onChanged(_selectedValues!);
                  }),
                  child: SvgPicture.asset(
                    AppAssets.icClose,
                    colorFilter: ColorFilter.mode(AppColors.grey9CA3AF, BlendMode.srcIn),
                    height: 16,
                    width: 16,
                  ),
                ),
                Text(
                  '${_selectedValues![0]}',
                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          if (_selectedValues!.length > 1)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyDFE4EA),
                borderRadius: BorderRadius.circular(6),
                color: const Color.fromARGB(255, 215, 216, 220),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              child: Text(
                '+${_selectedValues!.length - 1}',
                style: AppTypography.style(14, fontWeight: FontWeight.w400),
              ),
            ),
        ],
      ),
    );
  }

  EdgeInsetsGeometry _padding() {
    if (widget.padding == null) return EdgeInsets.zero;

    if (_selectedValues == null || _selectedValues!.isEmpty) return widget.padding!;

    return widget.padding!.subtract(EdgeInsets.symmetric(vertical: 6));
  }

  void _toggleOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      setState(() {});
      return;
    }

    final renderBox = _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    final buttonWidth = renderBox?.size.width ?? 200;

    _overlayEntry = OverlayEntry(
      builder: (context) => _MultiSelectOverlay<T>(
        allMode: widget.allMode,
        buttonWidth: buttonWidth,
        itemBuilder: widget.itemBuilder,
        items: widget.items,
        layerLink: _layerLink,
        maxHeight: widget.dropdownMaxHeight ?? 300,
        onClose: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
          setState(() {});
        },
        onSelectionChanged: (values) {
          setState(
            () => values?.length == widget.items.length
                ? _selectedValues = null
                : _selectedValues = values,
          );
          widget.onChanged(values);

          _overlayEntry?.markNeedsBuild();
        },
        selectedValues: _selectedValues,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {});
  }
}

class _MultiSelectOverlay<T> extends StatefulWidget {
  final bool allMode;
  final double buttonWidth;
  final Widget Function(T item)? itemBuilder;
  final List<T> items;
  final LayerLink layerLink;
  final double maxHeight;
  final VoidCallback onClose;
  final void Function(List<T>?) onSelectionChanged;
  final List<T>? selectedValues;

  const _MultiSelectOverlay({
    required this.allMode,
    required this.buttonWidth,
    this.itemBuilder,
    required this.items,
    required this.layerLink,
    required this.maxHeight,
    required this.onSelectionChanged,
    required this.onClose,
    required this.selectedValues,
  });

  @override
  State<_MultiSelectOverlay<T>> createState() => _MultiSelectOverlayState<T>();
}

class _MultiSelectOverlayState<T> extends State<_MultiSelectOverlay<T>> {
  final List<T?> _items = [];

  @override
  void initState() {
    super.initState();
    if (widget.allMode) _items.add(null);
    _items.addAll(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: widget.onClose),
        ),
        CompositedTransformFollower(
          followerAnchor: Alignment.topLeft,
          link: widget.layerLink,
          offset: const Offset(0, 4),
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: widget.maxHeight,
              maxWidth: widget.buttonWidth,
              minWidth: widget.buttonWidth,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyE2E8F0),
              borderRadius: BorderRadius.circular(3),
              color: AppColors.white,
            ),
            padding: EdgeInsets.all(10),
            width: widget.buttonWidth,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = _items[index];
                final isSelected = _isSelected(item);

                return InkWell(
                  onTap: () => _toggleItem(item),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 14,
                          width: 14,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor: WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColors.secondary;
                              }
                              return Colors.transparent;
                            }),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (_) => _toggleItem(item),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                            side: const BorderSide(color: AppColors.greyE2E8F0),
                            value: isSelected,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: _item(item)),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _items.length,
              shrinkWrap: true,
            ),
          ),
        ),
      ],
    );
  }

  bool _isSelected(T? item) {
    if (item == null) return widget.selectedValues == null;
    return widget.selectedValues == null || widget.selectedValues!.contains(item);
  }

  Widget _item(T? item) {
    if (item == null) {
      return Text(
        'Tất cả',
        style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
      );
    }

    return widget.itemBuilder?.call(item) ?? Text(item.toString());
  }

  _toggleItem(T? item) {
    if (item == null) {
      if (_isSelected(item)) {
        widget.onSelectionChanged([]);
      } else {
        widget.onSelectionChanged(null);
      }
    } else {
      if (widget.selectedValues == null) {
        final List<T> items = [];
        items.addAll(widget.items);
        items.remove(item);

        widget.onSelectionChanged(items);
      } else {
        if (_isSelected(item)) {
          widget.onSelectionChanged(widget.selectedValues!..remove(item));
        } else {
          widget.onSelectionChanged(widget.selectedValues!..add(item));
        }
      }
    }
  }
}
