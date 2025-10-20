import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/home/components/components_src.dart';

/// Example usage:
/// ```dart
/// showShareCameraDialog(
///   context,
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
/// ```

/// Entry point to show the share dialog
Future<T?> showShareCameraDialog<T>(
  BuildContext context, {
  required String groupName,
  List<String> sharedUsers = const [],
  Future<void> Function(List<String> selectedUsers)? onSave,
  VoidCallback? onCancel,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _ShareCameraDialog(
      groupName: groupName,
      sharedUsers: sharedUsers,
      onSave: onSave,
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

class _ShareCameraDialog extends StatefulWidget {
  const _ShareCameraDialog({
    required this.groupName,
    required this.sharedUsers,
    this.onSave,
    this.onCancel,
  });

  final String groupName;
  final List<String> sharedUsers;
  final Future<void> Function(List<String> selectedUsers)? onSave;
  final VoidCallback? onCancel;

  @override
  State<_ShareCameraDialog> createState() => _ShareCameraDialogState();
}

class _ShareCameraDialogState extends State<_ShareCameraDialog> {
  final _searchController = TextEditingController();
  final List<String> _selectedUsers = [];
  final List<SharedUser> _searchResults = [];
  bool _isSearching = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _selectedUsers.addAll(widget.sharedUsers);
    _searchController.addListener(_onSearchChanged);
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
              'Chia sẻ nhóm ${widget.groupName}',
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

  Widget _buildSearchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tài khoản muốn chia sẻ nhóm camera',
          style: TextStyle(
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
