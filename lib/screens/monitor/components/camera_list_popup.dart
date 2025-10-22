import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';

class CameraListPopup extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final MonitorBloc bloc;
  final Function(CameraEntity) onCameraSelected;

  CameraListPopup({super.key, required this.bloc, required this.onCameraSelected}) {
    bloc.add(GetAllCamera());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.widthOf(context) * 281 / 1600,
        maxHeight: MediaQuery.heightOf(context) * 515 / 900,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: AppColors.grey92929D.withValues(alpha: 0.1),
            offset: Offset(0, 10),
          ),
        ],
        color: AppColors.blackOrWhiteReverse,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, size: 20),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Tìm kiếm',
                hintStyle: AppTypography.style(
                  14,
                  color: Color(0xFF8F95B2),
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(3),
                ),
                prefixIcon: Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 16, left: 12),
                  child: SvgPicture.asset(AppAssets.icSearch),
                ),
                prefixIconConstraints: BoxConstraints.tight(Size(20 + 16 + 12, 20)),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: searchController,
                  builder: (context, value, child) => value.text.isEmpty
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () => searchController.clear(),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(AppAssets.icClose),
                          ),
                        ),
                ),
                fillColor: Color(0xFFF2F4FA),
                filled: true,
              ),
              keyboardType: TextInputType.text,
              style: AppTypography.style(14, fontWeight: FontWeight.w400),
              textInputAction: TextInputAction.search,
            ),
          ),
          BlocBuilder<MonitorBloc, MonitorState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is MonitorLoading) return Center(child: CircularProgressIndicator());
              if (state is MonitorFailure) return Center(child: Text(state.message));
              if (state is MonitorSuccess) {
                return Flexible(
                  child: ValueListenableBuilder(
                    valueListenable: searchController,
                    builder: (context, value, child) {
                      final cameras = state.cameras
                          .where(
                            (camera) =>
                                camera.name.toLowerCase().contains(value.text.toLowerCase()),
                          )
                          .toList();

                      return ListView.builder(
                        itemBuilder: (context, index) => _cameraItem(cameras[index]),
                        itemCount: cameras.length,
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _cameraItem(CameraEntity camera) {
    return Material(
      child: InkWell(
        onTap: () => onCameraSelected(camera),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: LayoutBuilder(
            builder: (context, constraints) => Row(
              children: [
                if (constraints.maxWidth >= 20 + 16) ...[
                  Container(
                    height: 35,
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppAssets.icVideoOn, width: 20, height: 20),
                  ),
                  SizedBox(width: 16),
                ],
                if (constraints.maxWidth >= 20 + 16)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          camera.name,
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackOrWhite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Đang hoạt động",
                          style: AppTypography.style(
                            12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF647488),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                if (constraints.maxWidth >= 24 - 24) ...[
                  SizedBox(width: 8),
                  SizedBox.square(
                    dimension: 8,
                    child: CircleAvatar(backgroundColor: Color(0xFF21CCC3)),
                  ),
                  SizedBox(width: 8),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
