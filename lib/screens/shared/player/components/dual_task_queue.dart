import 'dart:async';

/// Queue async chỉ duy trì tối đa 2 job:
/// - 1 job đang chạy.
/// - 1 job kế tiếp (job mới nhất, các job trước đó bị bỏ).
class DualTaskQueue {
  Future<void> Function()? _currentJob;
  Future<void> Function()? _nextJob;
  bool _isRunning = false;
  bool _isCancelling = false;
  bool _isDisposed = false;
  Completer<void>? _cancelCompleter;

  bool get nextJobIsEmpty => _nextJob == null;

  /// Thêm 1 job vào queue.
  /// - Nếu đang chạy, job này sẽ thay thế job kế tiếp hiện tại.
  /// - Nếu idle, job chạy ngay.
  Future<void> add(Future<void> Function() job) async {
    if (_isDisposed) return;
    if (_isCancelling) await _cancelCompleter?.future;

    if (_isRunning) {
      // 🔹 Giữ lại job mới nhất, bỏ các job trước đó
      _nextJob = job;
      return;
    }

    _currentJob = job;
    _runNext();
  }

  /// Hủy toàn bộ job (cả đang chạy và kế tiếp), reset trạng thái.
  Future<void> cancelAndReset() async {
    if (_isDisposed || _isCancelling) return;
    _isCancelling = true;
    _cancelCompleter = Completer<void>();

    _currentJob = null;
    _nextJob = null;
    _isRunning = false;

    // Cho phép các async đang pending thoát ra
    await Future.microtask(() {});
    _isCancelling = false;

    _cancelCompleter?.complete();
    _cancelCompleter = null;
  }

  /// Hủy job hiện tại và job kế (nhưng vẫn có thể add lại sau).
  Future<void> cancel() async {
    if (_isDisposed || _isCancelling) return;
    _isCancelling = true;
    _cancelCompleter = Completer<void>();

    _nextJob = null;
    _currentJob = null;
    _isRunning = false;

    await Future.microtask(() {});
    _isCancelling = false;

    _cancelCompleter?.complete();
    _cancelCompleter = null;
  }

  /// Dọn dẹp queue và ngăn add mới.
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;

    await cancelAndReset();
    _nextJob = null;
    _currentJob = null;
  }

  /// Chạy tuần tự: job hiện tại -> job kế nếu có.
  void _runNext() async {
    if (_isRunning || _currentJob == null || _isCancelling || _isDisposed) return;
    _isRunning = true;

    final job = _currentJob!;
    _currentJob = null;

    try {
      await job();
    } finally {
      _isRunning = false;

      if (!_isCancelling && !_isDisposed && _nextJob != null) {
        // 🔹 Nếu có job kế, chạy tiếp
        _currentJob = _nextJob;
        _nextJob = null;
        _runNext();
      }
    }
  }
}
