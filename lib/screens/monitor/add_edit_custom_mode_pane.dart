import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/custom_view/custom_view_bloc.dart';
import 'package:vms_flutter_client/screens/monitor/custom_monitor_pane.dart';

class AddEditCustomModePane extends StatefulWidget {
  const AddEditCustomModePane({super.key, this.onBack});
  final void Function()? onBack;

  @override
  State<AddEditCustomModePane> createState() => _AddEditCustomModePaneState();
}

class _AddEditCustomModePaneState extends State<AddEditCustomModePane> {
  late final CustomViewBloc bloc;

  final TextEditingController nameController = TextEditingController();
  CustomLiveView? customView;

  String? _errorMessage;
  ViewMode _mode = ViewMode.v2x2;

  CustomMonitorPaneMode get mode =>
      customView?.id.isEmpty ?? true ? CustomMonitorPaneMode.add : CustomMonitorPaneMode.edit;

  @override
  void initState() {
    super.initState();

    bloc = context.read<CustomViewBloc>();

    if (bloc.state is ShowCustomViewSuccess) {
      customView = (bloc.state as ShowCustomViewSuccess).customView;
    }

    // Listen to text changes to clear error message
    nameController.text = customView?.name ?? '';
    nameController.addListener(() {
      if (_errorMessage != null && nameController.text.isNotEmpty) {
        setState(() => _errorMessage = null);
      }
    });

    _mode = customView?.base ?? ViewMode.v2x2;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocListener<CustomViewBloc, CustomViewState>(
            listener: (context, state) {
              if (state is ShowCustomViewSuccess) customView = state.customView;
            },
            child: Container(),
          ),
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => widget.onBack?.call(),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.arrow_back, size: 20, color: AppColors.blackOrWhite),
                ),
              ),
              SizedBox(width: 8),
              Text(
                mode == CustomMonitorPaneMode.add
                    ? 'Thêm chế độ tùy biến'
                    : 'Chỉnh sửa chế độ tùy biến',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackOrWhite,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Tên chế độ xem',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackOrWhite,
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 19),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: _errorMessage != null ? Colors.red : AppColors.greyE2E8F0,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: _errorMessage != null ? Colors.red : AppColors.black,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: _errorMessage != null ? Colors.red : AppColors.greyE2E8F0,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              hintText: 'Nhập tên chế độ xem',
              hintStyle: AppTypography.style(
                14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey64748B,
              ),
              errorText: _errorMessage,
              errorStyle: AppTypography.style(12, fontWeight: FontWeight.w400, color: Colors.red),
            ),
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackOrWhite,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Kiểu hiển thị',
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackOrWhite,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 32,
            child: Row(
              spacing: 8,
              children: [
                for (var value in ViewMode.values)
                  InkWell(
                    onTap: () => setState(
                      () => bloc.add(
                        ShowCustomView(
                          customView?.copyWith(base: _mode = value) ??
                              CustomLiveView(id: [], base: _mode = value, positions: [], name: ''),
                          mode,
                        ),
                      ),
                    ),
                    child: SvgPicture.asset(
                      _mode == value ? value.iconActive : value.icon,
                      width: 32,
                      height: 32,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => widget.onBack?.call(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackOrWhiteReverse,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    side: BorderSide(color: AppColors.greyE2E8F0, width: 1),
                  ),
                  child: Text(
                    'Hủy',
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      if (mode == CustomMonitorPaneMode.add) {
                        bloc.add(
                          CreateCustomView(
                            base: _mode,
                            name: nameController.text,
                            positions: customView?.positions,
                          ),
                        );
                      } else {
                        bloc.add(
                          UpdateCustomView(
                            customView: customView!.copyWith(
                              name: nameController.text,
                              base: _mode,
                            ),
                          ),
                        );
                      }
                    } else {
                      setState(() => _errorMessage = 'Vui lòng nhập tên chế độ xem');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackOrWhite,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                  child: BlocConsumer<CustomViewBloc, CustomViewState>(
                    listener: (context, state) {
                      if (state is CreateCustomViewSuccess || state is UpdateCustomViewSuccess) {
                        widget.onBack?.call();
                      }
                    },
                    builder: (context, state) {
                      if (state is CreatingCustomView || state is UpdatingCustomView) {
                        return CircularProgressIndicator(color: AppColors.blackOrWhiteReverse);
                      }

                      return Text(
                        'Lưu',
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackOrWhiteReverse,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
