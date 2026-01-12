import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';
import 'package:vms_flutter_client/screens/group/widget/confirm_remove_view.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_event.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';
import 'package:vms_flutter_client/screens/map/widgets/add_map_dialog.dart';
import 'package:vms_flutter_client/screens/map/widgets/item_map_action.dart';

class ListMapView extends StatefulWidget {
  final ValueNotifier<EmapEntity?> selectedEmap;

  const ListMapView({super.key, required this.selectedEmap});

  @override
  State<ListMapView> createState() => _ListMapViewState();
}

class _ListMapViewState extends State<ListMapView> {
  final List<EmapEntity> listEmap = [];
  int? _selectedId;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EmapBloc>().add(GetListEmapEvent());
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
                    controller: _searchController,
                    decoration: InputDecoration(
                      fillColor: AppColors.greyE2E8F0,
                      filled: true,
                      prefixIcon: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        child: SvgPicture.asset(AppAssets.icSearch),
                      ),
                      hintText: 'Nhập tên bản đồ',
                      hintStyle: AppTypography.style(
                        14,
                        color: AppColors.grey64748B,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (value) => context.read<EmapBloc>().add(
                      SearchEmapEvent(keyword: value, listEmap: listEmap),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () async {
                    await showAddMapDialog(
                      context,
                      onSubmit: (payload) async {
                        if (payload.imageFile == null) return;

                        context.read<EmapBloc>().add(
                          AddEmapEvent(emapName: payload.name, imageFile: payload.imageFile!),
                        );
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
            child: BlocConsumer<EmapBloc, EmapState>(
              listener: (BuildContext context, EmapState state) {
                void _updateEmap(EmapEntity map) {
                  final idx = listEmap.indexWhere((element) => element.id == map.id);
                  if (idx != -1) listEmap[idx] = map;
                  if (widget.selectedEmap.value?.id == map.id) widget.selectedEmap.value = map;
                }

                if (state is AddEmapSuccessState) {
                  listEmap.add(state.emap);

                  _searchController.text = '';

                  ToastUtil.toastSuccess(
                    context: context,
                    title: Text('Thêm bản đồ camera thành công!'),
                  );
                } else if (state is EditEmapSuccessState) {
                  _updateEmap(state.emap);

                  _searchController.text = '';

                  ToastUtil.toastSuccess(
                    context: context,
                    title: Text('Cập nhật bản đồ camera thành công!'),
                  );
                } else if (state is EmapSuccessState) {
                  listEmap.clear();
                  listEmap.addAll(state.listEmap);

                  _selectedId ??= listEmap.firstOrNull?.id;
                  widget.selectedEmap.value = listEmap.firstOrNull;
                } else if (state is RemoveEmapSucessSate) {
                  listEmap.removeWhere((element) => element.id == state.id);
                  if (state.id == widget.selectedEmap.value?.id) widget.selectedEmap.value = null;

                  _searchController.text = '';

                  ToastUtil.toastSuccess(context: context, title: Text('Xóa thành công'));
                }
              },
              builder: (context, state) {
                if (state is EmapLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                List<EmapEntity> _emaps = listEmap;
                if (state is SearchEmapSuccessState) {
                  _emaps = state.listEmap;
                  if (_emaps.isEmpty) return Center(child: Text('Không có dữ liệu'));
                }

                return ListView.separated(
                  itemCount: _emaps.length,
                  itemBuilder: (context, index) {
                    final item = _emaps[index];
                    return InkWell(
                      onTap: () => _onChangeSelectEmap(newMap: item),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: item.id == _selectedId ? AppColors.greyF2F4FA : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppAssets.icMarkerMap),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.name,
                                style: AppTypography.style(
                                  13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            PopupMenuButton<ItemMapAction>(
                              tooltip: '',
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              menuPadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(8),
                              ),
                              elevation: 8,
                              onSelected: (value) async {
                                switch (value) {
                                  case ItemMapAction.edit:
                                    _onChangeSelectEmap(newMap: item);
                                    await _onShowDialogEditEmap(contextEdit: context, emap: item);
                                    break;
                                  case ItemMapAction.remove:
                                    showConfirmRemoveDialog(
                                      context,
                                      contentWidget: Text(
                                        'bản đồ camera này?',
                                        style: AppTypography.style(
                                          14,
                                          color: AppColors.blackOrWhite,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onClickRemove: () => context.read<EmapBloc>().add(
                                        RemoveEmapEvent(emapId: item.id),
                                      ),
                                    );
                                    break;
                                }
                              },
                              itemBuilder: (context) {
                                var listAction = ItemMapAction.values;
                                List<PopupMenuEntry<ItemMapAction>> entries = [];
                                for (int i = 0; i < listAction.length; i++) {
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
                                colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onChangeSelectEmap({required EmapEntity? newMap}) {
    widget.selectedEmap.value = newMap;
    setState(() => _selectedId = newMap?.id);
  }

  Future _onShowDialogEditEmap({
    required BuildContext contextEdit,
    required EmapEntity emap,
  }) async {
    await showAddMapDialog(
      context,
      emapName: emap.name,
      backgroundPath: emap.imageUrl,
      onSubmit: (payload) async => context.read<EmapBloc>().add(
        EditEmapEvent(emapId: emap.id, emapName: payload.name, imageFile: payload.imageFile),
      ),
    );
  }
}

class _ItemActionWidget extends StatelessWidget {
  const _ItemActionWidget({required this.item});
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
          style: AppTypography.style(13, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ],
    );
  }
}
