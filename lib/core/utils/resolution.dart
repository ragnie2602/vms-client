import 'package:flutter/rendering.dart';

enum RoundMode { up, down, nearest }

const COMMON_DISPLAY_RESOLUTIONS = <StandardResolution>[
  // StandardResolution(256, 144), // 144p
  // StandardResolution(320, 180), // 180p
  StandardResolution(426, 240), // 240p
  StandardResolution(640, 360), // 360p
  StandardResolution(854, 480), // 480p
  StandardResolution(960, 540), // qHD
  StandardResolution(1024, 576), // 576p
  StandardResolution(1152, 648), // giữa 720p và 1080p
  StandardResolution(1280, 720), // 720p HD
  StandardResolution(1366, 768), // WXGA HD+
  StandardResolution(1536, 864), // giữa 720p và 1080p
  StandardResolution(1600, 900), // HD+
  StandardResolution(1920, 1080), // Full HD
  StandardResolution(2048, 1152), // 2K gần chuẩn
  StandardResolution(2304, 1296), // giữa 2K và 4K
  StandardResolution(2560, 1440), // 2K QHD
  StandardResolution(3200, 1800), // QHD+
  StandardResolution(3440, 1440), // UW-QHD phổ biến
  StandardResolution(3840, 2160), // 4K UHD
  StandardResolution(4096, 2304), // DCI 4K (tỉ lệ gần 16:9)
  StandardResolution(5120, 2880), // 5K
  StandardResolution(6144, 3240), // 6K
  StandardResolution(7680, 4320), // 8K UHD
  StandardResolution(8192, 4608), // 8K DCI
];

/// Độ phân giải chuẩn/phổ biến
class StandardResolution {
  final int width;
  final int height;
  const StandardResolution(this.width, this.height);

  /// Trả về độ phân giải chuẩn/phổ biến gần nhất theo [RoundMode]
  factory StandardResolution.snapFromSize(Size size, {RoundMode mode = RoundMode.nearest}) {
    final area = size.width * size.height;
    StandardResolution best = COMMON_DISPLAY_RESOLUTIONS.first;
    double bestDiff = double.infinity;

    for (final res in COMMON_DISPLAY_RESOLUTIONS) {
      final resArea = (res.width * res.height).toDouble();

      switch (mode) {
        case RoundMode.up:
          if (resArea >= area && resArea < bestDiff) {
            best = res;
            bestDiff = resArea;
          }
          break;
        case RoundMode.down:
          if (resArea <= area && (area - resArea) < bestDiff) {
            best = res;
            bestDiff = area - resArea;
          }
          break;
        case RoundMode.nearest:
          final diff = (resArea - area).abs();
          if (diff < bestDiff) {
            best = res;
            bestDiff = diff;
          }
          break;
      }
    }

    return best;
  }
}
