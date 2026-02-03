import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';

part '../widget/custom_tab_bar.dart';

class EventDetailDialog extends StatefulWidget {
  final EventEntity event;

  const EventDetailDialog({super.key, required this.event});

  @override
  State<EventDetailDialog> createState() => _EventDetailDialogState();
}

class _EventDetailDialogState extends State<EventDetailDialog> with TickerProviderStateMixin {
  late final EventBloc eventBloc;

  final TextEditingController descriptionController = TextEditingController();
  late TabController tabController;

  bool imageMode = true;

  @override
  void initState() {
    super.initState();

    eventBloc = context.read<EventBloc>()..add(GetEventDetail(eventId: widget.event.id));
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: MediaQuery.heightOf(context) * 624 / 900,
        width: MediaQuery.widthOf(context) * 980 / 1600,
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'Chi tiết sự kiện',
                    style: AppTypography.style(20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ),
            // Content
            BlocBuilder<EventBloc, EventState>(
              buildWhen: (previous, current) =>
                  current is EventDetailSuccess ||
                  current is EventDetailFailure ||
                  current is GettingEventDetail,
              builder: (context, state) {
                if (state is GettingEventDetail) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is EventDetailFailure) return Center(child: Text(state.message));

                if (state is! EventDetailSuccess) return SizedBox.shrink();

                final event = state.event;
                descriptionController.text = event.description ?? '';

                return Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left pane
                      Expanded(
                        flex: 606,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CustomTabBar(controller: tabController),
                              const SizedBox(height: 20),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      _imageTab(event),
                                      Align(alignment: Alignment.topCenter, child: _VideoPlayer()),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                spacing: 15,
                                children: [
                                  _functionBtn(
                                    icon: SvgPicture.asset(AppAssets.icDownloadImage, height: 12),
                                    label: 'Tải ảnh',
                                    onTap: () => _downloadSnapshot(event),
                                  ),
                                  _functionBtn(
                                    icon: SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                                    label: 'Xem trực tiếp',
                                    onTap: () {},
                                  ),
                                  _functionBtn(
                                    icon: SvgPicture.asset(AppAssets.icPlayback, height: 20),
                                    label: 'Xem playback',
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right pane
                      Expanded(
                        flex: 374,
                        child: Container(
                          decoration: BoxDecoration(color: AppColors.greyAthens),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.event.eventName ?? '',
                                style: AppTypography.style(16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 18),
                              CustomTable(
                                columnSpacing: 10,
                                data: CustomTableData(
                                  columnFlexes: [0, 1, 1],
                                  data: [
                                    [
                                      SvgPicture.asset(AppAssets.icTimeCircle, height: 20),
                                      Text(
                                        'Thời gian',
                                        style: AppTypography.style(13, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        DateFormat('HH:mm dd/MM/yyyy').format(
                                          DateTime.fromMillisecondsSinceEpoch(event.timeEvent),
                                        ),
                                        style: AppTypography.style(14, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    [
                                      SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                                      Text(
                                        'Tên camera',
                                        style: AppTypography.style(13, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        widget.event.cameraName ?? '',
                                        style: AppTypography.style(14, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    ...event.payload?.entries
                                            .map(
                                              (e) => [
                                                SizedBox(width: 20),
                                                Text(
                                                  e.key,
                                                  style: AppTypography.style(
                                                    13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  e.value.toString(),
                                                  style: AppTypography.style(
                                                    14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                            .toList() ??
                                        [],
                                  ],
                                ),
                                defaultVerticalAlignment: CrossAxisAlignment.center,
                                horizontalAlignments: [
                                  CrossAxisAlignment.start,
                                  CrossAxisAlignment.start,
                                  CrossAxisAlignment.end,
                                ],
                                rowSpacing: 18,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Ghi chú:',
                                style: AppTypography.style(14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: TextField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0),
                                    ),
                                    fillColor: AppColors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(color: AppColors.secondary),
                                    ),
                                    focusColor: AppColors.white,
                                    hintStyle: AppTypography.style(
                                      14,
                                      color: AppColors.grey92929D,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hintText: 'Nhập nội dung ghi chú',
                                    hoverColor: AppColors.white,
                                  ),
                                  minLines: 3,
                                  maxLines: 100,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            // Footer
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 12,
                children: [
                  EventCustomButton(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.greyD1D5DB,
                    borderRadius: 5,
                    label: 'Huỷ',
                    onPressed: () => Navigator.pop(context),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle: AppTypography.style(
                      14,
                      color: Color(0xFF374151),
                      lineHeight: 20 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BlocConsumer<EventBloc, EventState>(
                    builder: (context, state) => state is UpdatingEvent
                        ? const CircularProgressIndicator()
                        : EventCustomButton(
                            backgroundColor: AppColors.secondary,
                            borderColor: AppColors.secondary,
                            borderRadius: 5,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: AppColors.blue3B82F6.withAlpha(51),
                                offset: Offset(0, 2),
                                spreadRadius: -2,
                              ),
                              BoxShadow(
                                blurRadius: 6,
                                color: AppColors.blue3B82F6.withAlpha(51),
                                offset: Offset(0, 4),
                                spreadRadius: -1,
                              ),
                            ],
                            label: 'Lưu',
                            onPressed: () => _save(),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            textStyle: AppTypography.style(
                              14,
                              color: AppColors.white,
                              lineHeight: 20 / 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    listener: (context, state) {
                      if (state is UpdateEventSuccess) {
                        Navigator.pop(context);
                      } else if (state is UpdateEventFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _functionBtn({Widget? icon, String? label, Function()? onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        shadowColor: Colors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        side: BorderSide(color: AppColors.greyE5E7EB, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          if (icon != null) icon,
          if (label != null)
            Text(
              label,
              style: AppTypography.style(14, fontWeight: FontWeight.w500, lineHeight: 20 / 14),
            ),
        ],
      ),
    );
  }

  Widget _imageTab(EventEntity event) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        event.imageUrl ?? '',
        errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
        fit: BoxFit.contain,
      ),
    );
  }

  Future<void> _downloadSnapshot(EventEntity event) async {
    final imageUrl = event.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Không tìm thấy ảnh để tải xuống')));
      }
      return;
    }

    try {
      final dio = Dio();
      final response = await dio.get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final data = response.data;
      if (data == null || data.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Không tải được dữ liệu ảnh')));
        }
        return;
      }

      final bytes = Uint8List.fromList(data);

      String ext = '.jpg';
      final lowerUrl = imageUrl.toLowerCase();
      if (lowerUrl.endsWith('.png')) {
        ext = '.png';
      } else if (lowerUrl.endsWith('.jpeg')) {
        ext = '.jpg';
      }

      final now = DateTime.now();
      final safeEventName = (event.eventName ?? 'Snapshot')
          .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
          .trim();
      final fileName =
          '${safeEventName.isEmpty ? 'Snapshot' : safeEventName}_${DateFormat('yyyyMMdd_HHmmss').format(now)}$ext';

      final FileSaveLocation? result = await getSaveLocation(
        suggestedName: fileName,
        acceptedTypeGroups: [
          const XTypeGroup(label: 'Image', extensions: ['jpg', 'jpeg', 'png']),
        ],
      );

      if (result == null) return;

      final xFile = XFile.fromData(
        bytes,
        name: fileName,
        mimeType: ext == '.png' ? 'image/png' : 'image/jpeg',
      );
      await xFile.saveTo(result.path);

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Đã tải ảnh: $fileName')));
      }
    } on DioException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi khi tải ảnh: ${e.message}')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đã xảy ra lỗi khi tải ảnh')));
      }
    }
  }

  _save() {
    context.read<EventBloc>().add(
      UpdateEvent(eventId: widget.event.id, description: descriptionController.text),
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  const _VideoPlayer();

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  bool playing = false;
  Timer? timer;
  ValueNotifier<double> progress = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Stack(
        children: [
          Image.network(
            'https://cdn.wikimg.net/en/hkwiki/images/5/57/SoSpromo1.jpg',
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: IconButton(
              onPressed: () {
                setState(() => playing = !playing);
                if (playing) {
                  timer?.cancel();
                  timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                    if (progress.value >= 4.0) {
                      timer?.cancel();
                      progress.value = 0;
                      setState(() => playing = false);
                      return;
                    }
                    progress.value += 0.1;
                  });
                } else {
                  timer?.cancel();
                }
              },
              icon: Icon(playing ? Icons.pause : Icons.play_circle, size: 48, color: Colors.white),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ValueListenableBuilder(
              valueListenable: progress,
              builder: (context, value, child) => LinearProgressIndicator(
                backgroundColor: AppColors.greyCACACA,
                color: AppColors.secondary,
                value: value.clamp(0.0, 4.0) / 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
