import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/map/widgets/item_map_action.dart';

class ListMapView extends StatelessWidget {
  const ListMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: AppColors.greyE2E8F0,
                      filled: true,
                      prefixIcon: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        child: SvgPicture.asset(AppAssets.icSearch),
                      ),
                      hintText: 'Nhập tên bản đồ',
                      hintStyle: AppTypography.style(
                        14,
                        color: AppColors.grey64748B,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyE2E8F0,
                          width: 1,
                        ),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColors.secondary),
                    ),
                    child: Center(child: SvgPicture.asset(AppAssets.icAdd)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                height: constraints.maxHeight,
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (_, __) {
                    return InkWell(
                      onTap: () {
                        // thêm action
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.icMarkerMap),
                          const SizedBox(width: 8),
                          Text(
                            '115 Trần Duy Hưng',
                            style: AppTypography.style(
                              13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          PopupMenuButton<ItemMapAction>(
                            padding: EdgeInsets.zero,
                            splashRadius: 20,
                            menuPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                            elevation: 8,
                            itemBuilder: (context) {
                              var listAction = ItemMapAction.values;
                              return listAction
                                  .map(
                                    (e) => PopupMenuItem<ItemMapAction>(
                                      value: e,
                                      child: _ItemActionWidget(item: e),
                                    ),
                                  )
                                  .toList();
                            },
                            child: SvgPicture.asset(
                              AppAssets.icAction,
                              width: 15,
                              colorFilter: ColorFilter.mode(
                                AppColors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemActionWidget extends StatelessWidget {
  const _ItemActionWidget({super.key, required this.item});
  final ItemMapAction item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(right: 8),
          child: Center(child: SvgPicture.asset(item.getIcon)),
        ),
        Text(
          item.getName,
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
