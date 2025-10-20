import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/shared/utils.dart';

class ListCustomViews extends StatefulWidget {
  const ListCustomViews({super.key});

  @override
  State<ListCustomViews> createState() => _ListCustomViewsState();
}

class _ListCustomViewsState extends State<ListCustomViews> {
  late final CustomViewBloc bloc;

  final List<CustomLiveView> customViews = [];

  @override
  void initState() {
    super.initState();

    bloc = context.read<CustomViewBloc>()..add(GetListCustomViews());
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
        } else if (state is DeleteCustomViewSuccess) {
          setState(() => customViews.removeWhere((cv) => Utils.isEqual(cv.id, state.id)));
        }
      },
      child: ListView.builder(
        itemBuilder: (context, index) => CustomViewItem(bloc: bloc, customView: customViews[index]),
        itemCount: customViews.length,
        shrinkWrap: true,
      ),
    );
  }
}

class CustomViewItem extends StatefulWidget {
  final CustomLiveView customView;
  final CustomViewBloc bloc;

  const CustomViewItem({super.key, required this.customView, required this.bloc});

  @override
  State<CustomViewItem> createState() => _CustomViewItemState();
}

class _CustomViewItemState extends State<CustomViewItem> {
  bool isSelecting = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomViewBloc, CustomViewState>(
      listener: (context, state) {
        if (state is ShowCustomViewSuccess) {
          if (!isSelecting && widget.customView.id == state.customView.id) {
            setState(() => isSelecting = true);
          } else if (isSelecting && widget.customView.id != state.customView.id) {
            setState(() => isSelecting = false);
          }
        }
      },
      child: Material(
        child: InkWell(
          onTap: () {
            if (GoRouterState.of(context).name != Routes.custom_live_view.name) {
              context.goNamed(Routes.custom_live_view.name);
            }
            widget.bloc.add(ShowCustomView(widget.customView));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox(width: 24),
                SvgPicture.asset(
                  isSelecting ? widget.customView.base.iconActive : widget.customView.base.icon,
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.customView.name,
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Builder(
                  builder: (context) => SizedBox(
                    height: 32,
                    width: 32,
                    child: InkWell(
                      onTapDown: (TapDownDetails details) =>
                          showActionsPopup(context, widget.customView),
                      child: Center(
                        child: SvgPicture.asset(AppAssets.icDotHorizontal, width: 12, height: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showActionsPopup(BuildContext context, CustomLiveView customView) {
    showPopover(
      arrowHeight: 4,
      arrowWidth: 7,
      barrierColor: Colors.transparent,
      bodyBuilder: (context) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyF2F4FA, width: 1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: AppColors.blackOrWhite.withOpacity(0.1),
              offset: Offset(0, 4),
            ),
          ],
          color: AppColors.blackOrWhiteReverse,
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(bottom: 10, left: 12, right: 16, top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppAssets.icEdit),
                      SizedBox(width: 8),
                      Text(
                        'Sửa',
                        style: AppTypography.style(
                          13,
                          color: AppColors.blackOrWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  showDeleteDialog(context, customView);
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10, left: 12, right: 16, top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppAssets.icDelete),
                      SizedBox(width: 8),
                      Text(
                        'Xóa',
                        style: AppTypography.style(
                          13,
                          color: AppColors.blackOrWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }

  showDeleteDialog(BuildContext context, CustomLiveView customView) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.icDeleteLight, height: 60, width: 60),
                  const SizedBox(height: 28),
                  Text(
                    'Bạn chắc chắn muốn xoá',
                    style: AppTypography.style(
                      14,
                      color: AppColors.blackOrWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    customView.name,
                    style: AppTypography.style(
                      14,
                      color: AppColors.blackOrWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 130.5 / 1600,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blackOrWhiteReverse,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                            side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
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
                          onPressed: () => widget.bloc.add(DeleteCustomLiveView(customView.id)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blackOrWhite,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                          ),
                          child: BlocConsumer<CustomViewBloc, CustomViewState>(
                            bloc: widget.bloc,
                            listener: (context, state) {
                              if (state is DeleteCustomViewSuccess) Navigator.pop(context);
                            },
                            builder: (context, state) {
                              if (state is DeletingCustomView) return CircularProgressIndicator();
                              return Text(
                                'Xóa',
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackOrWhiteReverse,
                                ),
                              );
                            },
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
