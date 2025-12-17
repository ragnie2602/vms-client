import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';

class SetupInfoFieldDialog extends StatefulWidget {
  const SetupInfoFieldDialog({super.key});

  @override
  State<SetupInfoFieldDialog> createState() => _SetupInfoFieldDialogState();
}

class _SetupInfoFieldDialogState extends State<SetupInfoFieldDialog> {
  int info = 15;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Cài đặt các thông tin hiển thị',
                    style: AppTypography.style(20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => setState(() => info = info ^ 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IgnorePointer(
                          child: Checkbox(value: info & 8 == 8, onChanged: (value) {}),
                        ),
                        Text('Loại sự kiện'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => info = info ^ 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IgnorePointer(
                          child: Checkbox(value: info & 4 == 4, onChanged: (value) {}),
                        ),
                        Text('Thời gian'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => info = info ^ 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IgnorePointer(
                          child: Checkbox(value: info & 2 == 2, onChanged: (value) {}),
                        ),
                        Text('Thiết bị'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => info = info ^ 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IgnorePointer(
                          child: Checkbox(value: info & 1 == 1, onChanged: (value) {}),
                        ),
                        Text('Vị trí'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: EventCustomButton(label: 'Lưu', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
