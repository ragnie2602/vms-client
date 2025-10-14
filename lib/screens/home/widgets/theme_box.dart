import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/common_extensions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ThemeBox extends StatelessWidget {
  const ThemeBox({
    super.key,
    required this.maxWidth,
    this.expandedPadding = EdgeInsets.zero,
    this.collapsedPadding = EdgeInsets.zero,
  });
  final double maxWidth;
  final EdgeInsetsGeometry expandedPadding;
  final EdgeInsetsGeometry collapsedPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isExpanded = constraints.maxWidth >= maxWidth;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: isExpanded ? expandedPadding : collapsedPadding,
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.scaffoldBg,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            /*  */
            if (isExpanded) ...[
              const SizedBox(height: 12),
              Padding(
                padding: expandedPadding,
                child: Text(
                  'Giao diện',
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackOrWhite,
                  ),
                ),
              ),
            ],

            /*  */
            const SizedBox(height: 12),
            Container(
              height: 36,
              margin: isExpanded ? expandedPadding : collapsedPadding,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBg,
                borderRadius: BorderRadius.circular(40),
              ),
              child: isExpanded
                  ? DefaultTabController(
                      length: 2,
                      initialIndex: context.isDarkMode ? 1 : 0,
                      child: TabBar(
                        onTap: (value) => context.read<AppBloc>().add(
                          ChangeTheme(value == 0 ? ThemeMode.light : ThemeMode.dark),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColors.blackOrWhiteReverse,
                        ),
                        labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        labelColor: AppColors.blackOrWhite,
                        unselectedLabelColor: Color(0xFF6F767E),
                        labelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
                        unselectedLabelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
                        tabs: [
                          _buildThemeItem(title: 'Sáng', svg: AppAssets.icLightMode),
                          _buildThemeItem(title: 'Tối', svg: AppAssets.icDarkMode),
                        ],
                      ),
                    )
                  : _buildAdaptiveTheme(context),
            ),

            const SizedBox(height: 43),
          ],
        );
      },
    );
  }

  Widget _buildAdaptiveTheme(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AppBloc>().add(
        ChangeTheme(context.isDarkMode ? ThemeMode.light : ThemeMode.dark),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: AppColors.blackOrWhiteReverse,
        ),
        padding: EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.center,
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) => SvgPicture.asset(
            state.themeMode == ThemeMode.light ? AppAssets.icLightMode : AppAssets.icDarkMode,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(AppColors.blackOrWhite, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeItem({required String title, required String svg}) {
    return Builder(
      builder: (context) => Row(
        children: [
          SvgPicture.asset(
            svg,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              IconTheme.of(context).color ?? Colors.transparent,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
