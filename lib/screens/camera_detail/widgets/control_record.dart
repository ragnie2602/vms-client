import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';

class ControlRecord extends StatefulWidget {
  const ControlRecord({super.key, required this.isRecording});
  final bool isRecording;

  @override
  State<ControlRecord> createState() => _ControlRecordState();
}

class _ControlRecordState extends State<ControlRecord> {
  final ValueNotifier<Duration> _duration = ValueNotifier(Duration.zero);
  Timer? _timer;
  bool _isBusy = false;
  Process? _process;
  bool _isKilledByUser = false;

  @override
  void didUpdateWidget(covariant ControlRecord oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Đang recording --> đổi cam --> bị build lại --> reset
    if (oldWidget.isRecording != widget.isRecording && _process != null) {
      Future.delayed(
        Duration.zero,
        () => _onStop('Quá trình ghi hình đã dừng. Video đã được lưu thành công'),
      );
    }
  }

  @override
  void dispose() {
    // Trường hợp đang ghi mà đổi tab/đổi cam/logout ... --> toast
    if (_process != null) {
      Future.delayed(
        Duration.zero,
        () => ToastUtil.toastSuccess(
          title: _toastMessage('Quá trình ghi hình đã dừng. Video đã được lưu thành công'),
        ),
      );
    }
    _process?.kill(ProcessSignal.sigint);
    _duration.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _reset() {
    if (!mounted) return;

    _duration.value = Duration.zero;
    _timer?.cancel();
    _process?.kill(ProcessSignal.sigint);
    _process = null;
    context.read<CameraDetailBloc>().add(OnRecording(cancel: true));
  }

  void _onStop([String? message]) {
    if (!mounted) return;

    _isKilledByUser = true;
    _reset();
    ToastUtil.toastSuccess(context: context, title: _toastMessage(message ?? 'Đã ghi video'));
  }

  void _onExited(int exitCode) {
    if (!mounted) return;

    _reset();

    if (!_isKilledByUser) {
      ToastUtil.toastWarning(
        context: context,
        title: _toastMessage('Đã dừng ghi video do có lỗi xảy ra'),
      );
    }
  }

  Future<void> _startRecording() async {
    if (_isBusy || !mounted) return;

    setState(() => _isBusy = true);
    _isKilledByUser = false;

    context.read<CameraDetailBloc>().add(
      OnRecording(
        cb: (Process? process, String? output) {
          setState(() => _isBusy = false);
          _process = process;

          if (process != null) {
            _process!.exitCode.then(_onExited);
            _duration.value = Duration.zero;
            _timer?.cancel();
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              final future = Duration(seconds: _duration.value.inSeconds + 1);
              if (future >= Duration(hours: 1)) {
                return _onStop("Quá trình ghi video đã dừng do quá thời gian ghi tối đa cho phép!");
              }
              _duration.value = future;
            });
          } else if (output != null) {
            ToastUtil.toastFail(
              context: context,
              title: _toastMessage('Có lỗi xảy ra trong quá trình ghi video'),
            );
          }
        },
      ),
    );
  }

  Text _toastMessage(String message) {
    return Text(
      message,
      style: AppTypography.style(13, fontWeight: FontWeight.w500, color: AppColors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isRecording && _isBusy) return _buildRecordingTimer(isLoading: true);

    return widget.isRecording ? _buildRecordingTimer(isLoading: _isBusy) : _buildRecordAction();
  }

  Widget _buildRecordingTimer({bool isLoading = false}) {
    return InkWell(
      onTap: isLoading ? () {} : _onStop,
      child: Container(
        constraints: BoxConstraints(minWidth: 80),
        padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFF0000)),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 18,
              height: 18,
              decoration: isLoading
                  ? null
                  : BoxDecoration(color: Color(0xFFFF0000), borderRadius: BorderRadius.circular(3)),
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CircularProgressIndicator(color: Color(0xFFFF0000), strokeWidth: 3),
                    )
                  : null,
            ),

            ValueListenableBuilder(
              valueListenable: _duration,
              builder: (context, value, child) => Text(
                formatDuration(isLoading ? Duration.zero : value),
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey64748B,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordAction() {
    return InkWell(
      onTap: _startRecording,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(AppAssets.icRecord, width: 28, height: 28),
      ),
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
