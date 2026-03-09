import 'dart:async';
import 'package:vms_flutter_client/core/utils/logger.dart';

class AsyncDelayQueue {
  Duration delay;
  final List<Future<void> Function()> _queue = [];
  bool _isProcessing = false;
  bool _isDisposed = false;

  AsyncDelayQueue({required this.delay});

  int get pendingCount => _queue.length;

  /// Cập nhật thời gian delay giữa các task
  void updateDelay(Duration newDelay) {
    delay = newDelay;
  }

  /// Thêm task vào hàng đợi. Không trả về Future nữa.
  void add(Future<void> Function() task) {
    if (_isDisposed) return; // Nếu đã dispose thì từ chối nhận thêm task

    _queue.add(task);
    _processQueue();
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    while (_queue.isNotEmpty) {
      if (_isDisposed) {
        _queue.clear();
        break;
      }

      // Rút task đầu tiên ra
      final task = _queue.removeAt(0);

      try {
        await task();
      } catch (e, stack) {
        // Bắt lỗi tại đây để đảm bảo hàng đợi KHÔNG BỊ CHẾT nếu có 1 task lỗi
        Logger.error('Lỗi khi chạy task trong AsyncDelayQueue: $e\n$stack');
      }

      // Nghỉ một nhịp trước khi chạy task tiếp theo
      if (_queue.isNotEmpty && !_isDisposed) {
        await Future.delayed(delay);
      }
    }

    _isProcessing = false;
  }

  /// Xóa sạch các task đang chờ (task đang chạy dở sẽ chạy nốt)
  void clean() {
    _queue.clear();
  }

  /// Khóa vĩnh viễn và dọn dẹp hàng đợi
  void dispose() {
    _isDisposed = true;
    _queue.clear();
  }
}
