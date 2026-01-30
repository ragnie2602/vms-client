import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/ai_box/ai_box_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/dropdown_widget.dart';
import 'package:vms_flutter_client/screens/control_camera/widget/remove_camera_widget.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_bloc.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_event.dart';
import 'package:vms_flutter_client/screens/ai_box/bloc/ai_box_state.dart';
import 'package:vms_flutter_client/screens/ai_box/widgets/ai_box_title_widget.dart';
import 'package:vms_flutter_client/screens/ai_box/widgets/item_ai_box_widget.dart';

class AiBoxScreen extends StatefulWidget {
  const AiBoxScreen({super.key});

  @override
  State<AiBoxScreen> createState() => _AiBoxScreenState();
}

class _AiBoxScreenState extends State<AiBoxScreen> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _listAiBoxController = ScrollController();

  @override
  void initState() {
    _onGetListAiBox();
    super.initState();
  }

  @override
  void dispose() {
    _listAiBoxController.dispose();
    super.dispose();
  }

  void _onSearchAiBox({required String keyword}) {
    context.read<AiBoxBloc>().add(
      SearchAiBoxEvent(keyword: keyword.trim().toString()),
    );
  }

  void _onGetListAiBox() {
    context.read<AiBoxBloc>().add(GetListAiBoxEvent());
  }

  void _onDeleteAiBox({required int aiBoxId}) {
    context.read<AiBoxBloc>().add(DeleteAiBoxEvent(aiBoxId: aiBoxId));
  }

  void _addAiBox({
    required String name,
    String? ipAddress,
    String? description,
  }) {
    context.read<AiBoxBloc>().add(
      AddAiBoxEvent(name: name, ipAddress: ipAddress, description: description),
    );
  }

  void _editAiBox({
    required int aiBoxId,
    required String name,
    String? ipAddress,
    String? description,
  }) {
    context.read<AiBoxBloc>().add(
      EditAiBoxEvent(
        aiBoxId: aiBoxId,
        name: name,
        ipAddress: ipAddress,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiBoxBloc, AiBoxState>(
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
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () async {},
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
                                if (state.aiBoxes!.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'Không có kết quả phù hợp!',
                                      style: AppTypography.style(14),
                                    ),
                                  );
                                }
                                return Scrollbar(
                                  controller: _listAiBoxController,
                                  thumbVisibility: true,
                                  child: ListView.separated(
                                    controller: _listAiBoxController,
                                    primary: false,
                                    physics: ClampingScrollPhysics(),
                                    separatorBuilder: (_, __) => const Divider(
                                      height: 1,
                                      color: AppColors.greyF1F5F9,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: state.aiBoxes!.length,
                                    itemBuilder: (context, index) => ItemAiBoxWidget(
                                      itemAiBox: state.aiBoxes![index],
                                      index: index + 1,
                                      onDelete: () {
                                        showDialogRemoveCameraFromGroup(
                                          context,
                                          onConfirm: () {
                                            // _onDeleteAiBox(
                                            //   aiBoxId: state.aiBoxes![index].id,
                                            // );
                                          },
                                          title:
                                              "Bạn có chắc chắn muốn xóa AI Box này?",
                                        );
                                      },
                                      onEdit: () async {
                                        // _editAiBox(
                                        //   aiBoxId: state.aiBoxes![index].id,
                                        //   name:
                                        //       '${state.aiBoxes![index].name} (Edited)',
                                        //   ipAddress:
                                        //       state.aiBoxes![index].ipAddress,
                                        //   description:
                                        //       'Edited at ${DateTime.now()}',
                                        // );
                                      },
                                    ),
                                  ),
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
