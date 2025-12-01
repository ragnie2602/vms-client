enum OSDPosition {
  bottomLeft("Góc dưới - bên trái", 1),
  bottomRight("Góc dưới - bên phải", 3),
  topLeft("Góc trên - bên trái", 0),
  topRight("Góc trên - bên phải", 2),
  none("Không hiển thị", -1);

  final String name;
  final int value;

  const OSDPosition(this.name, this.value);
}
