enum BaseView {
  v1x1(0),
  v2x2(1),
  v3x3(2),
  v4x4(3),
  v5x5(4),
  v6x6(5);

  final int value;

  const BaseView(this.value);

  static BaseView fromValue(int value) {
    return BaseView.values.firstWhere(
      (view) => view.value == value,
      orElse: () => BaseView.v1x1,
    );
  }
}
