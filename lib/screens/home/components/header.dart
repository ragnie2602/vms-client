import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../widgets/expandable_search_bar.dart';
import '../widgets/user_profile.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late final ValueNotifier<GoRouterState> _state;

  @override
  void initState() {
    _state = ValueNotifier(AppRouter.router.routerDelegate.state);
    AppRouter.router.routerDelegate.addListener(_onRouteChanged);
    super.initState();
  }

  @override
  void dispose() {
    AppRouter.router.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }

  void _onRouteChanged() {
    if (Routes.fromName(AppRouter.router.routerDelegate.state.name ?? '-') == null) return;
    _state.value = AppRouter.router.routerDelegate.state;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) => previous.themeMode != current.themeMode 
      || previous.displayFullScreenLiveView != current.displayFullScreenLiveView,
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
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _state,
                    builder: (context, state, child) {
                      return Row(
                        children: <Widget>[
                          _buildBackIcon(state),
                          Flexible(child: _buildPageTitle(state)),
                        ],
                      );
                    },
                  ),
                ),
        
                Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    ExpandableSearchBar(),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Badge.count(
                        count: 01,
                        padding: EdgeInsets.all(2),
                        backgroundColor: Color(0xFF21CCC3),
                        textStyle: AppTypography.style(
                          9,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(AppAssets.icBell, width: 20, height: 20),
                      ),
                    ),
                    SizedBox(width: 12),
                    UserProfile(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackIcon(GoRouterState state) {
    VoidCallback? onBack;
    if (state.extra is BaseScreenArgs && (state.extra as BaseScreenArgs).onBack != null) {
      onBack = (state.extra as BaseScreenArgs).onBack!;
    }

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

  Widget _buildPageTitle(GoRouterState state) {
    String title;
    if (state.extra is BaseScreenArgs && (state.extra as BaseScreenArgs).title != null) {
      title = (state.extra as BaseScreenArgs).title!;
    } else {
      title = Routes.fromName(state.name!)!.title;
    }

    String description;
    if (state.extra is BaseScreenArgs && (state.extra as BaseScreenArgs).description != null) {
      description = (state.extra as BaseScreenArgs).description!;
    } else {
      description = Routes.fromName(state.name!)!.description;
    }

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
