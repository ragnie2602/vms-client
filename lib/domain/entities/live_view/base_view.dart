enum BaseView {
  v1x1(0, 1, 1),
  v2x2(1, 2, 2),
  v3x3(2, 3, 3),
  v4x4(3, 4, 4),
  v5x5(4, 5, 5),
  v6x6(5, 6, 6);

  final int value;
  final int rows;
  final int columns;

  const BaseView(this.value, this.rows, this.columns);
  int get total => rows * columns;

  static BaseView fromValue(int value) {
    return BaseView.values.firstWhere((view) => view.value == value, orElse: () => BaseView.v1x1);
  }

  static BaseView fitWithLength(int length, {BaseView min = BaseView.v1x1}) {
    BaseView grid = switch (length) {
      <= 1 => BaseView.v1x1,
      <= 4 => BaseView.v2x2,
      <= 9 => BaseView.v3x3,
      <= 16 => BaseView.v4x4,
      <= 25 => BaseView.v5x5,
      _ => BaseView.v6x6,
    };
    if (grid.value < min.value) grid = min;

    return grid;
  }
}
