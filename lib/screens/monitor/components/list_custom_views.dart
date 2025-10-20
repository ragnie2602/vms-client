import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';

class ListCustomViews extends StatefulWidget {
  const ListCustomViews({super.key});

  @override
  State<ListCustomViews> createState() => _ListCustomViewsState();
}

class _ListCustomViewsState extends State<ListCustomViews> {
  final List<CustomLiveView> customViews = [];

  @override
  void initState() {
    super.initState();
    context.read<CustomViewBloc>().add(GetListCustomViews());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomViewBloc, CustomViewState>(
      listener: (context, state) {
        if (state is ListCustomViewSuccess) {
          setState(() {
            customViews.clear();
            customViews.addAll(state.customViews);
          });
        }
      },
      child: ListView.builder(
        itemCount: customViews.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SvgPicture.asset(customViews[index].base.icon, width: 32, height: 32),
                SizedBox(height: 32),
                Expanded(
                  child: Text(
                    customViews[index].name,
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
                IconButton(
                  constraints: BoxConstraints(minHeight: 32, minWidth: 32),
                  icon: SvgPicture.asset(AppAssets.icDotHorizontal, width: 12, height: 12),
                  onPressed: () {},
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 24),
      ),
    );
  }
}
