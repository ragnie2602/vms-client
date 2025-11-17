import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_bloc.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_event.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_state.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/item_camera_widget.dart';

class ListCameraView extends StatefulWidget {
  const ListCameraView({super.key});

  @override
  State<ListCameraView> createState() => _ListCameraViewState();
}

class _ListCameraViewState extends State<ListCameraView> {
  @override
  void initState() {
    super.initState();
    _onGetListCamera();
  }

  void _onGetListCamera() {
    context.read<ScheduleBloc>().add(GetListCameraEvent());
  }

  void _onChangeCamera(CameraEntity camera) {
    context.read<ScheduleBloc>().add(ChangeCameraEvent(camera));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              top: 20,
              bottom: 10,
              right: 15,
              left: 15,
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.greyE2E8F0,
                filled: true,
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: SvgPicture.asset(AppAssets.icSearch),
                ),
                hintText: 'Tìm kiếm',
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
              onChanged: (value) {},
              onSubmitted: (value) {},
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Danh sách Camera',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                // nhét widget thẻ tag vô đây
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.greyF2F4FA),
          // list cam
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.maxHeight,
                  child: BlocBuilder<ScheduleBloc, ScheduleState>(
                    builder: (context, state) {
                      if (state is ScheduleLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ScheduleSuccessState) {
                        final List<CameraEntity>? _listCamera =
                            state.listCamera;
                        if ((_listCamera ?? []).isEmpty) {
                          return Center(
                            child: Text(
                              'Không có dữ liệu',
                              style: AppTypography.style(
                                13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final CameraEntity camera = _listCamera![index];
                              return ItemCameraWidget(
                                camera: camera,
                                isSelected: listEquals(
                                  camera.id,
                                  state.cameraSelected?.id,
                                ),
                                onClick: () => _onChangeCamera(camera),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount: (_listCamera ?? []).length,
                          );
                        }
                      } else {
                        return Center(child: Text('Xảy ra lỗi'));
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
