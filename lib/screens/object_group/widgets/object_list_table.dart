import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_event.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';
import 'package:vms_flutter_client/screens/object_group/widgets/add_object_dialog.dart';
import 'package:vms_flutter_client/screens/object_type/widget/confirm_delete_dialog.dart';

class ObjectListTable extends StatelessWidget {
  const ObjectListTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
      builder: (context, state) {
        if (state.status == ObjectGroupStatus.loading &&
            state.objects.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.objects.isEmpty) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        // Dynamically resolve column keys from the first object's fieldValues
        final fieldKeys = _getFieldKeys(state.objects);

        return Column(
          children: [
            // Table Header
            Container(
              color: AppColors.greyF8F9FE,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _buildHeaderCell('STT', flex: 1),
                  _buildHeaderCell('Ảnh đại diện', flex: 2),
                  SizedBox(width: 12),
                  ...fieldKeys.map(
                    (key) => _buildHeaderCell(_formatHeader(key), flex: 3),
                  ),
                  _buildHeaderCell(
                    'Thao tác',
                    flex: 1,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Table Body
            Expanded(
              child: ListView.separated(
                itemCount: state.objects.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, color: AppColors.greyE2E8F0),
                itemBuilder: (context, index) {
                  return _buildRow(
                    context,
                    state,
                    state.objects[index],
                    index,
                    fieldKeys,
                  );
                },
              ),
            ),

            // Table Footer (Pagination)
            _buildPagination(state),
          ],
        );
      },
    );
  }

  /// Image field keys that should be displayed as images, not text
  static const _imageFieldKeys = [
    'Ảnh đại diện',
    'Ảnh nhận diện khuôn mặt',
    'Ảnh đại diện khuôn mặt',
  ];

  /// Get all field keys from the first object's fieldValues map.
  /// Filters out image array fields since they are shown in the image column.
  List<String> _getFieldKeys(List<ObjectData> objects) {
    if (objects.isEmpty) return [];
    final firstObj = objects.first;
    return firstObj.fieldValues.keys
        .where((key) => !_imageFieldKeys.contains(key))
        .take(6)
        .toList();
  }

  /// Get the first image URL from the object's fieldValues image array fields.
  String? _getImageUrl(ObjectData data) {
    for (final key in _imageFieldKeys) {
      final value = data.fieldValues[key];
      if (value is List && value.isNotEmpty) {
        return value.first.toString();
      }
      if (value is String && value.isNotEmpty) {
        return value;
      }
    }
    return null;
  }

  /// Format a camelCase or snake_case key into a more readable header.
  String _formatHeader(String key) {
    if (key.isEmpty) return key;
    return key[0].toUpperCase() + key.substring(1);
  }

  Widget _buildHeaderCell(
    String text, {
    int flex = 1,
    TextAlign align = TextAlign.left,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTypography.style(
          12,
          color: AppColors.grey64748B,
          fontWeight: FontWeight.w500,
        ),
        textAlign: align,
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
    int index,
    List<String> fieldKeys,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: index % 2 == 1 ? AppColors.greyF8F9FE : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '${index + 1}',
              style: AppTypography.style(14, color: AppColors.grey334155),
            ),
          ),
          Expanded(
            flex: 2,
            child: Builder(
              builder: (context) {
                final imageUrl = _getImageUrl(data);
                if (imageUrl != null && imageUrl.isNotEmpty) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 48,
                        height: 48,
                        color: AppColors.greyE2E8F0,
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 48,
                        height: 48,
                        color: AppColors.greyE2E8F0,
                        child: const Icon(
                          Icons.broken_image,
                          size: 20,
                          color: AppColors.grey6F767E,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox(width: 48, height: 48);
              },
            ),
          ),
          SizedBox(width: 12),
          ...fieldKeys.map((key) {
            final value = data.fieldValues[key] ?? '';
            return Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  value.toString(),
                  style: AppTypography.style(
                    14,
                    color: AppColors.grey334155,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            );
          }),
          // Actions - PopupMenuButton with Sửa/Xóa
          Expanded(
            flex: 1,
            child: Center(
              child: PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_horiz,
                  color: AppColors.grey6F767E,
                  size: 20,
                ),
                splashRadius: 16,
                offset: const Offset(0, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.white,
                onSelected: (value) {
                  if (value == 'edit') {
                    _onEditObject(context, state, data);
                  } else if (value == 'delete') {
                    _onDeleteObject(context, state, data);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.icEdit,
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            AppColors.blue005AA9,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Sửa',
                          style: AppTypography.style(
                            14,
                            color: AppColors.grey334155,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.icDelete,
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Xóa',
                          style: AppTypography.style(14, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onEditObject(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
  ) async {
    if (state.selectedObjectType == null) return;

    final messenger = ScaffoldMessenger.of(context);
    final repo = context.read<IObjectGroupRepository>();
    final bloc = context.read<ObjectGroupBloc>();

    try {
      // Fetch full object type detail (with fields) like create dialog does
      final objectTypeDetail = await repo.getObjectTypeDetail(
        state.selectedObjectType!.id,
      );
      if (!context.mounted) return;

      final result = await showDialog<bool>(
        context: context,
        builder: (_) => AddObjectDialog(
          objectType: objectTypeDetail,
          existingObject: data,
          subjectGroups: bloc.state.subjectGroups,
        ),
      );

      if (result == true) {
        bloc.add(LoadObjects(objectTypeId: state.selectedObjectType!.id));
      }
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    }
  }

  void _onDeleteObject(
    BuildContext context,
    ObjectGroupState state,
    ObjectData data,
  ) {
    final repo = context.read<IObjectGroupRepository>();
    final bloc = context.read<ObjectGroupBloc>();

    showDialog(
      context: context,
      builder: (_) => ConfirmDeleteDialog(
        title: 'Xóa đối tượng',
        content:
            'Bạn có chắc chắn muốn xóa đối tượng này không?\nHành động này không thể hoàn tác.',
        onConfirm: () async {
          try {
            await repo.deleteObject(data.id);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Xóa đối tượng thành công')),
              );
              bloc.add(LoadObjects(objectTypeId: state.selectedObjectType!.id));
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Xóa đối tượng thất bại: $e')),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildPagination(ObjectGroupState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hiển thị từ ${(state.currentObjectsPage - 1) * 20 + 1} đến ${((state.currentObjectsPage - 1) * 20) + state.objects.length} trong số ${state.totalObjects} mục',
            style: AppTypography.style(14, color: AppColors.grey64748B),
          ),
          // Add pagination controls here if needed
        ],
      ),
    );
  }
}
