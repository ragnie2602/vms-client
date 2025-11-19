import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_bloc.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_event.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_state.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/general_config_camera_widget.dart';
import 'package:vms_flutter_client/screens/schedule_recording/widgets/schedule_recording_widget.dart';

Future<T?> showDialogConfig<T>(
  BuildContext context, {
  required CameraEntity camera,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (_) => ScheduleBloc(cameraRepository: context.read()),
        child: ConfigCameraWidget(camera: camera),
      );
    },
  );
}

class ConfigCameraWidget extends StatefulWidget {
  const ConfigCameraWidget({super.key, required this.camera});
  final CameraEntity camera;
  @override
  State<ConfigCameraWidget> createState() => _ConfigCameraWidgetState();
}

class _ConfigCameraWidgetState extends State<ConfigCameraWidget> {
  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    context.read<ScheduleBloc>().add(InitScheduleEvent());
  }

  void _onChangeTab(ConfigCameraTab tab) {
    context.read<ScheduleBloc>().add(ChangeTabEvent(tab));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        if (state is ScheduleLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ScheduleSuccessState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            titlePadding: EdgeInsets.only(
              top: 20,
              right: 24,
              left: 24,
              bottom: 10,
            ),
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    'Cấu hình',
                    style: AppTypography.style(
                      20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
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
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: AppColors.greyE2E8F0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ColoredBox(
                      color: AppColors.greyFBFBFB,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final item = ConfigCameraTab.values[index];
                                final isSelected = item == state.selectedTab;
                                return InkWell(
                                  onTap: () {
                                    _onChangeTab(item);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.white
                                          : Colors.transparent,
                                      border: Border(
                                        left: BorderSide(
                                          color: isSelected
                                              ? AppColors.secondary
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                        right: BorderSide(
                                          color: isSelected
                                              ? Colors.transparent
                                              : AppColors.greyE3F0FF,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        item.title,
                                        style: AppTypography.style(
                                          16,
                                          fontWeight: FontWeight.w700,
                                          color: isSelected
                                              ? AppColors.secondary
                                              : AppColors.grey64748B,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: ConfigCameraTab.values.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: state.selectedTab == ConfigCameraTab.generalConfig
                        ? GeneralConfigCameraWidget(camera: widget.camera)
                        : ScheduleRecordingWidget(camera: widget.camera),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }
}

enum ConfigCameraTab { generalConfig, scheduleRecording }

extension ConfigCameraTabExtension on ConfigCameraTab {
  String get title {
    switch (this) {
      case ConfigCameraTab.generalConfig:
        return 'Cấu hình chung';
      case ConfigCameraTab.scheduleRecording:
        return 'Lập lịch ghi hình';
    }
  }
}
