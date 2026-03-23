import 'dart:math';

import 'package:flutter/material.dart';

extension IntExtensions on int {
  String get readableBytes {
    // 1. Xử lý trường hợp <= 0
    if (this <= 0) return '0 B';

    // 2. Định nghĩa các đơn vị
    const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];

    // 3. Tính toán index của đơn vị dựa trên logarit cơ số 1024
    // Thay vì dùng vòng lặp while, dùng logarit sẽ nhanh và toán học hơn
    int digitGroups = (log(this) / log(1024)).floor();

    // Đảm bảo không vượt quá mảng units (phòng trường hợp số quá lớn)
    if (digitGroups >= units.length) {
      digitGroups = units.length - 1;
    }

    // 4. Tính giá trị rút gọn
    final double value = this / pow(1024, digitGroups);

    // 5. Format chuỗi
    // Nếu là Bytes (digitGroups == 0) thì không lấy số thập phân
    if (digitGroups == 0) {
      return '${value.toInt()} ${units[digitGroups]}';
    }

    // Các đơn vị khác: Lấy 2 số thập phân, nhưng xoá .00 hoặc số 0 thừa ở cuối
    // toStringAsFixed(2) -> "1.50" -> xoá số 0 cuối -> "1.5"
    String result = value.toStringAsFixed(2);

    // Logic xoá số 0 thừa:
    // Nếu kết thúc bằng ".00" -> bỏ hết ".00"
    // Nếu kết thúc bằng "0" (như 1.50) -> bỏ số "0" cuối
    if (result.endsWith('.00')) {
      result = result.substring(0, result.length - 3);
    } else if (result.endsWith('0') && result.contains('.')) {
      result = result.substring(0, result.length - 1);
    }

    return '$result ${units[digitGroups]}';
  }
}

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
