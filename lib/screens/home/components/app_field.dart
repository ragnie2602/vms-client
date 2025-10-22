import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

/// --- Reusable UI atoms ----------------------------------------------------
class AppField extends StatefulWidget {
  const AppField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.label,
    this.paddingBottomLabel = 6,
    this.requiredField = false,
    this.trailingButton,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final double paddingBottomLabel;
  final String? Function(String?)? validator;
  final String? label;
  final bool requiredField;
  final Widget? trailingButton;

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  String? _errorText;

  String? _customValidator(String? value) {
    final error = widget.validator?.call(value);
    setState(() {
      _errorText = error;
    });
    return error;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelWidget = widget.label == null
        ? null
        : Visibility(
            visible: widget.label!.isNotEmpty,
            child: RichText(
              text: TextSpan(
                text: widget.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
                children: widget.requiredField
                    ? const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ]
                    : const [],
              ),
            ),
          );

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        final List<Widget> suffixChildren = [];
        if (widget.suffix != null) suffixChildren.add(widget.suffix!);
        if (widget.maxLength != null) {
          suffixChildren.add(
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '${value.text.length}/${widget.maxLength}',
                style: theme.textTheme.bodySmall,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (labelWidget != null) ...[
              Padding(
                padding: EdgeInsets.only(bottom: widget.paddingBottomLabel),
                child: labelWidget,
              ),
            ],
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    validator: _customValidator,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF92929D),
                      ),
                      // Ẩn counter mặc định (nằm dưới), thay bằng counter ở suffix
                      counterText: '',
                      errorMaxLines: 1,
                      errorStyle: const TextStyle(fontSize: 0, height: 0),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      suffixIcon: suffixChildren.isEmpty
                          ? null
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: suffixChildren,
                            ),
                    ),
                  ),
                ),
                if (widget.trailingButton != null) ...[
                  const SizedBox(width: 8),
                  widget.trailingButton!,
                ],
              ],
            ),
            // Custom error message với icon
            if (_errorText != null) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      _errorText!,
                      style: const TextStyle(
                        color: AppColors.redFF0004,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
