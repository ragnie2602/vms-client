import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/osd.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/osd_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/osd/osd_bloc.dart';

class OsdView extends StatefulWidget {
  const OsdView({super.key});

  @override
  State<OsdView> createState() => _OsdViewState();
}

class _OsdViewState extends State<OsdView> {
  late final OsdBloc _osdBloc = context.read();

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
                    child: DropdownMenu<OSDPosition>(
                      dropdownMenuEntries: OSDPosition.values
                          .map(
                            (pos) => DropdownMenuEntry(
                              value: pos,
                              label: pos.name,
                              style: ButtonStyle(
                                textStyle: MaterialStatePropertyAll(
                                  AppTypography.style(
                                    14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      enableFilter: false,
                      enableSearch: false,
                      initialSelection: _position,
                      inputDecorationTheme: InputDecorationTheme(
                        border: InputBorder.none,
                        constraints: BoxConstraints.tightFor(
                          height: MediaQuery.heightOf(context) * 41 / 900,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        isDense: true,
                      ),
                      menuStyle: const MenuStyle(
                        alignment: AlignmentDirectional.bottomStart, // top menu = bottom field
                        backgroundColor: MaterialStatePropertyAll<Color>(AppColors.white),
                        padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                      ),
                      onSelected: (value) => setState(() {
                        _position = value!;
                        hasChange = true;
                      }),
                      requestFocusOnTap: false,
                      textInputAction: TextInputAction.none,
                      textStyle: AppTypography.style(
                        14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      trailingIcon: SvgPicture.asset(
                        AppAssets.icArrowChevronDown,
                        colorFilter: const ColorFilter.mode(AppColors.grey94A3B8, BlendMode.srcIn),
                      ),
                      selectedTrailingIcon: SvgPicture.asset(
                        AppAssets.icArrowChevronUp,
                        colorFilter: const ColorFilter.mode(AppColors.grey94A3B8, BlendMode.srcIn),
                      ),
                      width: double.infinity,
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
                        _osdBloc.add(NotifyOSDPosition(_position));
                        ToastUtil.toastSuccess(title: Text('Cài đặt OSD thành công!'));
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
