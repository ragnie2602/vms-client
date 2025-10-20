import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/group/bloc/group_camera_bloc.dart';

Future<T?> showDialogAddCamera<T>(
  BuildContext context, {
  DeviceGroup? currentGroup,
  List<CameraEntity>? listCameraAvailable,
  Function({required List<CameraEntity> listCameraSelected})? onConfirm,
}) {
  final controlCameraBloc = context.read<GroupCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: AddCameraWidget(
        currentGroup: currentGroup,
        listCameraAvailable: listCameraAvailable,
        onConfirm: onConfirm,
      ),
    ),
  );
}

class AddCameraWidget extends StatefulWidget {
  const AddCameraWidget({
    super.key,
    this.currentGroup,
    this.listCameraAvailable,
    this.onConfirm,
  });
  final DeviceGroup? currentGroup;
  final List<CameraEntity>? listCameraAvailable;
  final Function({required List<CameraEntity> listCameraSelected})? onConfirm;

  @override
  State<AddCameraWidget> createState() => _AddCameraWidgetState();
}

class _AddCameraWidgetState extends State<AddCameraWidget> {
  final _nameCameraController = TextEditingController();
  List<CameraEntity>? _listCameraAvailable;
  List<CameraEntity>? _listCameraSelected;
  @override
  void initState() {
    super.initState();
    _listCameraAvailable = widget.listCameraAvailable;
    _listCameraSelected = [];
  }

  @override
  void dispose() {
    _nameCameraController.dispose();
    _listCameraAvailable = null;
    _listCameraSelected = null;
    super.dispose();
  }

  // search camera
  List<CameraEntity>? _onSeach() {
    if (_nameCameraController.text.isEmpty) {
      return widget.listCameraAvailable;
    } else {
      return widget.listCameraAvailable
          ?.where((camera) => camera.name.contains(_nameCameraController.text))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: EdgeInsets.only(top: 20, right: 24, left: 24, bottom: 10),
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Expanded(
            child: Text(
              'Thêm Camera vào nhóm ${widget.currentGroup?.name ?? ''}',
              style: AppTypography.style(
                20,
                fontWeight: FontWeight.w600,
                color: AppColors.grey0F172A,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.greyE2E8F0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    TextField(
                      controller: _nameCameraController,
                      onChanged: (value) {
                        setState(() {
                          _listCameraAvailable = _onSeach();
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: AppColors.greyE2E8F0,
                        hintText: 'Tìm kiếm camera',
                        hintStyle: AppTypography.style(
                          14,
                          color: AppColors.grey64748B,
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
                        prefixIcon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.icSearch,
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _listCameraAvailable = _onSeach();
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: (_listCameraAvailable ?? []).isEmpty
                          ? Center(
                              child: Text(
                                'Không có kết quả phù hợp',
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w400,
                                  isItalic: true,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _listCameraAvailable?.length ?? 0,
                              itemBuilder: (context, index) {
                                final camera = _listCameraAvailable![index];
                                final isSelected = _listCameraSelected!
                                    .contains(camera);
                                return ListTile(
                                  selectedColor: Colors.transparent,
                                  title: Text(camera.name),
                                  trailing: isSelected
                                      ? Icon(Icons.check_box)
                                      : Icon(Icons.check_box_outline_blank),
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        _listCameraSelected!.remove(camera);
                                      } else {
                                        _listCameraSelected!.add(camera);
                                      }
                                    });
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyE2E8F0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                        child: Text(
                          'Hủy',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey0F172A,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      widget.onConfirm?.call(
                        listCameraSelected: _listCameraSelected ?? [],
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 24, left: 16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                        child: Text(
                          'Xác nhận',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
