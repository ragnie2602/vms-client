import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

/// --- Reusable UI atoms ----------------------------------------------------
class AppField extends StatefulWidget {
  const AppField({
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.hintText,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.label,
    this.paddingBottomLabel = 6,
    this.requiredField = false,
    this.trailingButton,
    this.inputFormatters,
    this.readOnly = false,
    this.borderRadius,
    this.isFilled,
    this.fillColor,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textStyle,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String? hintText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final double paddingBottomLabel;
  final String? Function(String?)? validator;
  final String? label;
  final bool requiredField;
  final Widget? trailingButton;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final double? borderRadius;
  final bool? isFilled;
  final Color? fillColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final TextStyle? textStyle;

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  String? _errorText;
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController(text: widget.initialValue);
    _errorText = widget.errorText;
  }

  @override
  void didUpdateWidget(AppField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      if (widget.controller != null) {
        _internalController = widget.controller!;
      }
    }
    if (widget.errorText != oldWidget.errorText) {
      _errorText = widget.errorText;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  String? _customValidator(String? value) {
    if (widget.validator == null) return null;
    final error = widget.validator!.call(value);
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
                style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.black),
                children: widget.requiredField
                    ? [
                        TextSpan(
                          text: ' *',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.redFF0004,
                          ),
                        ),
                      ]
                    : const [],
              ),
            ),
          );

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _internalController,
      builder: (context, value, _) {
        final List<Widget> suffixChildren = [];
        if (widget.suffix != null) suffixChildren.add(widget.suffix!);
        if (widget.maxLength != null) {
          suffixChildren.add(
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '${value.text.length}/${widget.maxLength}',
                style:
                    widget.textStyle ??
                    AppTypography.style(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey92929D,
                    ),
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
                  child: SizedBox(
                    // Chỉ set height cố định khi maxLines = 1, còn lại để tự động
                    // height: widget.maxLines == 1 ? 41 : null,
                    child: TextFormField(
                      onFieldSubmitted: widget.onFieldSubmitted,
                      textInputAction: widget.textInputAction,
                      focusNode: widget.focusNode,
                      controller: _internalController,
                      obscureText: widget.obscureText,
                      keyboardType: widget.keyboardType,
                      maxLines: widget.maxLines,
                      minLines: widget.maxLines > 1 ? widget.maxLines : null,
                      maxLength: widget.maxLength,
                      validator: _customValidator,
                      onChanged: (value) {
                        setState(() {
                          _errorText = null;
                        });
                        widget.onChanged?.call(value);
                      },
                      readOnly: widget.readOnly ?? false,
                      inputFormatters: widget.inputFormatters,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        filled: widget.isFilled ?? widget.readOnly ?? false,
                        fillColor:
                            widget.fillColor ??
                            (widget.readOnly ?? false ? AppColors.greyF2F4FA : null),
                        hintStyle:
                            widget.textStyle ??
                            AppTypography.style(
                              14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey92929D,
                            ),
                        // Ẩn counter mặc định (nằm dưới), thay bằng counter ở suffix
                        counterText: '',
                        errorMaxLines: 1,
                        errorStyle: AppTypography.style(0, lineHeight: 0),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: _errorText == null ? AppColors.greyE2E8F0 : Colors.red,
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                          borderSide: BorderSide(
                            color: _errorText == null ? AppColors.greyE2E8F0 : Colors.red,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                          borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                          borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
                        ),
                        suffixIcon: suffixChildren.isEmpty
                            ? null
                            : Row(mainAxisSize: MainAxisSize.min, children: suffixChildren),
                      ),
                      style:
                          widget.textStyle ??
                          AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                    ),
                  ),
                ),
                if (widget.trailingButton != null) widget.trailingButton!,
              ],
            ),
            // Custom error message với icon
            if (_errorText != null) ...[
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      _errorText!,
                      style: AppTypography.style(
                        12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.redFF0004,
                        lineHeight: 1.3,
                        textOverflow: TextOverflow.visible,
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
