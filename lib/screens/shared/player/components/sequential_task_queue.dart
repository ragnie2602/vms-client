import 'dart:async';

/// Queue async:
/// - Thực hiện tuần tự từng job (FIFO).
/// - Không giới hạn số job trong queue.
/// - Không chạy song song: job sau luôn đợi job trước xong.
class SequentialTaskQueue {
  final List<Future<void> Function()> _queue = [];

  bool _isRunning = false;
  bool _isCancelling = false;
  bool _isDisposed = false;
  Completer<void>? _cancelCompleter;

  /// Queue rỗng (không có job chờ, và không có job đang chạy).
  bool get isEmpty => _queue.isEmpty && !_isRunning;

  /// Số job đang chờ (không tính job đang chạy).
  int get pendingCount => _queue.length;

  /// Thêm 1 job vào queue.
  /// - Job sẽ luôn được chạy theo thứ tự FIFO (trừ khi bị cancel/ reset trước khi đến lượt).
  /// - Nếu đang idle, job chạy ngay.
  Future<void> add(Future<void> Function() job) async {
    if (_isDisposed) return;

    // Nếu đang trong quá trình cancel, đợi cancel xong rồi mới add
    if (_isCancelling) {
      await _cancelCompleter?.future;
      if (_isDisposed) return;
    }

    _queue.add(job);

    // Nếu không có job nào đang chạy, bắt đầu chạy queue
    if (!_isRunning) {
      _runNext();
    }
  }

  /// Hủy toàn bộ job (cả đang chạy và các job kế), reset trạng thái queue.
  /// Lưu ý: không thể thực sự "kill" Future đang chạy, chỉ ngăn job tiếp theo chạy.
  Future<void> cancelAndReset() async {
    if (_isDisposed || _isCancelling) return;

    _isCancelling = true;
    _cancelCompleter = Completer<void>();

    // Xóa hết job đang chờ
    _queue.clear();
    _isRunning = false;

    // Cho phép các async microtask đang pending thoát ra
    await Future.microtask(() {});

    _isCancelling = false;
    _cancelCompleter?.complete();
    _cancelCompleter = null;
  }

  /// Hủy job hiện tại và các job kế (nhưng vẫn có thể add job mới sau đó).
  /// Về thực tế giống cancelAndReset trong bối cảnh không "kill" được Future.
  Future<void> cancel() async {
    if (_isDisposed || _isCancelling) return;

    _isCancelling = true;
    _cancelCompleter = Completer<void>();

    _queue.clear();
    _isRunning = false;

    await Future.microtask(() {});

    _isCancelling = false;
    _cancelCompleter?.complete();
    _cancelCompleter = null;
  }

  /// Dọn dẹp queue và ngăn không cho add job mới.
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;

    await cancelAndReset();
    _queue.clear();
  }

  /// Chạy tuần tự: job hiện tại -> job tiếp theo nếu có.
  void _runNext() async {
    // Nếu đang chạy, đang cancel hoặc disposed thì không làm gì
    if (_isRunning || _isCancelling || _isDisposed) return;

    _isRunning = true;

    try {
      while (_queue.isNotEmpty && !_isCancelling && !_isDisposed) {
        final job = _queue.removeAt(0);

        try {
          await job();
        } catch (_) {
          // Có thể log error nếu muốn, hiện tại nuốt lỗi để không chặn queue
        }

        // Nếu trong khi chạy job mà bị dispose hoặc cancel → dừng luôn
        if (_isCancelling || _isDisposed) {
          break;
        }
      }
    } finally {
      _isRunning = false;
    }
  }
}
