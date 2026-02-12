import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/base_view.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_bloc.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_state.dart';
import 'package:vms_flutter_client/screens/ai_box/widgets/ai_box_dialog.dart';
import 'package:vms_flutter_client/screens/ai_box/widgets/ai_box_title_widget.dart';
import 'package:vms_flutter_client/screens/ai_box/widgets/item_ai_box_widget.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dropdown_widget.dart';
import 'package:vms_flutter_client/screens/ai_box/components/ai_box_pagination_bar.dart';

class AiBoxView extends BaseView<AiBoxBloc> {
  final AiBoxBloc _bloc;
  final TextEditingController searchController;
  final ScrollController listController;

  const AiBoxView({
    super.key,
    required AiBoxBloc bloc,
    required this.searchController,
    required this.listController,
  }) : _bloc = bloc;

  @override
  AiBoxBloc bloc(BuildContext context) => _bloc;

  void _onSearchAiBox({String? keyword, AiBoxStatus? statusFilter}) {
    _bloc.add(FilterAiBoxEvent(keyword: keyword, statusFilter: statusFilter));
  }

  void _onGetListAiBox() {
    _bloc.add(GetListAiBoxEvent());
  }

  void _onDeleteAiBox({required AiBoxEntity aiBox}) {
    _bloc.add(DeleteAiBoxEvent(aiBox: aiBox));
  }

  void _addAiBox({required AiBoxEntity aiBox}) {
    _bloc.add(AddAiBoxEvent(aiBox: aiBox));
  }

  void _editAiBox({required int aiBoxId, required AiBoxEntity aiBox}) {
    _bloc.add(EditAiBoxEvent(aiBoxId: aiBoxId, aiBox: aiBox));
  }

  void checkEnableRemove(BuildContext context, {required AiBoxEntity? aiBox}) {
    // đang quản lý camera thì không cho xóa
    if ((aiBox?.numberCameraUsed ?? 0) > 0) {
      ToastUtil.toastFail(
        context: context,
        title: Text(
          'Không thể xóa ${aiBox?.name ?? ''} do đang quản lý ${aiBox?.numberCameraUsed ?? 0} camera',
        ),
      );
      return;
    }
    showConfirmRemoveAiBoxDialog(
      context,
      onConfirm: () {
        if (aiBox == null || aiBox.id == null) return;
        _onDeleteAiBox(aiBox: aiBox);
      },
      name: aiBox?.name,
    );
    return;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<AiBoxBloc, AiBoxState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is AiBoxAddSuccessState) {
          ToastUtil.toastSuccess(
            context: context,
            title: Text('Thêm mới thiết bị thành công'),
          );
        }
        if (state is AiBoxAddFailState) {
          ToastUtil.toastFail(
            context: context,
            title: Text(state.errorMessage),
          );
        }
        if (state is AiBoxDeleteSuccessState) {
          ToastUtil.toastSuccess(
            context: context,
            title: Text('Xóa thiết bị ${state.aiBoxName} thành công!'),
          );
        }
        if (state is AiBoxDeleteFailState) {
          ToastUtil.toastFail(
            context: context,
            title: Text(state.errorMessage),
          );
        }
        if (state is AiBoxEditSuccessState) {
          ToastUtil.toastSuccess(
            context: context,
            title: Text('Cập nhật AI Box thành công'),
          );
        }
        if (state is AiBoxEditFailState) {
          ToastUtil.toastFail(
            context: context,
            title: Text(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 4,
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            onChanged: (value) {
                              _onSearchAiBox(keyword: value);
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                child: SvgPicture.asset(AppAssets.icSearch),
                              ),
                              hintText:
                                  'Tìm kiếm theo tên thiết bị, tên model, địa chỉ IP/Port',
                              hintStyle: AppTypography.style(
                                14,
                                color: AppColors.grey64748B,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: AppColors.greyE2E8F0,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: AppColors.greyE2E8F0,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: AppColors.greyE2E8F0,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        flex: 1,
                        child: CustomCommonDropdown<AiBoxStatus>(
                          items: AiBoxStatus.values,
                          value: AiBoxStatus.all,
                          height: 40,
                          itemAsString: (p0) => p0.displayName,
                          onChanged: (value) {
                            _onSearchAiBox(
                              keyword: searchController.text,
                              statusFilter: value,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () async {
                          await showAddAiBoxDialog(
                            context,
                            onConfirm: (payload) async {
                              _addAiBox(aiBox: payload);
                            },
                          );
                        },
                        splashColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.secondary,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.icAdd,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Thêm AI Box',
                                  style: AppTypography.style(
                                    14,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AiBoxTitleWidget(),
                    const SizedBox(height: 16),
                    state is AiBoxLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : state is AiBoxErrorState
                        ? Flexible(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    state.errorMessage,
                                    style: AppTypography.style(
                                      14,
                                      color: AppColors.grey64748B,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    onPressed: _onGetListAiBox,
                                    icon: const Icon(Icons.refresh),
                                    label: const Text('Thử lại'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondary,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : state is AIBoxLoadedState
                        ? Flexible(
                            child: Builder(
                              builder: (BuildContext context) {
                                final displayList =
                                    state.paginatedAiBoxes ?? [];

                                if (displayList.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'Không có kết quả phù hợp!',
                                      style: AppTypography.style(14),
                                    ),
                                  );
                                }

                                return Column(
                                  children: [
                                    Expanded(
                                      child: Scrollbar(
                                        controller: listController,
                                        thumbVisibility: true,
                                        child: ListView.separated(
                                          controller: listController,
                                          primary: false,
                                          physics: ClampingScrollPhysics(),
                                          separatorBuilder: (_, __) =>
                                              const Divider(
                                                height: 1,
                                                color: AppColors.greyF1F5F9,
                                              ),
                                          shrinkWrap: true,
                                          itemCount: displayList.length,
                                          itemBuilder: (context, index) {
                                            final globalIndex =
                                                (state.page - 1) *
                                                    state.pageSize +
                                                index;
                                            return AiBoxItemWidget(
                                              itemAiBox: displayList[index],
                                              index: globalIndex + 1,
                                              onDelete: () {
                                                checkEnableRemove(
                                                  context,
                                                  aiBox: displayList[index],
                                                );
                                              },
                                              onEdit: () {
                                                final aiBoxId =
                                                    displayList[index].id;
                                                if (aiBoxId != null) {
                                                  showAddAiBoxDialog(
                                                    context,
                                                    type: AiBoxDialogType.edit,
                                                    aiBoxId: aiBoxId,
                                                    onConfirm: (payload) async {
                                                      _editAiBox(
                                                        aiBoxId: aiBoxId,
                                                        aiBox: payload,
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    if (state.totalCount > state.pageSize &&
                                        state.aiBoxes != null &&
                                        state.aiBoxes!.isNotEmpty) ...[
                                      const SizedBox(height: 16),
                                      AiBoxPaginationBar(
                                        totalItems: state.totalCount,
                                        currentPage: state.page,
                                        pageSize: state.pageSize,
                                        onPageChanged: (page) {
                                          _bloc.add(GetAiBoxAtPage(page));
                                        },
                                      ),
                                    ],
                                  ],
                                );
                              },
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
