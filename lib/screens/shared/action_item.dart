import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/event_constants.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/bloc/setup_info_field_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/setup_info_field_dialog.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';
import 'package:vms_flutter_client/screens/monitor/components/monitor_alerts.dart';

import 'panel.dart';

class ActionItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? suffix;
  const ActionItem({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEDF3F9) : null,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 8),
            Text(
              title,
              style: AppTypography.style(13, fontWeight: FontWeight.w400),
            ),

            if (suffix != null) ...[SizedBox(width: 8), suffix!],
          ],
        ),
      ),
    );
  }
}

class AlertDetectLiveView extends StatefulWidget {
  const AlertDetectLiveView({
    super.key,
    required this.controller,
    required this.id,
    required this.isSelected,
    required this.onPanelIndexChanged,
    this.count,
    this.maxWidth,
  });

  final PanelController controller;
  final int id;
  final bool isSelected;
  final Function(int? p1) onPanelIndexChanged;
  final String? count;
  final double? maxWidth;

  @override
  State<AlertDetectLiveView> createState() => _AlertDetectLiveViewState();
}

class _AlertDetectLiveViewState extends State<AlertDetectLiveView> {
  @override
  void initState() {
    context.read<DetectBloc>().add(DetectInitial());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ActionItem(
    isSelected: widget.isSelected,
    title: 'Cảnh báo',
    icon: AppAssets.icAlertTriangle,
    onTap: () => widget.controller.togglePanel(
      MonitorAlerts(
        maxWidth: widget.maxWidth ?? widget.controller.expandedWidth,
        key: ValueKey('monitor_alerts'),
      ),
      id: widget.id,
      onPanelIndexChanged: widget.onPanelIndexChanged,
    ),
    suffix: Row(
      children: [
        if (widget.count != null)
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFF0004),
              borderRadius: BorderRadius.circular(3),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            child: Text(
              widget.count ?? '',
              style: AppTypography.style(
                9,
                fontWeight: FontWeight.w600,
                color: AppColors.blackOrWhiteReverse,
              ),
            ),
          ),
        if (widget.count != null) const SizedBox(width: 8),
        Builder(
          builder: (context) {
            return IconButton(
              constraints: const BoxConstraints(),
              icon: SvgPicture.asset(AppAssets.icDots, width: 22, height: 22),
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                final overlay = Overlay.of(context);
                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                final RenderBox overlayBox =
                    overlay.context.findRenderObject() as RenderBox;

                final Offset btnGlobalPos = button.localToGlobal(
                  Offset.zero,
                  ancestor: overlayBox,
                );
                final Size buttonSize = button.size;

                late OverlayEntry entry;
                entry = OverlayEntry(
                  builder: (context) => Stack(
                    children: [
                      Positioned.fill(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => entry.remove(),
                          child: const SizedBox.shrink(),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: btnGlobalPos.dy + buttonSize.height + 8,
                        child: _AlertMenuBubble(
                          label: 'Cấu hình',
                          onTap: () {
                            // check list type event detect
                            final detectBloc = context.read<DetectBloc>();
                            final detectState = detectBloc.state;
                            if (detectState.status != DetectStatus.success) {
                              return;
                            }
                            // Save type event detect to local storage
                            final jsonString = json.encode(
                              detectState.typeEvents
                                  .map((e) => e.toJson())
                                  .toList(),
                            );
                            AppData.instance.save<String>(
                              AppKeys.SP_TYPE_EVENT_DETECT,
                              jsonString,
                            );
                            showDialog(
                              context: context,
                              builder: (dialogContext) => MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(value: context.read<EventBloc>()),
                                  BlocProvider.value(value: context.read<SetupEventDisplayBloc>()),
                                ],
                                child: SetupInfoFieldDialog(
                                  typeConfig: EventTypeConfig.LIVEVIEW,
                                  typeEvents: detectState.typeEvents,
                                ),
                              ),
                            );
                            entry.remove();
                          },
                        ),
                      ),
                    ],
                  ),
                );

                overlay.insert(entry);
              },
            );
          },
        ),
      ],
    ),
  );
}

class _AlertMenuBubble extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _AlertMenuBubble({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: CustomPaint(
            painter: _UpTrianglePainter(color: Colors.white),
            size: const Size(14, 8),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Text(
              label,
              style: AppTypography.style(13, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

class _UpTrianglePainter extends CustomPainter {
  final Color color;

  _UpTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_UpTrianglePainter oldDelegate) =>
      oldDelegate.color != color;
}
