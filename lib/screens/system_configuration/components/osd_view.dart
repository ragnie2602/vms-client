import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/osd.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/osd_util.dart';

class OsdView extends StatefulWidget {
  const OsdView({super.key});

  @override
  State<OsdView> createState() => _OsdViewState();
}

class _OsdViewState extends State<OsdView> {
  late OSDPosition _position;

  bool hasChange = false;

  @override
  void initState() {
    super.initState();
    _position = OsdUtil.getOSDPositions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cài đặt OSD",
            style: AppTypography.style(
              16,
              fontWeight: FontWeight.w700,
              color: AppColors.grey0F172A,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.widthOf(context) * 565 / 1600),
            child: Row(
              children: [
                Expanded(
                  flex: 168,
                  child: Text(
                    'Vị trí hiển thị',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black0D0D0D,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 384,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: AppColors.greyE2E8F0, width: 1),
                    ),
                    child: DropdownButton(
                      dropdownColor: AppColors.white,
                      icon: SvgPicture.asset(
                        AppAssets.icArrowChevronDown,
                        color: AppColors.grey94A3B8,
                      ),
                      isDense: true,
                      isExpanded: true,
                      items: OSDPosition.values
                          .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                          .toList(),
                      onChanged: (value) => setState(() {
                        _position = value!;
                        hasChange = true;
                      }),
                      padding: const EdgeInsets.all(12),
                      style: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      underline: Container(),
                      value: _position,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          if (hasChange)
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.widthOf(context) * 565 / 1600),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => setState(() {
                        hasChange = false;
                        _position = OsdUtil.getOSDPositions();
                      }),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Text(
                          'Hủy',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() {
                        hasChange = false;
                        OsdUtil.saveOSDPositions(_position);
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: AppColors.secondary, width: 1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Text(
                          'Lưu',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
