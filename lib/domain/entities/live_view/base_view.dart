import 'package:vms_flutter_client/core/constants/assets.dart';

enum ViewMode {
  v1x1(0, 1, 1, AppAssets.icMode1x1),
  v2x2(1, 2, 2, AppAssets.icMode2x2),
  v3x3(2, 3, 3, AppAssets.icMode3x3),
  v4x4(3, 4, 4, AppAssets.icMode4x4),
  v5x5(4, 5, 5, AppAssets.icMode5x5),
  v6x6(5, 6, 6, AppAssets.icMode6x6);

  final int value;
  final int rows;
  final int columns;
  final String icon;

  const ViewMode(this.value, this.rows, this.columns, this.icon);
  int get total => rows * columns;

  static ViewMode fromValue(int value) {
    return ViewMode.values.firstWhere((view) => view.value == value, orElse: () => ViewMode.v1x1);
  }

  static ViewMode fitWithLength(int length, {ViewMode min = ViewMode.v1x1}) {
    ViewMode grid = switch (length) {
      <= 1 => ViewMode.v1x1,
      <= 4 => ViewMode.v2x2,
      <= 9 => ViewMode.v3x3,
      <= 16 => ViewMode.v4x4,
      <= 25 => ViewMode.v5x5,
      _ => ViewMode.v6x6,
    };
    if (grid.value < min.value) grid = min;

    return grid;
  }
}
