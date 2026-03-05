import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';

class ImportProgressDialog extends StatefulWidget {
  final IObjectGroupRepository repository;
  final int importId;

  const ImportProgressDialog({
    super.key,
    required this.repository,
    required this.importId,
  });

  @override
  State<ImportProgressDialog> createState() => _ImportProgressDialogState();
}

class _ImportProgressDialogState extends State<ImportProgressDialog> {
  Timer? _pollTimer;
  String _statusText = 'Đang import dữ liệu...';
  double _progress = 0;
  bool _isCompleted = false;
  bool _hasError = false;
  String? _errorMessage;
  int _totalRecords = 0;
  int _processedRecords = 0;

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  void _startPolling() {
    // Poll immediately first
    _pollStatus();
    // Then poll every 10 seconds
    _pollTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!_isCompleted && !_hasError) {
        _pollStatus();
      }
    });
  }

  Future<void> _pollStatus() async {
    try {
      final status = await widget.repository.getImportStatus(widget.importId);
      if (!mounted) return;

      final state = (status['status'] ?? status['state'] ?? '')
          .toString()
          .toUpperCase();
      final total = status['totalRecords'] ?? status['total'] ?? 0;
      final processed = status['processedRecords'] ?? status['processed'] ?? 0;
      final error = status['error'] ?? status['message'];

      setState(() {
        _totalRecords = total is int
            ? total
            : int.tryParse(total.toString()) ?? 0;
        _processedRecords = processed is int
            ? processed
            : int.tryParse(processed.toString()) ?? 0;

        if (_totalRecords > 0) {
          _progress = _processedRecords / _totalRecords;
        }

        if (state == 'COMPLETED' || state == 'DONE' || state == 'SUCCESS') {
          _isCompleted = true;
          _statusText =
              'Import hoàn tất! ($_processedRecords/$_totalRecords bản ghi)';
          _progress = 1.0;
          _pollTimer?.cancel();
        } else if (state == 'FAILED' || state == 'ERROR') {
          _hasError = true;
          _errorMessage = error?.toString() ?? 'Đã xảy ra lỗi';
          _statusText = 'Import thất bại';
          _pollTimer?.cancel();
        } else {
          // Still processing
          if (_totalRecords > 0) {
            _statusText =
                'Đang xử lý: $_processedRecords/$_totalRecords bản ghi';
          } else {
            _statusText = 'Đang import dữ liệu...';
          }
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _errorMessage = e.toString();
        _statusText = 'Không thể lấy trạng thái import';
        _pollTimer?.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Icon(
                _isCompleted
                    ? Icons.check_circle
                    : _hasError
                    ? Icons.error
                    : Icons.cloud_upload,
                size: 48,
                color: _isCompleted
                    ? Colors.green
                    : _hasError
                    ? Colors.red
                    : AppColors.secondary,
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                _isCompleted
                    ? 'Import thành công'
                    : _hasError
                    ? 'Import thất bại'
                    : 'Đang import...',
                style: AppTypography.style(
                  16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey334155,
                ),
              ),
              const SizedBox(height: 12),

              // Status text
              Text(
                _statusText,
                textAlign: TextAlign.center,
                style: AppTypography.style(14, color: AppColors.grey64748B),
              ),
              const SizedBox(height: 16),

              // Progress bar
              if (!_hasError) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: _isCompleted
                        ? 1.0
                        : (_progress > 0 ? _progress : null),
                    minHeight: 8,
                    backgroundColor: AppColors.greyE2E8F0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _isCompleted ? Colors.green : AppColors.secondary,
                    ),
                  ),
                ),
                if (_totalRecords > 0) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${(_progress * 100).toInt()}%',
                    style: AppTypography.style(12, color: AppColors.grey64748B),
                  ),
                ],
                const SizedBox(height: 16),
              ],

              // Error message
              if (_hasError && _errorMessage != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _errorMessage!,
                    style: AppTypography.style(12, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Close button (only when completed or error)
              if (_isCompleted || _hasError)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, _isCompleted),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isCompleted
                          ? AppColors.secondary
                          : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Đóng',
                      style: AppTypography.style(
                        14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
