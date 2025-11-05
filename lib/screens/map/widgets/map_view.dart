import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_bloc.dart';
import 'package:vms_flutter_client/screens/map/bloc/emap_state.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: BlocBuilder<EmapBloc, EmapState>(
        builder: (context, state) => state is EmapSuccessState
            ? ((state.listEmap ?? []).isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.only(bottom: 16),
                            child: SvgPicture.asset(AppAssets.icEmptyEmap),
                          ),
                          Text(
                            'Chưa có bản đồ camera nào. Click + để thêm bản đồ camera',
                            style: AppTypography.style(
                              14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey64748B,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Image.network(
                      state.emapSelected?.backgroundPath ?? '',
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                          ? child
                          : Center(child: CircularProgressIndicator()),
                    )
            : const SizedBox(),
      ),
    );
  }
}
//"http://ipcam.vivas.vn:8888/vt/static/emap/EfCpkoDwXoS7jwJCwKggAg_preview.jpg"