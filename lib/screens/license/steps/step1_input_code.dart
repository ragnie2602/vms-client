import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/home/components/app_field.dart';

class Step1InputCode extends StatefulWidget {
  final Function(String)? onCallPreview;
  final VoidCallback? onCancel;
  final bool isLoading;

  const Step1InputCode({
    super.key,
    this.onCallPreview,
    this.onCancel,
    this.isLoading = false,
  });

  @override
  State<Step1InputCode> createState() => _Step1InputCodeState();
}

class _Step1InputCodeState extends State<Step1InputCode> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Kích hoạt gói dịch vụ',
          style: AppTypography.style(
            34,
            fontWeight: FontWeight.w700,
            color: AppColors.grey0F172A,
            letterSpacing: -0.6,
            lineHeight: 0.94,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Vui lòng nhập mã kích hoạt được cung cấp để tiếp tục sử dụng dịch vụ Cam AI.',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w500,
            lineHeight: 1.25,
            color: AppColors.grey334155,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: 600,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppField(
                  controller: _controller,
                  label: 'Mã kích hoạt hệ thống',
                  hintText: 'AAAA-BBBB-CCCC-DDDD',
                  paddingBottomLabel: 8,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập mã kích hoạt';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.blueE7F2FD,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.iconWarningCodeLicense,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Mỗi mã kích hoạt chỉ được sử dụng 1 lần duy nhất. Hãy đảm bảo bạn nhập chính xác các ký tự.',
                          maxLines: 2,
                          style: AppTypography.style(
                            13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blue006DDB,
                            lineHeight: 1.54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.onCancel != null) ...[
                      SizedBox(
                        height: 40,
                        child: AppButton.outline(
                          label: 'Hủy bỏ',
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          onPressed: widget.onCancel,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                    SizedBox(
                      height: 40,
                      child: AppButton.filled(
                        label: widget.isLoading ? '' : 'Kích hoạt',
                        backgroundColor: AppColors.blue005EB8,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        onPressed: widget.isLoading 
                            ? null 
                            : () {
                                if (_formKey.currentState?.validate() == true) {
                                  widget.onCallPreview?.call(_controller.text.trim());
                                }
                              },
                        child: widget.isLoading 
                            ? const SizedBox(
                                width: 20, 
                                height: 20, 
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
