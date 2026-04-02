import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/notification_bell.dart';

import '../bloc/home_bloc.dart';
import '../widgets/user_profile.dart';

class Header extends StatefulWidget {
  final String? currentPath;
  const Header({super.key, this.currentPath});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    _onRouteChanged();
    AppRouter.router.routerDelegate.addListener(_onRouteChanged);
    super.initState();
  }

  @override
  void dispose() {
    AppRouter.router.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }

  void _onRouteChanged() {
    final route = Routes.fromName(AppRouter.router.routerDelegate.state.name ?? '-');
    if (route == null) return;

    VoidCallback? onBack;
    String title = route.title;
    String description = route.description;

    AppRouter.router.routerDelegate.state.extra.let((extra) {
      if (extra is BaseScreenArgs) {
        onBack = extra.onBack;
        title = extra.title ?? title;
        description = extra.description ?? description;
      }
    });

    context.read<HomeBloc>().add(
      ChangePageInfo(title: title, description: description, onBack: onBack),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) =>
          previous.themeMode != current.themeMode ||
          previous.displayFullScreenLiveView != current.displayFullScreenLiveView,
      listener: (context, state) => setState(() {}),
      child: Visibility(
        visible: !context.read<AppBloc>().state.displayFullScreenLiveView,
        child: Container(
          height: AppConfig.APP_BAR_HEIGHT,
          width: double.infinity,
          color: AppColors.contentBg,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                if (widget.currentPath == Routes.onboarding.path) ...[
                  SvgPicture.asset(AppAssets.logoFull, height: 32), // Adjust height if needed
                  const SizedBox(width: 24),
                ],
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (pre, cur) =>
                        pre.onBack != cur.onBack ||
                        pre.pageTitle != cur.pageTitle ||
                        pre.pageDescription != cur.pageDescription,
                    builder: (context, state) {
                      return Row(
                        children: <Widget>[
                          _buildBackIcon(state.onBack),
                          Flexible(child: _buildPageTitle(state.pageTitle, state.pageDescription)),
                        ],
                      );
                    },
                  ),
                ),

                Row(spacing: 12, children: <Widget>[NotificationBell(), UserProfile()]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackIcon(void Function()? onBack) {
    return onBack != null || context.canPop()
        ? InkWell(
            onTap: onBack ?? () => context.pop(),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(AppAssets.icArrowLeft),
            ),
          )
        : SizedBox.shrink();
  }

  Widget _buildPageTitle(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (title.isNotEmpty)
          Text(
            title,
            style: AppTypography.style(
              20,
              fontWeight: FontWeight.w600,
              color: AppColors.blackOrWhite,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        if (description.isNotEmpty) ...[
          SizedBox(height: 4),
          Text(
            description,
            style: AppTypography.style(12, fontWeight: FontWeight.w400, color: Color(0xFF92929D)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
