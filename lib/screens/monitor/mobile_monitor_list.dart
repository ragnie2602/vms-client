import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/components/filter_drawer.dart';
import 'package:vms_flutter_client/screens/monitor/components/mobile_camera_item.dart';

class MobileMonitorList extends StatefulWidget {
  const MobileMonitorList({super.key});

  @override
  State<MobileMonitorList> createState() => _MobileMonitorListState();
}

class _MobileMonitorListState extends State<MobileMonitorList> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String> _searchValue = ValueNotifier("");

  final FilterDrawerController _filterDrawerController = FilterDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: _searchValue,
                builder: (context, value, child) => AnimatedSize(
                  duration: Durations.short4,
                  curve: Curves.easeInOut,
                  child: value.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chào mừng bạn!', style: AppTypography.style(16, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10),
                            Text('VNPT Secure Vision', style: AppTypography.style(22, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 20, width: double.infinity),
                          ],
                        )
                      : SizedBox(width: double.infinity),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _searchValue,
                builder: (context, value, child) {
                  return Row(
                    children: [
                      if (value.isNotEmpty) ...[
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: IconButton(
                            icon: Icon(Icons.chevron_left),
                            onPressed: () {
                              _controller.clear();
                              _searchValue.value = '';
                            },
                            style: IconButton.styleFrom(padding: EdgeInsets.zero),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.greyF2F4FA,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            focusColor: AppColors.greyF2F4FA,
                            hintText: 'Tìm kiếm camera',
                            hintStyle: AppTypography.style(
                              14,
                              color: AppColors.grey92929D,
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SvgPicture.asset(
                                AppAssets.icSearchMobile,
                                height: 22,
                                width: 22,
                                fit: BoxFit.contain,
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(minWidth: 32, minHeight: 22),
                          ),
                          onChanged: (value) => _searchValue.value = value,
                          style: AppTypography.style(14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Các camera', style: AppTypography.style(13, fontWeight: FontWeight.w500)),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greyF5F5F5,
                          elevation: 0,
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Phân loại',
                              style: AppTypography.style(
                                13,
                                color: AppColors.grey666666,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(AppAssets.icFilterAltLight, height: 20, width: 20),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 7.5),
              Expanded(
                child: BlocBuilder<MonitorBloc, MonitorState>(
                  builder: (context, state) {
                    if (state is MonitorLoading) return Center(child: CircularProgressIndicator());
                    if (state is MonitorSuccess) {
                      return ValueListenableBuilder(
                        valueListenable: _searchValue,
                        builder: (context, value, child) {
                          final _cameras = state.cameras
                              .where(
                                (c) => removeDiacritics(
                                  c.name.toLowerCase(),
                                ).contains(removeDiacritics(value.trim().toLowerCase())),
                              )
                              .toList();

                          return _cameras.isNotEmpty
                              ? ListView.builder(
                                  itemBuilder: (context, index) => MobileCameraItem(_cameras[index]),
                                  itemCount: _cameras.length,
                                )
                              : Center(
                                  child: Text(
                                    'Không có dữ liệu',
                                    style: AppTypography.style(
                                      13,
                                      color: AppColors.grey666666,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                        },
                      );
                    }
                    return Center(
                      child: Container(
                        color: Colors.amber,
                        child: Text(
                          'Không có dữ liệu',
                          style: AppTypography.style(13, color: AppColors.grey666666, fontWeight: FontWeight.w600),
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
      endDrawer: FilterDrawer(controller: _filterDrawerController),
    );
  }

  @override
  void dispose() {
    _searchValue.dispose();
    super.dispose();
  }
}
