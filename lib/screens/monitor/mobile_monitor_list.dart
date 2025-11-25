import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/monitor/monitor_bloc.dart';

class MobileMonitorList extends StatefulWidget {
  const MobileMonitorList({super.key});

  @override
  State<MobileMonitorList> createState() => _MobileMonitorListState();
}

class _MobileMonitorListState extends State<MobileMonitorList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Chào mừng bạn!', style: AppTypography.style(16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Text('VNPT Secure Vision', style: AppTypography.style(22, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        titleSpacing: 0,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide.none),
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
                hintStyle: AppTypography.style(14, color: AppColors.grey92929D, fontWeight: FontWeight.w400),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(AppAssets.icSearchMobile, height: 22, width: 22, fit: BoxFit.contain),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 32, minHeight: 22),
              ),
              style: AppTypography.style(14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Các camera', style: AppTypography.style(13, fontWeight: FontWeight.w500)),
                ElevatedButton(
                  onPressed: () {},
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
                        style: AppTypography.style(13, color: AppColors.grey666666, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(AppAssets.icFilterAltLight, height: 20, width: 20),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7.5),
            Expanded(
              child: BlocBuilder<MonitorBloc, MonitorState>(
                builder: (context, state) {
                  if (state is MonitorLoading) return Center(child: CircularProgressIndicator());
                  if (state is MonitorSuccess) {
                    return ListView.builder(
                      itemBuilder: (context, index) => AspectRatio(
                        aspectRatio: 345 / 200,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.black),
                          margin: const EdgeInsets.symmetric(vertical: 7.5),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          child: Stack(
                            children: [
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      state.cameras[index].isOnline
                                          ? AppAssets.icVideoOnline
                                          : AppAssets.icVideoOffline,
                                      color: AppColors.white,
                                      height: 40,
                                      width: 40,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      state.cameras[index].isOnline
                                          ? 'Xem camera'
                                          : 'Ngoại tuyến', // TODO: reimplement text when offline
                                      style: AppTypography.style(
                                        13,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentGeometry.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text(
                                        state.cameras[index].name,
                                        style: AppTypography.style(
                                          13,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        AppAssets.tabSettings,
                                        color: AppColors.white,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: state.cameras.length,
                    );
                  }
                  return Center(
                    child: Text(
                      'Không có dữ liệu',
                      style: AppTypography.style(13, color: AppColors.grey666666, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
