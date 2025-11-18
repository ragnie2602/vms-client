import 'package:flutter/material.dart';

extension IterableExt<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    var index = 0;
    for (var element in this) {
      yield convert(index++, element);
    }
  }

  T? get firstOrNull {
    var iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension StringExt on String {
  String get capitalizeFirstLetter => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
}

extension Matrix4Ext on Matrix4 {
  /// Nội suy tuyến tính vào ma trận hiện tại (this) tới [other]
  void lerpTo(Matrix4 other, double t) {
    final s = storage;
    final o = other.storage;
    for (int i = 0; i < 16; i++) {
      s[i] += (o[i] - s[i]) * t;
    }
  }

  /// Trả về ma trận mới lerp giữa this và [other]
  Matrix4 lerp(Matrix4 other, double t) {
    final result = Matrix4.zero();
    final r = result.storage;
    final s = storage;
    final o = other.storage;
    for (int i = 0; i < 16; i++) {
      r[i] = s[i] + (o[i] - s[i]) * t;
    }
    return result;
  }

  Matrix4 clampMatrixToBounds(Size size) {
    final double scale = getMaxScaleOnAxis();
    final Offset translation = Offset(row0[3], row1[3]);

    final double scaledWidth = size.width * scale;
    final double scaledHeight = size.height * scale;

    double dx = translation.dx;
    double dy = translation.dy;

    // 🔹 Giữ 4 góc không out khỏi viewport
    if (scaledWidth >= size.width) {
      final double minX = size.width - scaledWidth;
      final double maxX = 0;
      dx = dx.clamp(minX, maxX);
    } else {
      // Nếu ảnh nhỏ hơn viewport → căn giữa
      dx = (size.width - scaledWidth) / 2;
    }

    if (scaledHeight >= size.height) {
      final double minY = size.height - scaledHeight;
      final double maxY = 0;
      dy = dy.clamp(minY, maxY);
    } else {
      dy = (size.height - scaledHeight) / 2;
    }

    final Matrix4 result = clone();
    result.setEntry(0, 3, dx);
    result.setEntry(1, 3, dy);
    return result;
  }
}
