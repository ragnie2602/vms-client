import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';
import 'package:vms_flutter_client/screens/group/widget/confirm_remove_view.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/widgets/add_map_dialog.dart';
import 'package:vms_flutter_client/screens/map/widgets/item_map_action.dart';

class ListMapView extends StatefulWidget {
  const ListMapView({super.key});

  @override
  State<ListMapView> createState() => _ListMapViewState();
}

class _ListMapViewState extends State<ListMapView> {
  @override
  void initState() {
    super.initState();
    _onGetListEmap();
  }

  void _onGetListEmap() {
    context.read<EmapBloc>().add(GetListEmapEvent());
  }

  void _onChangeSelectEmap({required EmapInforEntity? newMap}) {
    context.read<EmapBloc>().add(ChangeEmapEvent(emap: newMap));
  }

  void _onRemoveEmap({List<int>? emapId}) {
    context.read<EmapBloc>().add(RemoveEmapEvent(emapId: emapId));
  }

  void _onShowDialogRemoveEmap(
    BuildContext contextRemove, {
    List<int>? emapId,
  }) {
    showConfirmRemoveDialog(
      contextRemove,
      contentWidget: Text(
        'bản đồ camera này?',
        style: AppTypography.style(
          14,
          color: AppColors.blackOrWhite,
          fontWeight: FontWeight.w500,
        ),
      ),
      onClickRemove: () {
      
        // xóa
        _onRemoveEmap(emapId: emapId);
      },
    );
  }

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
                const SizedBox(width: 16),
                InkWell(
                  onTap: () async {
                    await showAddMapDialog(
                      context,
                      onSubmit: (payload) async {
                        // Xử lý submit với:
                        // payload.name - tên bản đồ
                        // payload.imageFile - file ảnh đã chọn
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.secondary,
                    ),
                    child: SvgPicture.asset(AppAssets.icPlus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                height: constraints.maxHeight,
                child: BlocConsumer<EmapBloc, EmapState>(
                  listener: (BuildContext context, EmapState state) {
                    if (state is RemoveEmapSucessSate) {
                      ToastUtil.toastSuccess(
                        context: context,
                        title: Text('Xóa thành công '),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is EmapLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is EmapSuccessState) {
                      final listEmap = state.listEmap ?? [];
                      return ListView.separated(
                        itemCount: listEmap.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = listEmap[index];
                          return InkWell(
                            onTap: () {
                              _onChangeSelectEmap(newMap: item);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: item == state.emapSelected
                                    ? AppColors.greyF2F4FA
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppAssets.icMarkerMap),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.emapName ?? 'N/A',
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
                                      borderRadius:
                                          BorderRadiusGeometry.circular(8),
                                    ),
                                    elevation: 8,
                                    onSelected: (value) {
                                      // focus map mới
                                      _onChangeSelectEmap(newMap: item);
                                      // handle case sửa/ xóa
                                      switch (value) {
                                        case ItemMapAction.edit:
                                          break;
                                        case ItemMapAction.remove:
                                          // _onRemoveEmap(emapId: item.emapId);
                                          _onShowDialogRemoveEmap(
                                            context,
                                            emapId: item.emapId,
                                          );
                                          break;
                                      }
                                    },
                                    itemBuilder: (context) {
                                      var listAction = ItemMapAction.values;
                                      List<PopupMenuEntry<ItemMapAction>>
                                      entries = [];
                                      for (
                                        int i = 0;
                                        i < listAction.length;
                                        i++
                                      ) {
                                        final e = listAction[i];
                                        entries.add(
                                          PopupMenuItem<ItemMapAction>(
                                            value: e,
                                            child: _ItemActionWidget(item: e),
                                          ),
                                        );
                                        // thêm divider
                                        if (i != listAction.length - 1) {
                                          entries.add(
                                            const PopupMenuDivider(
                                              height: 1,
                                              color: AppColors.greyF2F4FA,
                                            ),
                                          );
                                        }
                                      }
                                      return entries;
                                    },
                                    child: SvgPicture.asset(
                                      AppAssets.icAction,
                                      width: 20,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.black,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                      );
                    }
                    return SizedBox();
                  },
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
