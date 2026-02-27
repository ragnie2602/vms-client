import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/data/models/object_data.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_bloc.dart';
import 'package:vms_flutter_client/screens/object_group/bloc/object_group_state.dart';

class ObjectListTable extends StatelessWidget {
  const ObjectListTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObjectGroupBloc, ObjectGroupState>(
      builder: (context, state) {
        if (state.status == ObjectGroupStatus.loading && state.objects.isEmpty) {
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
                  _buildHeaderCell('Hình ảnh', flex: 2),
                  SizedBox(width: 12),
                  ...fieldKeys.map((key) => _buildHeaderCell(_formatHeader(key), flex: 3)),
                  _buildHeaderCell('Thao tác', flex: 1, align: TextAlign.center),
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
                  return _buildRow(context, state.objects[index], index, fieldKeys);
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

  /// Get all field keys from the first object's fieldValues map.
  /// This makes columns fully dynamic based on API response.
  List<String> _getFieldKeys(List<ObjectData> objects) {
    if (objects.isEmpty) return [];
    final firstObj = objects.first;
    // Take all keys from fieldValues, limited to 6 to avoid overflow
    return firstObj.fieldValues.keys.take(6).toList();
  }

  /// Format a camelCase or snake_case key into a more readable header.
  String _formatHeader(String key) {
    // Simple formatting: capitalize first letter, keep rest as-is
    if (key.isEmpty) return key;
    return key[0].toUpperCase() + key.substring(1);
  }

  Widget _buildHeaderCell(String text, {int flex = 1, TextAlign align = TextAlign.left}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTypography.style(12, color: AppColors.grey64748B, fontWeight: FontWeight.w500),
        textAlign: align,
      ),
    );
  }

  Widget _buildRow(BuildContext context, ObjectData data, int index, List<String> fieldKeys) {
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
            child: data.thumbnailUrl != null && data.thumbnailUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: data.thumbnailUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: AppColors.greyE2E8F0),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : SizedBox.shrink(),
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
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz, color: AppColors.primary),
            ),
          ),
        ],
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
