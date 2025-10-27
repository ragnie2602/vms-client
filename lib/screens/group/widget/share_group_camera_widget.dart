import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/debouncer.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/share/invite_message_entity.dart';
import 'package:vms_flutter_client/screens/control_camera/bloc/control_camera_bloc.dart';
import 'package:vms_flutter_client/screens/group/widget/confirm_remove_view.dart';
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
  List<InviteMessageEntity>? sharedUsers,
  required Future<List<InviteMessageEntity>> Function() onReloadData,
  // dành cho share group
  List<int>? groupId,
  Future<List<int>?> Function(List<int>?)? onShareGroup,
  final Future<List<int>?> Function(List<int>?)? onDeleteShareGroup,
  // dành cho share camera
  CameraEntity? currentCamera,
  Future<List<int>?> Function(String?)? onShareCamera,
  final Future<List<int>?> Function(List<int>?, String? accname)?
  onDeleteShareCamera,
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
        groupId: groupId,
        sharedUsers: sharedUsers,
        onShareGroup: onShareGroup,
        onDeleteShareGroup: onDeleteShareGroup,
        onReloadData: onReloadData,
        onDeleteShareCamera: onDeleteShareCamera,
        onShareCamera: onShareCamera,
      ),
    ),
  );
}

class _ShareGroupCameraWidget extends StatefulWidget {
  const _ShareGroupCameraWidget({
    super.key,
    required this.shareType,
    this.groupId,
    this.currentCamera,
    this.onShareGroup,
    this.sharedUsers,
    this.onDeleteShareGroup,
    required this.onReloadData,
    this.onDeleteShareCamera,
    this.onShareCamera,
  });
  final ShareType shareType;
  final List<InviteMessageEntity>? sharedUsers;
  final Future<List<InviteMessageEntity>> Function() onReloadData;
  // dành cho share group
  final List<int>? groupId;
  final Future<List<int>?> Function(List<int>?)? onShareGroup;
  final Future<List<int>?> Function(List<int>?)? onDeleteShareGroup;
  // dành cho share camera
  final CameraEntity? currentCamera;
  final Future<List<int>?> Function(String?)? onShareCamera;
  final Future<List<int>?> Function(List<int>?, String? accname)?
  onDeleteShareCamera;

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
  String? _errorCheckAccMessage;
  List<String> listAccShared = [];
  final List<String> _selectedAccName = [];
  final List<List<int>> _listInviteId = [];

  @override
  void initState() {
    super.initState();
    // get danh sách đã chia sẻ
    // initListShared();
    _errorCheckAccMessage = null;
    listAccShared.clear();
    _listInviteId.clear();
    _initData(listInvite: widget.sharedUsers);
  }

  void _initData({required List<InviteMessageEntity>? listInvite}) {
    listAccShared.addAll(
      (listInvite ?? [])
          .map((e) => e.accountShared?.account ?? '')
          .where((e) => e.isNotEmpty),
    );
    _listInviteId.addAll((listInvite ?? []).map((e) => e.inviteMsgId));
  }

  Future<void> _onReload() async {
    listAccShared.clear();
    _listInviteId.clear();
    List<InviteMessageEntity>? _invites;
    _invites = await widget.onReloadData();
    setState(() {
      _initData(listInvite: _invites);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      groupId: widget.groupId,
    );
    setState(() {
      _isSearching = false;
    });
    return res.fold(
      (fail) {
        //
        _errorCheckAccMessage = fail.toString();
      },
      (reply) {
        _errorCheckAccMessage = null;
        // nếu tồn tại tài khoản
        // vì share group cần id mà share cam cần tên accname
        if (reply.isExists) {
          setState(() {
            _accIdShareGroup = reply.accountInviteId;
            _accShareCamera = _searchController.text.trim();
          });
        }
      },
    );
  }

  void _onShare() async {
    // rest api share
    // 1. share cam
    if (widget.shareType == ShareType.camera) {
      final res = await widget.onShareCamera?.call(_accShareCamera);
      if (!mounted) return;
      if (res != null && res.isNotEmpty) {
        await _onReload();
        _searchController.clear();
      } else {
        // handle share cam fail
      }
    } else {
      // 2. share group
      final res = await widget.onShareGroup?.call(_accIdShareGroup);
      if (!mounted) return;
      if (res != null && res.isNotEmpty) {
        await _onReload();
        _searchController.clear();
      } else {
        // handle share group fail
      }
    }
  }

  void _onRemove({List<int>? invitedGroupId, String? accNameRemove}) async {
    // rest api delete share
    // 1. delete share cam
    if (widget.shareType == ShareType.camera) {
      // handle remove cam ở đây
      final res = await widget.onDeleteShareCamera?.call(
        invitedGroupId,
        accNameRemove,
      );
      if (!mounted) return;
      if (res != null && res.isNotEmpty) {
        await _onReload();
      }
      // return;
    } else {
      // 2. delete share group
      final res = await widget.onDeleteShareGroup?.call(invitedGroupId);
      if (!mounted) return;
      if (res != null && res.isNotEmpty) {
        await _onReload();
      }
    }
  }

  void _onShowDialogRemoveShareGroup(
    BuildContext c, {
    List<int>? invitedId,
    String? accNameRemove,
  }) {
    showConfirmRemoveDialog(
      c,
      contentWidget: Text(
        widget.shareType == ShareType.groupCamera
            ? 'chia sẻ nhóm camera cho tài khoản này'
            : 'chia sẻ camera cho tài khoản này',
        style: AppTypography.style(
          14,
          color: AppColors.blackOrWhite,
          fontWeight: FontWeight.w700,
        ),
      ),
      onClickRemove: () {
        // close confirm dialog
        Navigator.of(c).pop();
        // gọi hàm xóa
        _onRemove(invitedGroupId: invitedId, accNameRemove: accNameRemove);
      },
    );
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
              'Chia sẻ ${widget.shareType == ShareType.camera ? 'camera ${widget.currentCamera?.name}' : 'nhóm'}',
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _searchController.text.isEmpty
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
                            border: Border.all(
                              width: 1,
                              color: AppColors.greyE2E8F0,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
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
                                onPressed: () async {
                                  // nếu đã share => tắt click
                                  if (!_selectedAccName.contains(
                                    _searchController.text.trim(),
                                  )) {
                                    _onShare();
                                  }
                                },
                                icon: Icon(
                                  _selectedAccName.contains(
                                        _searchController.text.trim(),
                                      )
                                      ? Icons.check_circle
                                      : Icons.add_circle,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppColors.greyE2E8F0,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _errorCheckAccMessage ??
                                  'Không tìm thấy người dùng hoặc nhóm',
                              style: AppTypography.style(
                                14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                ),
                // danh sách đã chia sẻ
                const Text(
                  'Danh sách đã chia sẻ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 8),
                listAccShared.isEmpty
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyE2E8F0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            'Chưa chia sẻ cho tài khoản nào',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF92929D),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listAccShared.length,
                          itemBuilder: (context, index) {
                            final username = listAccShared[index];
                            // final
                            List<int>? _accRemoveId;
                            if (_listInviteId.length > index) {
                              _accRemoveId = _listInviteId[index];
                            }
                            return ColoredBox(
                              color: index % 2 != 0
                                  ? AppColors.greyF1F5F9
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        username,
                                        style: AppTypography.style(
                                          14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_accRemoveId == null) return;
                                        _onShowDialogRemoveShareGroup(
                                          context,
                                          invitedId: _accRemoveId,
                                          accNameRemove: username,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.icDelete,
                                            width: 16,
                                            height: 16,
                                            colorFilter: const ColorFilter.mode(
                                              Colors.black,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            'Xoá',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                  label: 'ĐÓNG',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}
