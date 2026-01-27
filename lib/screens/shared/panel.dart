import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';

class PanelController {
  late Future<void> Function(
    Widget content, {
    int? id,
    Function(int?)? onPanelIndexChanged,
    bool? toggleSidebar,
  })
  togglePanel;
  late void Function({bool? toggleSidebar}) closePanel;

  late double expandedWidth;
}

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

  Widget? content;
  Function(int?)? onPanelIndexChanged;
  bool get isOpening => _width.value == widget.expandedWidth;
  bool? shouldToggleSidebar;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.expandedWidth = widget.expandedWidth;
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
    Widget content, {
    int? id,
    Function(int?)? onPanelIndexChanged,
    bool? toggleSidebar,
  }) async {
    shouldToggleSidebar = toggleSidebar ?? true;
    this.onPanelIndexChanged = onPanelIndexChanged;
    this.onPanelIndexChanged?.call(id);

    if (isOpening && this.content != null && this.content!.key != content.key) {
      this.content = content;
      setState(() {});
      return;
    }

    this.content = content;

    // Mở
    if (_width.value == 0) {
      this.toggleSidebar(1);
      _width.value = widget.expandedWidth;
    }
    // Đóng
    else {
      this.toggleSidebar(2);
      _width.value = 0;
      this.onPanelIndexChanged?.call(null);
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
        return Expanded(child: content!);
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
              onTap: () {
                _width.value = 0;
                onPanelIndexChanged?.call(null);
                toggleSidebar(2);
              },
              child: SvgPicture.asset(AppAssets.icClose),
            ),
          ),
          if (content != null && isOpening) Expanded(child: content!),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          if (content != null && isOpening) Positioned.fill(child: content!),
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 4, 12),
              child: InkWell(
                onTap: () {
                  _width.value = 0;
                  onPanelIndexChanged?.call(null);
                  toggleSidebar(2);
                },
                child: SvgPicture.asset(AppAssets.icClose),
              ),
            ),
          ),
        ],
      );
    }
  }
}
