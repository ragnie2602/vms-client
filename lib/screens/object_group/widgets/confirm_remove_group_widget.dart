import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class RemoveGroupObjectDialog extends StatelessWidget {
  const RemoveGroupObjectDialog({
    super.key,
    this.onConfirm,
    this.groupName,
    this.hasChildren,
  });
  final Function()? onConfirm;
  final String? groupName;
  final bool? hasChildren;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.35,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.icRemoveAiBox,
                    height: 88,
                    width: 88,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Xóa nhóm đối tượng',
                    style: AppTypography.style(
                      18,
                      color: AppColors.grey34404b,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final name =
                          groupName ?? (hasChildren == true ? 'Nhóm' : 'nhóm');
                      final nameStyle = AppTypography.style(
                        16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        lineHeight: 1.5,
                      );
                      final suffixStyle = AppTypography.style(
                        16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        lineHeight: 1.5,
                      );

                      // Tính số dong của tên nhóm
                      final painter = TextPainter(
                        text: TextSpan(text: name, style: nameStyle),
                        maxLines: null,
                        textDirection: TextDirection.ltr,
                      )..layout(maxWidth: constraints.maxWidth);
                      final nameLineCount = painter.computeLineMetrics().length;
                      final nameTooLong = nameLineCount > 2;

                      if (nameTooLong) {
                        // case tên dài -> hiển thị thành 3 dòng
                        return Column(
                          children: [
                            hasChildren != true
                                ? Text(
                                    hasChildren != true
                                        ? 'Bạn có chắc chắn muốn xóa '
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: suffixStyle,
                                  )
                                : const SizedBox(),
                            Text(
                              name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: nameStyle,
                            ),
                            hasChildren == true
                                ? Text(
                                    hasChildren == true
                                        ? 'đang chứa dữ liệu đối tượng/nhóm con.\nBạn có chắc chắn muốn xóa?'
                                        : '',
                                    textAlign: TextAlign.center,
                                    style: suffixStyle,
                                  )
                                : const SizedBox(),
                          ],
                        );
                      }

                      // Name is short → inline Text.rich
                      if (hasChildren == true) {
                        return Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: name, style: nameStyle),
                              TextSpan(
                                text:
                                    ' đang chứa dữ liệu đối tượng/nhóm con.\nBạn có chắc chắn muốn xóa?',
                                style: suffixStyle,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bạn có chắc chắn muốn xóa ',
                                style: suffixStyle,
                              ),
                              TextSpan(text: name, style: nameStyle),
                              TextSpan(text: ' ?', style: suffixStyle),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 130.5 / 1600,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            side: BorderSide(
                              color: AppColors.greyE2E8F0,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Hủy',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackOrWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 130.5 / 1600,
                        child: ElevatedButton(
                          onPressed: () {
                            //
                            Navigator.pop(context);
                            onConfirm?.call();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: Text(
                            'Đồng ý',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackOrWhiteReverse,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
