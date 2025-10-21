import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/debouncer.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/group/device_group.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';

enum ShareType {
  camera(0),
  groupCamera(1);

  final int value;

  const ShareType(this.value);
}

extension ShareTypeExtension on ShareType {
  static int getShareTypeValue(ShareType shareType) {
    return shareType.value;
  }
}

Future<T?> showShareGroupCameraDialog<T>(
  BuildContext context, {
  // các thuộc tính chung
  required ShareType shareType,
  VoidCallback? onCancel,
  // dành cho share group
  DeviceGroup? currentGroup,
  Function({List<int>? accountInviteId})? onSave,
  // dành cho share camera
  CameraEntity? currentCamera,
}) {
   final controlCameraBloc = context.read<ControlCameraBloc>();
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: controlCameraBloc,
      child: _ShareGroupCameraWidget(
        shareType: shareType,
        currentCamera: currentCamera,
        currentGroup: currentGroup,
      ),
    ),
  );
}

class _ShareGroupCameraWidget extends StatefulWidget {
  const _ShareGroupCameraWidget({
    super.key,
    required this.shareType,
    this.currentGroup,
    this.currentCamera,
    this.onSave,
  });
  final ShareType shareType;
  final Function({List<int>? accountInviteId})? onSave;
  // dành cho share group
  final DeviceGroup? currentGroup;
  // dành cho share camera
  final CameraEntity? currentCamera;
  @override
  State<_ShareGroupCameraWidget> createState() =>
      __ShareGroupCameraWidgetState();
}

class __ShareGroupCameraWidgetState extends State<_ShareGroupCameraWidget> {
  final _searchController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  bool _isSearching = false;
  List<int>? _accIdShareGroup;
  String? _accShareCamera;

  @override
  void initState() {
    super.initState();
  }

  // onCheckAccountShare
  void _clearData() {
    setState(() {
      _accShareCamera = null;
      _accIdShareGroup = null;
    });
  }

  void _onCheckAccountShare() async {
    // clear data
    _clearData();
    //
    setState(() {
      _isSearching = true;
    });
    final repo = context.read<ControlCameraBloc>().controlGroupRepository;
    final res = await repo.checkAccountShare(
      cameraId: widget.currentCamera?.id,
      account: _searchController.text.trim(),
      shareType: ShareTypeExtension.getShareTypeValue(widget.shareType),
      groupId: widget.currentGroup?.groupId,
    );
    setState(() {
      _isSearching = false;
    });
    return res.fold((_) => null, (reply) {
      // nếu tồn tại tài khoản
      // vì share group cần id mà share cam cần tên accname
      if (reply.isExists) {
        setState(() {
          _accIdShareGroup = reply.accountInviteId;
          _accShareCamera = _searchController.text.trim();
          // if (widget.shareType == ShareType.groupCamera) {
          //   _accIdShareGroup = reply.accountInviteId;
          // } else {
          //   _accShareCamera = _searchController.text.trim();
          // }  
        });
      }
    });
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
              'Chia sẻ ${widget.shareType == ShareType.camera ? 'camera ${widget.currentCamera?.name}' : 'nhóm ${widget.currentGroup?.name}'}',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                widget.shareType == ShareType.groupCamera
                    ? Text(
                        'Tài khoản muốn chia sẻ nhóm camera',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        'Tài khoản muốn chia sẻ camera',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                const SizedBox(height: 8),
                // Search Field
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyE2E8F0),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: (value) {
                      debouncer.run(() {
                        // rest api check account tồn tại
                        _onCheckAccountShare();
                        // widget.onSearchUser?.call(value);
                      });
                    },
                    onFieldSubmitted: (value) {
                      _onCheckAccountShare();
                    },
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm và chọn người dùng',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF92929D),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppAssets.icSearch,
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF92929D),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),

                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                //
                _searchController.text.isEmpty
                    ? const SizedBox()
                    : _isSearching
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : (_accIdShareGroup != null || _accShareCamera != null)
                    ? Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _searchController.text.trim(),
                                style: AppTypography.style(
                                  14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey0F172A,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // rest api share
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                          'Không tìm thấy người dùng hoặc nhóm',
                          style: AppTypography.style(
                            14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AppButton.outline(
                  label: 'HỦY',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 12),
              // Expanded(
              //   child: AppButton.filled(label: 'LƯU', onPressed: () {}),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
