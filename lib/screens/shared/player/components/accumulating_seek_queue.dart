import 'dart:async';

/// Queue chuyên dụng cho Seek cộng dồn.
/// - Nếu đang rảnh: Chạy ngay.
/// - Nếu đang bận: Cộng dồn các giá trị add vào thành một cục.
/// - Khi xong job hiện tại: Lấy cục đã cộng dồn ra chạy 1 lần duy nhất.
class AccumulatingSeekQueue {
  /// Hàm thực thi seek thực tế (được truyền từ bên ngoài vào).
  final Future<void> Function(Duration offset) onSeek;

  AccumulatingSeekQueue({required this.onSeek});

  /// Tổng thời gian đang chờ để seek tiếp theo.
  Duration _pendingOffset = Duration.zero;

  bool _isRunning = false;
  bool _isDisposed = false;

  /// Thêm một yêu cầu seek.
  /// [offset]: Thời gian muốn seek (ví dụ: +30s, -10s).
  void add(Duration offset) {
    if (_isDisposed) return;

    // 1. Nếu đang chạy, chỉ cộng dồn vào biến pending, KHÔNG chạy ngay.
    if (_isRunning) {
      _pendingOffset += offset;
      return;
    }

    // 2. Nếu đang rảnh, bắt đầu chạy với offset hiện tại.
    _run(offset);
  }

  /// Hủy các yêu cầu đang chờ (pending).
  /// Job đang chạy dở vẫn sẽ chạy cho đến khi xong (không thể kill Future).
  void cancelPending() {
    _pendingOffset = Duration.zero;
  }

  void dispose() {
    _isDisposed = true;
    _pendingOffset = Duration.zero;
  }

  /// Vòng lặp xử lý logic
  Future<void> _run(Duration offset) async {
    if (_isDisposed) return;

    _isRunning = true;

    try {
      // Thực hiện seek
      await onSeek(offset);
    } catch (_) {
    } finally {
      // Sau khi seek xong job hiện tại...

      if (!_isDisposed && _pendingOffset != Duration.zero) {
        // ...Nếu có dữ liệu đang chờ (được cộng dồn trong lúc chạy):
        // Lấy giá trị đó ra, reset pending về 0, và chạy tiếp đợt mới.
        final nextOffset = _pendingOffset;
        _pendingOffset = Duration.zero;

        // Đệ quy: Chạy tiếp với giá trị tổng
        _run(nextOffset);
      } else {
        // ...Nếu không còn gì chờ, đánh dấu là rảnh.
        _isRunning = false;
      }
    }
  }
}
