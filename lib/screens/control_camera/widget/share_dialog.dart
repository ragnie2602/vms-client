import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/debouncer.dart';
import 'package:vms_flutter_client/data/datasources/share_type_enum.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/home/components/components_src.dart';

/// Example usage:
/// ```dart
/// // Chia sẻ group
/// showShareDialog(
///   context,
///   shareType: ShareType.group,
///   groupName: 'Group_1',
///   sharedUsers: ['user1', 'user2'],
///   onSave: (selectedUsers) async {
///     // Handle save logic
///     print('Selected users: $selectedUsers');
///   },
///   onCancel: () {
///     // Handle cancel logic
///     print('Dialog cancelled');
///   },
/// );
///
/// // Chia sẻ camera
/// showShareDialog(
///   context,
///   shareType: ShareType.camera,
///   camera: cameraEntity,
///   sharedUsers: ['user1', 'user2'],
///   onSave: (selectedUsers) async {
///     // Handle save logic
///     print('Selected users: $selectedUsers');
///   },
///   onCancel: () {
///     // Handle cancel logic
///     print('Dialog cancelled');
///   },
/// );
/// ```

/// Entry point to show the share dialog
Future<T?> showShareDialog<T>(
  BuildContext context, {
  required ShareType shareType,
  String? groupName,
  CameraEntity? camera,
  List<String> sharedUsers = const [],
  Future<void> Function(List<String> selectedUsers)? onSave,
  Future<void> Function(String query)? onSearchUser,
  VoidCallback? onCancel,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _ShareDialog(
      shareType: shareType,
      groupName: groupName,
      camera: camera,
      sharedUsers: sharedUsers,
      onSave: onSave,
      onSearchUser: onSearchUser,
      onCancel: onCancel,
    ),
  );
}

/// Data model for shared user
class SharedUser {
  final String username;
  final String? displayName;
  final String? avatar;

  const SharedUser({required this.username, this.displayName, this.avatar});

  String get displayText => displayName ?? username;
}

class _ShareDialog extends StatefulWidget {
  const _ShareDialog({
    required this.shareType,
    this.groupName,
    this.camera,
    required this.sharedUsers,
    this.onSave,
    this.onSearchUser,
    this.onCancel,
  });

  final ShareType shareType;
  final String? groupName;
  final CameraEntity? camera;
  final List<String> sharedUsers;
  final Future<void> Function(List<String> selectedUsers)? onSave;
  final Future<void> Function(String query)? onSearchUser;
  final VoidCallback? onCancel;

  @override
  State<_ShareDialog> createState() => _ShareDialogState();
}

class _ShareDialogState extends State<_ShareDialog> {
  final _searchController = TextEditingController();
  final List<String> _selectedUsers = [];
  final List<SharedUser> _searchResults = [];
  bool _isSearching = false;
  bool _isSaving = false;
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    _selectedUsers.addAll(widget.sharedUsers);
    _searchController.addListener(_onSearchChanged);
  }

  /// Lấy tên hiển thị dựa trên loại chia sẻ
  String get _displayName {
    switch (widget.shareType) {
      case ShareType.groupCamera:
        return widget.groupName ?? 'Nhóm';
      case ShareType.camera:
        return widget.camera?.name ?? 'Camera';
    }
  }

  /// Lấy mô tả dựa trên loại chia sẻ
  String get _description {
    switch (widget.shareType) {
      case ShareType.groupCamera:
        return 'Chia sẻ nhóm camera';
      case ShareType.camera:
        return 'Chia sẻ camera';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _searchResults.clear();
        _isSearching = false;
      });
      return;
    }

    setState(() => _isSearching = true);

    // Simulate search API call
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && _searchController.text.trim() == query) {
        _performSearch(query);
      }
    });
  }

  void _performSearch(String query) {
    // Mock search results - in real app, this would call an API
    final mockResults =
        [
              SharedUser(username: 'user1', displayName: 'Người dùng 1'),
              SharedUser(username: 'user2', displayName: 'Người dùng 2'),
              SharedUser(username: 'user3', displayName: 'Người dùng 3'),
            ]
            .where(
              (user) =>
                  user.username.toLowerCase().contains(query.toLowerCase()) ||
                  (user.displayName?.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false),
            )
            .toList();

    setState(() {
      _searchResults.clear();
      _searchResults.addAll(mockResults);
      _isSearching = false;
    });
  }

  void _addUser(SharedUser user) {
    if (!_selectedUsers.contains(user.username)) {
      setState(() {
        _selectedUsers.add(user.username);
      });
    }
  }

  void _removeUser(String username) {
    setState(() {
      _selectedUsers.remove(username);
    });
  }

  Future<void> _handleSave() async {
    if (_isSaving) return;

    setState(() => _isSaving = true);

    try {
      // Log share info for debugging
      print('Sharing info: $_shareInfo');

      await widget.onSave?.call(_selectedUsers);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      // Handle error
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi khi lưu: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  /// Lấy thông tin chia sẻ để hiển thị trong log hoặc debug
  Map<String, dynamic> get _shareInfo {
    return {
      'shareType': widget.shareType.name,
      'targetName': _displayName,
      'selectedUsers': _selectedUsers,
      if (widget.shareType == ShareType.camera && widget.camera != null)
        'cameraId': widget.camera!.camId,
      if (widget.shareType == ShareType.groupCamera && widget.groupName != null)
        'groupName': widget.groupName,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          Expanded(
            child: Text(
              '$_description $_displayName',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
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
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Camera Info Section (only for camera sharing)
              if (widget.shareType == ShareType.camera && widget.camera != null)
                _buildCameraInfoSection(),

              if (widget.shareType == ShareType.camera && widget.camera != null)
                const SizedBox(height: 16),

              // Search Section
              _buildSearchSection(),

              const SizedBox(height: 24),

              // Shared List Section
              _buildSharedListSection(),

              const SizedBox(height: 24),
            ],
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
                  onPressed: (_isSaving)
                      ? null
                      : () {
                          widget.onCancel?.call();
                          Navigator.pop(context);
                        },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton.filled(
                  label: _isSaving ? '' : 'LƯU',
                  onPressed: _isSaving ? null : _handleSave,
                  child: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCameraInfoSection() {
    final camera = widget.camera!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        border: Border.all(color: AppColors.greyE2E8F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Camera icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.blue15ABFF,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.videocam, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),

          // Camera info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  camera.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${camera.camId}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF92929D),
                  ),
                ),
                if (camera.iPUrlStream.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    'IP: ${camera.iPUrlStream}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF92929D),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.shareType == ShareType.groupCamera
              ? 'Tài khoản muốn chia sẻ nhóm camera'
              : 'Tài khoản muốn chia sẻ camera',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
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
                widget.onSearchUser?.call(value);
              });
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

        // Search Results or No Results
        if (_searchController.text.isNotEmpty) ...[
          if (_isSearching)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_searchResults.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Không tìm thấy người dùng hoặc nhóm',
                  style: TextStyle(fontSize: 14, color: Color(0xFF92929D)),
                ),
              ),
            )
          else
            Container(
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyE2E8F0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final user = _searchResults[index];
                  final isSelected = _selectedUsers.contains(user.username);

                  return ListTile(
                    dense: true,
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.blue15ABFF,
                      child: Text(
                        user.displayText.isNotEmpty
                            ? user.displayText[0].toUpperCase()
                            : 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    title: Text(
                      user.displayText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      user.username,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF92929D),
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: AppColors.blue15ABFF,
                            size: 20,
                          )
                        : IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => _addUser(user),
                          ),
                    onTap: isSelected ? null : () => _addUser(user),
                  );
                },
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildSharedListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Danh sách đã chia sẻ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8),

        if (_selectedUsers.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyE2E8F0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text(
                'Chưa có người dùng nào được chia sẻ',
                style: TextStyle(fontSize: 14, color: Color(0xFF92929D)),
              ),
            ),
          )
        else
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyE2E8F0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _selectedUsers.length,
              itemBuilder: (context, index) {
                final username = _selectedUsers[index];

                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.blue15ABFF,
                    child: Text(
                      username.isNotEmpty ? username[0].toUpperCase() : 'U',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  title: Text(
                    username,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icDelete,
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF92929D),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Xoá',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF92929D),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => _removeUser(username),
                );
              },
            ),
          ),
      ],
    );
  }
}
