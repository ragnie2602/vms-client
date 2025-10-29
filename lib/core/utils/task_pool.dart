import 'dart:async';
import 'dart:collection';

/// Chạy tối đa [maxConcurrent] task cùng lúc, còn lại đợi có slot trống thì chạy tiếp
class TaskPool {
  static final TaskPool _instance = TaskPool._internal();
  static TaskPool get instance => _instance;

  TaskPool._internal({int maxConcurrent = 6}) : _maxConcurrent = maxConcurrent;

  int _maxConcurrent = 6;
  int get maxConcurrent => _maxConcurrent;
  set maxConcurrent(int value) {
    if (value < 1) throw ArgumentError('maxConcurrent must be >= 1');
    _maxConcurrent = value;
    _tryRunNext(); // kích hoạt thêm task nếu cần
  }

  final _queue = Queue<Future Function()>();
  int _running = 0;

  Completer<void>? _idleCompleter;

  /// Thêm task mới vào queue và chạy ngay/đợi có slot
  Future<T> add<T>(Future<T> Function() task) {
    final completer = Completer<T>();
    _queue.add(() async {
      try {
        final result = await task();
        completer.complete(result);
      } catch (e, s) {
        completer.completeError(e, s);
      } finally {
        _running--;
        _tryRunNext();

        // Nếu không còn task nào => hoàn thành idleCompleter (nếu có)
        if (_running == 0 && _queue.isEmpty) {
          _idleCompleter?.complete();
          _idleCompleter = null;
        }
      }
    });
    _tryRunNext();
    return completer.future;
  }

  /// Đợi đến khi tất cả task hoàn tất
  Future<void> get onIdle async {
    if (_running == 0 && _queue.isEmpty) return;
    _idleCompleter ??= Completer<void>();
    await _idleCompleter!.future;
  }

  void _tryRunNext() {
    while (_running < _maxConcurrent && _queue.isNotEmpty) {
      final task = _queue.removeFirst();
      _running++;
      Future.microtask(task);
    }
  }

  /// Cancel các task đang chờ
  void clean() {
    _queue.clear();
  }
}
