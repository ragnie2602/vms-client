import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

/// A small info icon (ⓘ) that expands into a guidelines container on hover.
/// Used next to image upload field labels to show upload requirements.
class ImageUploadInfoTooltip extends StatefulWidget {
  const ImageUploadInfoTooltip({super.key});

  @override
  State<ImageUploadInfoTooltip> createState() => _ImageUploadInfoTooltipState();
}

class _ImageUploadInfoTooltipState extends State<ImageUploadInfoTooltip>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _animationController.dispose();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => _AnimatedInfoOverlay(
        layerLink: _layerLink,
        scaleAnimation: _scaleAnimation,
        fadeAnimation: _fadeAnimation,
        onExitHover: _hideOverlay,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _hideOverlay() {
    _animationController.reverse().then((_) {
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _showOverlay(),
        onExit: (_) => _hideOverlay(),
        cursor: SystemMouseCursors.click,
        child: const Icon(
          Icons.info_outline,
          size: 16,
          color: AppColors.grey64748B,
        ),
      ),
    );
  }
}

class _AnimatedInfoOverlay extends StatelessWidget {
  final LayerLink layerLink;
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;
  final VoidCallback onExitHover;

  const _AnimatedInfoOverlay({
    required this.layerLink,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.onExitHover,
  });

  static const _guidelines = [
    'Upload hình ảnh theo dạng BMP, JPG, PNG (Khuyên dùng JPG).',
    'Ảnh chân dung nửa người hoặc cận mặt.',
    'Khuôn mặt phải chiếm hơn 1/3 diện tích bức ảnh, có kích thước tối thiểu 128×128 pixels.',
    'Phông nền trơn, nhìn thẳng, biểu cảm trung tính, ánh sáng đều, không bị lóa kính.',
  ];

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: CompositedTransformFollower(
        link: layerLink,
        targetAnchor: Alignment.bottomLeft,
        followerAnchor: Alignment.topLeft,
        offset: const Offset(-4, 4),
        child: MouseRegion(
          onExit: (_) => onExitHover(),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SizeTransition(
              sizeFactor: scaleAnimation,
              axisAlignment: -1.0,
              child: Material(
                color: Colors.transparent,
                child: SizedBox(
                  width: 300,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xE6424242),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hướng dẫn:',
                          style: AppTypography.style(
                            13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ..._guidelines.map(
                          (text) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Icon(
                                    Icons.check,
                                    size: 12,
                                    color: AppColors.green03BF00,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    text,
                                    style: AppTypography.style(
                                      13,
                                      color: Colors.white,
                                      lineHeight: 1.2,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
