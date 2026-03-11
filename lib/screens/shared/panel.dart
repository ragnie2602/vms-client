import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';

enum SplitterSide { left, right }

class PanelController {
  late Future<void> Function(
    Widget Function(double) content, {
    required int id,
    Function(int?)? onPanelIndexChanged,
    bool? toggleSidebar,
  })
  togglePanel;
  late void Function({bool? toggleSidebar}) closePanel;
}

/// ============== FIXED PANEL ==============

class Panel extends StatefulWidget {
  final double expandedWidth;
  final PanelController? controller;
  final bool? icCloseOnContent;

  const Panel({super.key, required this.expandedWidth, this.controller, this.icCloseOnContent});

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  late final ValueNotifier<double> _width = ValueNotifier(0);

  int? contentId;
  Widget Function(double)? content;
  Function(int?)? onPanelIndexChanged;
  bool? shouldToggleSidebar;

  bool get isOpening => _width.value == widget.expandedWidth;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.togglePanel = togglePanel;
      widget.controller!.closePanel = closePanel;
    }

    super.initState();
  }

  @override
  void dispose() {
    _width.dispose();
    super.dispose();
  }

  Future<void> togglePanel(
    Widget Function(double) content, {
    required int id,
    Function(int?)? onPanelIndexChanged,
    bool? toggleSidebar,
  }) async {
    shouldToggleSidebar = toggleSidebar ?? true;
    this.onPanelIndexChanged = onPanelIndexChanged;
    this.onPanelIndexChanged?.call(id);

    if (isOpening && id != contentId) {
      contentId = id;
      this.content = content;
      setState(() {});
      return;
    }

    contentId = id;
    this.content = content;

    // Mở
    if (_width.value == 0) {
      this.toggleSidebar(1);
      _width.value = widget.expandedWidth;
    }
    // Đóng
    else {
      closePanel(toggleSidebar: true);
    }
  }

  void closePanel({bool? toggleSidebar}) {
    if (!isOpening) return;
    _width.value = 0;
    onPanelIndexChanged?.call(null);
    if (toggleSidebar == true) this.toggleSidebar(2);
  }

  /// 1: đóng + save trạng thái cũ, 2: khôi phục lại trạng thái cũ
  void toggleSidebar(int type) {
    if (shouldToggleSidebar != true) return;

    context.read<HomeBloc?>()?.add(ToggleSidebar(type: type));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _width,
      builder: (context, width, child) => AnimatedContainer(
        duration: Durations.medium1,
        width: width,
        height: double.infinity,
        color: AppColors.contentBg,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.icCloseOnContent == null) {
      if (content != null && isOpening) {
        return content!(_width.value);
      } else {
        return Container();
      }
    } else if (!widget.icCloseOnContent!) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
            child: InkWell(
              onTap: () => closePanel(toggleSidebar: true),
              child: SvgPicture.asset(AppAssets.icClose),
            ),
          ),
          if (content != null && isOpening) Expanded(child: content!(_width.value)),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          if (content != null && isOpening) Positioned.fill(child: content!(_width.value)),
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
              child: InkWell(
                onTap: () => closePanel(toggleSidebar: true),
                child: SvgPicture.asset(AppAssets.icClose),
              ),
            ),
          ),
        ],
      );
    }
  }
}

/// ============== RESIZABLE PANEL ==============

class ResizablePanel extends StatefulWidget {
  final double maxWidth;
  final double minWidth;
  final double? initialWidth;
  final PanelController? controller;
  final bool? icCloseOnContent;
  final SplitterSide splitterSide;
  final double splitterWidth;

  const ResizablePanel({
    super.key,
    required this.maxWidth,
    required this.minWidth,
    this.initialWidth,
    this.controller,
    this.icCloseOnContent,
    this.splitterSide = SplitterSide.left,
    this.splitterWidth = 6,
  });

  @override
  State<ResizablePanel> createState() => _ResizablePanelState();
}

class _ResizablePanelState extends State<ResizablePanel> {
  late final ValueNotifier<double> _width = ValueNotifier(0);
  final Map<int, double> _closedWidth = {};

  Widget Function(double)? content;
  int? contentId;
  Function(int?)? onPanelIndexChanged;
  bool? shouldToggleSidebar;

  bool get isOpening => _width.value != 0;
  int get splitterSign => widget.splitterSide == SplitterSide.left ? 1 : -1;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.togglePanel = togglePanel;
      widget.controller!.closePanel = closePanel;
    }

    super.initState();
  }

  @override
  void dispose() {
    _width.dispose();
    super.dispose();
  }

  Future<void> togglePanel(
    Widget Function(double) content, {
    int? id,
    Function(int?)? onPanelIndexChanged,
    bool? toggleSidebar,
  }) async {
    shouldToggleSidebar = toggleSidebar ?? true;
    this.onPanelIndexChanged = onPanelIndexChanged;
    this.onPanelIndexChanged?.call(id);

    if (isOpening && id != contentId) {
      // Lưu kích thước cũ + restore kích thước mới/initialWidth/minWidth
      _closedWidth[contentId ?? -1] = _width.value;
      _width.value = _closedWidth[id] ?? widget.initialWidth ?? widget.minWidth;

      contentId = id;
      this.content = content; // Swap content

      return setState(() {});
    }

    contentId = id;
    this.content = content;

    // Mở
    if (_width.value == 0) {
      this.toggleSidebar(1);
      _width.value = _closedWidth[id] ?? widget.initialWidth ?? widget.minWidth;
    }
    // Đóng
    else {
      closePanel(toggleSidebar: true);
    }
  }

  void closePanel({bool? toggleSidebar}) {
    if (!isOpening) return;
    _closedWidth[contentId ?? -1] = _width.value;
    _width.value = 0;
    onPanelIndexChanged?.call(null);
    if (toggleSidebar == true) this.toggleSidebar(2);
  }

  /// 1: đóng + save trạng thái cũ, 2: khôi phục lại trạng thái cũ
  void toggleSidebar(int type) {
    if (shouldToggleSidebar != true) return;

    context.read<HomeBloc?>()?.add(ToggleSidebar(type: type));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _width,
      builder: (context, width, child) => AnimatedContainer(
        duration: _isResizing ? Duration.zero : Durations.medium1,
        width: isOpening ? width + widget.splitterWidth : width,
        height: double.infinity,
        color: AppColors.contentBg,
        child: Row(
          children: [
            if (widget.splitterSide == SplitterSide.left && isOpening) _buildDraggingDivider(),
            Expanded(child: _buildContent()),
            if (widget.splitterSide == SplitterSide.right && isOpening) _buildDraggingDivider(),
          ],
        ),
      ),
    );
  }

  double _startWidth = 0;
  double _startMouseX = 0;
  bool _isResizing = false;
  bool _isDragging = false;
  Widget _buildDraggingDivider() {
    return StatefulBuilder(
      builder: (context, nestedSetState) => MouseRegion(
        cursor: SystemMouseCursors.resizeColumn,
        onEnter: (event) => nestedSetState(() => _isResizing = true),
        onExit: (event) => nestedSetState(() => _isResizing = _isDragging),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,

          onPanStart: (DragStartDetails details) {
            _isResizing = _isDragging = true;
            // BƯỚC 1: Chốt mốc (neo) ngay khoảnh khắc chuột vừa bấm xuống
            _startWidth = _width.value;
            _startMouseX = details.globalPosition.dx;
          },

          onPanUpdate: (DragUpdateDetails details) {
            // BƯỚC 2: Tính khoảng cách chuột đã di chuyển so với mốc ban đầu
            final double deltaX = details.globalPosition.dx - _startMouseX;

            // Tính độ rộng mới (Trừ đi deltaX vì panel của bạn có vẻ nằm bên PHẢI màn hình)
            // Nếu panel của bạn nằm bên TRÁI, hãy đổi thành: _startWidth + deltaX
            final double newWidth = _startWidth - deltaX * splitterSign;

            // BƯỚC 3: Kẹp min-max và cập nhật UI
            _width.value = newWidth.clamp(widget.minWidth, widget.maxWidth);
          },

          onPanEnd: (DragEndDetails details) {
            _isResizing = _isDragging = false;
            nestedSetState(() {});
          },
          child: AnimatedContainer(
            width: widget.splitterWidth,
            height: double.infinity,
            duration: Durations.short4,
            color: _isResizing ? AppColors.primary.withValues(alpha: 0.75) : Colors.transparent,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: List.generate(
                4,
                (index) => CircleAvatar(radius: 1.75, backgroundColor: AppColors.grey0F172A),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.icCloseOnContent == null) {
      if (content != null && isOpening) {
        return content!(_width.value);
      } else {
        return Container();
      }
    } else if (!widget.icCloseOnContent!) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
            child: InkWell(
              onTap: () => closePanel(toggleSidebar: true),
              child: SvgPicture.asset(AppAssets.icClose),
            ),
          ),
          if (content != null && isOpening) Expanded(child: content!(_width.value)),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          if (content != null && isOpening) Positioned.fill(child: content!(_width.value)),
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
              child: InkWell(
                onTap: () => closePanel(toggleSidebar: true),
                child: SvgPicture.asset(AppAssets.icClose),
              ),
            ),
          ),
        ],
      );
    }
  }
}
