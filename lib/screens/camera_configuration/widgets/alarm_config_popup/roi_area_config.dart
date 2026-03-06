part of 'alarm_config_popup.dart';

class ROIAreaConfig extends StatefulWidget {
  const ROIAreaConfig({
    super.key,
    this.borderRadius = const Radius.circular(8),
    required this.alarmConfig,
    required this.cameraSource,
  });
  final Radius borderRadius;
  final AIAlarmConfig alarmConfig;
  final String cameraSource;

  @override
  State<ROIAreaConfig> createState() => _ROIAreaConfigState();
}

class _ROIAreaConfigState extends State<ROIAreaConfig> {
  int drawingRegionIndex = -1;
  bool _isDrawing = false;
  bool get isDrawing => _isDrawing;
  set isDrawing(bool value) {
    _isDrawing = value;
    if (isDrawing) {
      widget.alarmConfig.rois.add(ROIConfig(points: []));
    } else if (widget.alarmConfig.rois.last.points.length < 3) {
      widget.alarmConfig.rois.removeLast();
    }
  }

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
              onTap: () => setState(() => isDrawing = !isDrawing),
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
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(0.5),
                    width: maxWidth,
                    height: maxHeight,
                    child: VideoThumbnail(
                      source: widget.cameraSource,
                      borderRadius: 8,
                      fit: BoxFit.fill,
                    ),
                  ),

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
                      for (int r = 0; r < widget.alarmConfig.rois.length; r++) {
                        for (int p = 0; p < widget.alarmConfig.rois[r].points.length; p++) {
                          final point = widget.alarmConfig.rois[r].points[p];
                          final offset = Offset(point.x * maxWidth, point.y * maxHeight);
                          // Kiểm tra khoảng cách chuột đến điểm (bán kính tương tác là 15)
                          if ((event.localPosition - offset).distance < 15) {
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
                        setState(
                          () => widget.alarmConfig.rois.last.points.add(
                            ROIData(
                              x: event.localPosition.dx / maxWidth,
                              y: event.localPosition.dy / maxHeight,
                              seq: widget.alarmConfig.rois.last.points.length + 1,
                            ),
                          ),
                        );
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

                          widget
                              .alarmConfig
                              .rois[draggingRegionIndex!]
                              .points[draggingPointIndex!] = ROIData(
                            x: pos.dx / maxWidth,
                            y: pos.dy / maxHeight,
                            seq: widget
                                .alarmConfig
                                .rois[draggingRegionIndex!]
                                .points[draggingPointIndex!]
                                .seq,
                          );
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
                        rois: widget.alarmConfig.rois,
                        dashBorderRadius: widget.borderRadius,
                        dashBorderColor: Color(0xFF0F172A),
                      ),
                    ),
                  ),

                  if (!isDrawing)
                    ...widget.alarmConfig.rois.mapIndexed((idx, region) {
                      // Tính toán vị trí: lấy điểm đầu tiên và đẩy vào trong 20px
                      final buttonPos = _getInwardPosition(
                        region.points,
                        20,
                        Size(maxWidth, maxHeight),
                      );

                      return Positioned(
                        left: buttonPos.dx - 8, // child / 2
                        top: buttonPos.dy - 8,
                        child: InkWell(
                          onTap: () {
                            setState(() => widget.alarmConfig.rois.removeAt(idx));
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

  Offset _getInwardPosition(List<ROIData> points, double offsetDistance, Size areaSize) {
    if (points.length < 3) {
      return Offset(points.first.x * areaSize.width, points.first.y * areaSize.height);
    }

    // Lấy 3 điểm: điểm cuối, điểm đầu, và điểm thứ hai để tính góc tại điểm đầu
    final pPrev = Offset(points.last.x * areaSize.width, points.last.y * areaSize.height);
    final pCurrent = Offset(points.first.x * areaSize.width, points.first.y * areaSize.height);
    final pNext = Offset(points[1].x * areaSize.width, points[1].y * areaSize.height);

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

class DashPolygonPainter extends CustomPainter {
  final List<ROIConfig> rois;

  /* Border */
  final Color dashBorderColor;
  final Radius dashBorderRadius;
  final List<double> dashBorderArray;

  /* Region */
  final List<double> dashArray;
  final Color mainColor;
  final double circleRadius;
  final double circleBorderWidth;
  final double dashWidth;

  DashPolygonPainter({
    required this.rois,
    this.dashBorderColor = const Color(0xFFD1D5D8),
    this.dashBorderRadius = const Radius.circular(8),
    this.dashBorderArray = const [6, 4],

    this.dashArray = const [6, 5],
    this.mainColor = const Color(0xFFEF4444),
    this.circleRadius = 5,
    this.circleBorderWidth = 2,
    this.dashWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawOuterDashBorder(canvas, size);

    if (rois.isEmpty) return;

    for (var roi in rois) {
      List<ROIData> points = roi.points;

      // Sắp xếp theo thứ tự seq
      points.sort((a, b) => a.seq.compareTo(b.seq));

      // --- 1. LẤY CẤU HÌNH TỪ REGION ---
      final double outerRadius = circleRadius;
      final double innerRadius = circleRadius - circleBorderWidth;
      final double lineWidth = dashWidth;
      final Color color = mainColor;

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
        final fillPath = Path()..moveTo(points[0].x * size.width, points[0].y * size.height);
        for (int i = 1; i < points.length; i++) {
          fillPath.lineTo(points[i].x * size.width, points[i].y * size.height);
        }
        fillPath.close();
        canvas.drawPath(fillPath, fillPaint);

        // B. Vẽ nét đứt đồng đều cho từng cạnh
        final dynamicDashedPath = Path();
        for (int i = 0; i < points.length; i++) {
          final p1 = points[i];
          final p2 = points[(i + 1) % points.length];

          final segment = Path()
            ..moveTo(p1.x * size.width, p1.y * size.height)
            ..lineTo(p2.x * size.width, p2.y * size.height);

          _addProportionalDash(dynamicDashedPath, segment, dashArray, outerRadius);
        }
        canvas.drawPath(dynamicDashedPath, linePaint);
      }

      // --- 4. VẼ CÁC ĐIỂM CHỐT ---
      for (var point in points) {
        final offset = Offset(point.x * size.width, point.y * size.height);

        // Vẽ đổ bóng nhẹ cho điểm
        canvas.drawCircle(offset.translate(0, 2), outerRadius, shadowPaint);
        // Vẽ viền ngoài (màu chính)
        canvas.drawCircle(offset, outerRadius, pointOuterPaint);
        // Vẽ nhân trắng bên trong
        canvas.drawCircle(offset, innerRadius, pointInnerPaint);
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
