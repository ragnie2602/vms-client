part of 'alarm_config_popup.dart';

class TitleWithTooltip extends StatelessWidget {
  const TitleWithTooltip({
    super.key,
    required this.title,
    required this.tooltip,
    this.preferBelow = true,
  });
  final String title;
  final String? tooltip;
  final bool preferBelow;

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      style: AppTypography.style(
        14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF334155),
        lineHeight: 20 / 14,
      ),
    );

    if (tooltip == null) return titleWidget;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleWidget,
        SizedBox(width: 8),
        Tooltip(
          mouseCursor: SystemMouseCursors.click,
          textStyle: AppTypography.style(
            12,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
            lineHeight: 18 / 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.black.withValues(alpha: 0.7),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          verticalOffset: 12,
          preferBelow: preferBelow,
          message: tooltip,
          child: Icon(Icons.info_rounded, size: 15),
        ),
      ],
    );
  }
}
