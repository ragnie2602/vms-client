part of 'alarm_config_popup.dart';

class ROIAreaConfig extends StatefulWidget {
  const ROIAreaConfig({super.key, this.borderRadius = const Radius.circular(8)});
  final Radius borderRadius;

  @override
  State<ROIAreaConfig> createState() => _ROIAreaConfigState();
}

class _ROIAreaConfigState extends State<ROIAreaConfig> {
  List<PolygonRegion> regions = [];
  bool isDrawing = false;

  // Biến lưu trữ điểm đang được kéo thả
  int? draggingRegionIndex;
  int? draggingPointIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            TitleWithTooltip(
              preferBelow: false,
              title: 'Vùng giám sát (ROI)',
              tooltip:
                  'Hướng dẫn: Nhấn chuột trái để tạo các điểm vẽ.\nNhấn chuột phải ra ngoài vùng vẽ để hoàn tất.',
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  isDrawing = !isDrawing;
                  if (isDrawing) {
                    regions.add(PolygonRegion(points: []));
                  } else if (regions.last.points.length < 3) {
                    regions.removeLast();
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isDrawing ? Color(0xFFEF6666) : Color(0xFFDCEEFD),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      AppAssets.icEdit2,
                      width: 16,
                      height: 16,
                      colorFilter: isDrawing
                          ? ColorFilter.mode(Colors.grey.shade50, BlendMode.srcIn)
                          : null,
                    ),
                    SizedBox(width: 2),
                    Text(
                      !isDrawing ? 'Vẽ vùng' : 'Kết thúc',
                      style: AppTypography.style(
                        12,
                        fontWeight: FontWeight.w500,
                        color: isDrawing ? Colors.grey.shade50 : Color(0xFF005AA9),
                        lineHeight: 16 / 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        /*  */
        SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            final double maxHeight = 285.0;

            return SizedBox(
              width: maxWidth,
              height: maxHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Listener(
                    behavior: HitTestBehavior.opaque,
                    onPointerDown: (event) {
                      if (event.kind != PointerDeviceKind.mouse || !isDrawing) return;

                      // 1. Logic Kết thúc vẽ (Chuột phải)
                      if (event.buttons == kSecondaryMouseButton) {
                        setState(() => isDrawing = false);
                        return;
                      }

                      // 2. Kiểm tra xem có nhấn vào điểm nào hiện có để KÉO THẢ không
                      for (int r = 0; r < regions.length; r++) {
                        for (int p = 0; p < regions[r].points.length; p++) {
                          final point = regions[r].points[p];
                          // Kiểm tra khoảng cách chuột đến điểm (bán kính tương tác là 15)
                          if ((event.localPosition - point).distance < 15) {
                            setState(() {
                              draggingRegionIndex = r;
                              draggingPointIndex = p;
                            });
                            return;
                          }
                        }
                      }

                      // 3. Nếu đang ở mode vẽ và không nhấn vào điểm cũ -> Thêm điểm mới
                      if (isDrawing && event.buttons == kPrimaryMouseButton) {
                        print(event.localPosition);
                        setState(() => regions.last.points.add(event.localPosition));
                      }
                    },
                    onPointerMove: (event) {
                      if (draggingRegionIndex != null && draggingPointIndex != null) {
                        setState(() {
                          final size = Size(maxWidth, maxHeight);
                          final double r = widget.borderRadius.x / 2;

                          Offset pos = event.localPosition;

                          // 1. Giới hạn cơ bản trong hình chữ nhật
                          double x = pos.dx.clamp(0.0, size.width);
                          double y = pos.dy.clamp(0.0, size.height);

                          // 2. Tinh chỉnh logic cho 4 góc bo tròn
                          // Góc trên bên trái
                          if (x < r && y < r) {
                            pos = _clampToCorner(Offset(x, y), Offset(r, r), r);
                          }
                          // Góc trên bên phải
                          else if (x > size.width - r && y < r) {
                            pos = _clampToCorner(Offset(x, y), Offset(size.width - r, r), r);
                          }
                          // Góc dưới bên trái
                          else if (x < r && y > size.height - r) {
                            pos = _clampToCorner(Offset(x, y), Offset(r, size.height - r), r);
                          }
                          // Góc dưới bên phải
                          else if (x > size.width - r && y > size.height - r) {
                            pos = _clampToCorner(
                              Offset(x, y),
                              Offset(size.width - r, size.height - r),
                              r,
                            );
                          } else {
                            pos = Offset(x, y);
                          }

                          regions[draggingRegionIndex!].points[draggingPointIndex!] = pos;
                        });
                      }
                    },
                    onPointerUp: (event) {
                      if (draggingPointIndex == null && draggingRegionIndex == null) return;

                      // Reset trạng thái kéo
                      setState(() {
                        draggingRegionIndex = null;
                        draggingPointIndex = null;
                      });
                    },
                    child: CustomPaint(
                      size: Size(maxWidth, maxHeight),
                      painter: DashPolygonPainter(
                        regions: regions,
                        dashBorderRadius: widget.borderRadius,
                      ),
                    ),
                  ),

                  if (!isDrawing)
                    ...regions.mapIndexed((idx, region) {
                      // Tính toán vị trí: lấy điểm đầu tiên và đẩy vào trong 20px
                      final buttonPos = _getInwardPosition(region.points, 20);

                      return Positioned(
                        left: buttonPos.dx - 8, // child / 2
                        top: buttonPos.dy - 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => regions.removeAt(idx));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(3),
                            child: Icon(Icons.close, color: Colors.white, size: 12),
                          ),
                        ),
                      );
                    }),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Offset _getInwardPosition(List<Offset> points, double offsetDistance) {
    if (points.length < 3) return points.first;

    // Lấy 3 điểm: điểm cuối, điểm đầu, và điểm thứ hai để tính góc tại điểm đầu
    final pPrev = points.last;
    final pCurrent = points.first;
    final pNext = points[1];

    // Tính vector của 2 cạnh kề
    Offset v1 = (pPrev - pCurrent);
    v1 = v1 / v1.distance;
    Offset v2 = (pNext - pCurrent);
    v2 = v2 / v2.distance;

    // Vector trung vị (bisector)
    Offset bisector = v1 + v2;
    if (bisector.distance == 0) return pCurrent; // Trường hợp 2 cạnh thẳng hàng

    bisector = bisector / bisector.distance;

    // Đẩy nút vào trong một khoảng offsetDistance
    // Lưu ý: Tùy vào hướng vẽ (xuôi/ngược chiều kim đồng hồ),
    // ta có thể cần đảo dấu bisector nếu nó đang đẩy ra ngoài.
    return pCurrent + (bisector * offsetDistance);
  }

  Offset _clampToCorner(Offset point, Offset center, double radius) {
    final Offset direction = point - center;
    final double distance = direction.distance;

    // Nếu điểm nằm ngoài khoảng cách bán kính của tâm góc
    if (distance > radius) {
      // Ép điểm nằm trên đường tròn của góc bo
      return center + (direction / distance) * radius;
    }
    return point;
  }
}

class PolygonRegion {
  List<Offset> points;

  /* Config */
  final List<double> dashArray;
  final Color mainColor;
  final double circleRadius;
  final double circleBorderWidth;
  final double dashWidth;

  PolygonRegion({
    required this.points,
    this.dashArray = const [6, 5],
    this.mainColor = const Color(0xFFEF4444),
    this.circleRadius = 5,
    this.circleBorderWidth = 2,
    this.dashWidth = 2,
  });

  @override
  String toString() {
    return 'PolygonRegion(points: $points)';
  }
}

class DashPolygonPainter extends CustomPainter {
  final List<PolygonRegion> regions;
  final Color dashBorderColor;
  final Radius dashBorderRadius;
  final List<double> dashArray;

  DashPolygonPainter({
    required this.regions,
    this.dashBorderColor = const Color(0xFFD1D5D8),
    this.dashBorderRadius = const Radius.circular(8),
    this.dashArray = const [6, 4],
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawOuterDashBorder(canvas, size);

    if (regions.isEmpty) return;

    for (var region in regions) {
      final points = region.points;

      // --- 1. LẤY CẤU HÌNH TỪ REGION ---
      final double outerRadius = region.circleRadius;
      final double innerRadius = region.circleRadius - region.circleBorderWidth;
      final double lineWidth = region.dashWidth;
      final Color color = region.mainColor;

      // --- 2. SETUP PAINT ---
      final shadowPaint = Paint()
        ..color = Colors.black.withValues(alpha: 0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      final pointOuterPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      final pointInnerPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      if (points.length > 1) {
        final linePaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round;

        final fillPaint = Paint()
          ..color = color.withValues(alpha: 0.2)
          ..style = PaintingStyle.fill;

        // --- 3. VẼ VÙNG (FILL & BORDER) ---
        // A. Tô màu nền
        final fillPath = Path()..moveTo(points[0].dx, points[0].dy);
        for (int i = 1; i < points.length; i++) {
          fillPath.lineTo(points[i].dx, points[i].dy);
        }
        fillPath.close();
        canvas.drawPath(fillPath, fillPaint);

        // B. Vẽ nét đứt đồng đều cho từng cạnh
        final dynamicDashedPath = Path();
        for (int i = 0; i < points.length; i++) {
          final p1 = points[i];
          final p2 = points[(i + 1) % points.length];

          final segment = Path()
            ..moveTo(p1.dx, p1.dy)
            ..lineTo(p2.dx, p2.dy);

          _addProportionalDash(dynamicDashedPath, segment, region.dashArray, outerRadius);
        }
        canvas.drawPath(dynamicDashedPath, linePaint);
      }

      // --- 4. VẼ CÁC ĐIỂM CHỐT ---
      for (var point in points) {
        // Vẽ đổ bóng nhẹ cho điểm
        canvas.drawCircle(point.translate(0, 2), outerRadius, shadowPaint);
        // Vẽ viền ngoài (màu chính)
        canvas.drawCircle(point, outerRadius, pointOuterPaint);
        // Vẽ nhân trắng bên trong
        canvas.drawCircle(point, innerRadius, pointInnerPaint);
      }
    }
  }

  /// Hàm vẽ đường viền bao quanh toàn bộ khung
  void _drawOuterDashBorder(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = dashBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Tạo Path cho hình chữ nhật bo góc 8px (khớp với ClipRRect)
    final RRect rrect = RRect.fromLTRBR(0, 0, size.width, size.height, dashBorderRadius);
    final Path path = Path()..addRRect(rrect);

    final Path dashedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      int index = 0;
      bool draw = true; // Trạng thái: vẽ nét hay để trống

      while (distance < metric.length) {
        // Lấy độ dài phần tử hiện tại trong dashArray (xoay vòng index)
        double currentLen = dashArray[index % dashArray.length];

        if (draw) {
          // Chỉ thêm vào path nếu đang ở trạng thái vẽ
          dashedPath.addPath(metric.extractPath(distance, distance + currentLen), Offset.zero);
        }

        distance += currentLen;
        draw = !draw; // Đảo trạng thái: Vẽ -> Nghỉ -> Vẽ...
        index++;
      }
    }

    canvas.drawPath(dashedPath, borderPaint);
  }

  /// Hàm tạo nét đứt Dynamic
  /// Tự động co giãn kích thước nét và khoảng nghỉ để chia đều đoạn thẳng
  void _addProportionalDash(Path destPath, Path segment, List<double> dashArray, double radius) {
    for (final PathMetric metric in segment.computeMetrics()) {
      final totalLength = metric.length;

      // 1. Tính không gian khả dụng (Trừ đi bán kính 2 đầu)
      // Đây là khoảng cách mép-đến-mép giữa 2 điểm tròn
      final availableLength = totalLength - (radius * 2);

      if (availableLength <= 0) continue;

      // Lấy config gốc
      final double baseDash = dashArray[0];
      final double baseSpace = dashArray.length > 1 ? dashArray[1] : baseDash;

      // 2. Tính số lượng nét đứt (N) lý tưởng
      // Công thức: Chúng ta cần N nét đứt và (N+1) khoảng nghỉ (để 2 đầu đều là khoảng nghỉ)
      // Tổng dài ước lượng = N*dash + (N+1)*space
      // => N*(dash+space) + space = Available
      // => N = (Available - space) / (dash + space)
      int n = ((availableLength - baseSpace) / (baseDash + baseSpace)).round();

      // Đảm bảo ít nhất vẽ được 1 nét nếu có đủ chỗ
      if (n < 1) n = 1;

      // 3. Tính toán lại kích thước Dash và Space mới (Dynamic resizing)
      // Hệ phương trình:
      // (1) n * newDash + (n + 1) * newSpace = availableLength
      // (2) newDash / newSpace = baseDash / baseSpace (Giữ nguyên tỷ lệ hình dáng)

      // Từ (2) => newDash = newSpace * (baseDash / baseSpace)
      // Thay vào (1):
      // n * newSpace * (baseDash/baseSpace) + (n+1) * newSpace = availableLength
      // newSpace * [ n * (baseDash/baseSpace) + n + 1 ] = availableLength

      final double ratio = baseDash / baseSpace;
      final double newSpace = availableLength / (n * ratio + n + 1);
      final double newDash = newSpace * ratio;

      // 4. Vẽ
      // Bắt đầu vẽ từ vị trí: Radius + newSpace (Khoảng nghỉ đầu tiên)
      double currentPos = radius + newSpace;

      for (int i = 0; i < n; i++) {
        destPath.addPath(metric.extractPath(currentPos, currentPos + newDash), Offset.zero);
        // Nhảy đến nét tiếp theo
        currentPos += newDash + newSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashPolygonPainter oldDelegate) => true;
}
