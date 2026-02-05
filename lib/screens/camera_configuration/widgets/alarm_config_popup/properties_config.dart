part of 'alarm_config_popup.dart';

class PropertiesConfig extends StatefulWidget {
  final CameraAlarmConfig alarm;
  const PropertiesConfig({super.key, required this.alarm});

  @override
  State<PropertiesConfig> createState() => _PropertiesConfigState();
}

class _PropertiesConfigState extends State<PropertiesConfig> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isEnabled = true;
  String aiBox = '';
  String sound = '';

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTypography.style(
      14,
      fontWeight: FontWeight.w500,
      color: Color(0xFF334155),
      lineHeight: 20 / 14,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Global switch */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.alarm.name, style: titleStyle),
            /*  */
            SizedBox(
              width: 42,
              height: 28,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                  activeTrackColor: AppColors.blue005AA9,
                  inactiveTrackColor: Color(0xFFE4E4E4),
                  thumbColor: WidgetStateProperty.all(Colors.white),
                  trackOutlineWidth: WidgetStateProperty.all(0),
                  trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                  value: isEnabled,
                  splashRadius: 0,
                  onChanged: (value) {
                    setState(() => isEnabled = value);
                  },
                ),
              ),
            ),
          ],
        ),

        /* Điều kiện cảnh báo */
        _buildConditionConfig(),

        /* Select AI Box */
        SizedBox(height: 16),
        Text("Chọn thiết bị phân tích AI", style: titleStyle),
        SizedBox(height: 8),
        _buildDropdown<String>(
          hint: 'Vui lòng chọn thiết bị phân tích AI',
          initialValue: aiBox,
          items: ['AI Box 1', 'AI Box 2', 'AI Box 3'],
          onChanged: (value) {
            setState(() => aiBox = value);
          },
        ),

        /* Select Sound */
        SizedBox(height: 16),
        Text("Âm thanh cảnh báo", style: titleStyle),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              child: _buildDropdown<String>(
                hint: 'Vui lòng chọn âm thanh cảnh báo',
                prefixIcon: SizedBox(
                  width: 16,
                  height: 16,
                  child: Center(child: SvgPicture.asset(AppAssets.icVolume, width: 16, height: 16)),
                ),
                initialValue: sound,
                items: [
                  'https://zeta.123tokyo.xyz/get.php/3/fc/qY6TXEb5UlM.mp3?n=Vietsub%20%E2%99%AA%20%E2%9F%A8%E2%9F%A8%20Nippori%EF%BD%9C%E6%97%A5%E6%9A%AE%E9%87%8C%20%E2%9F%A9%E2%9F%A9%20M%C3%A8o%20C%E1%BB%A7a%20Ch%E1%BB%A7%20Nh%C3%A0%EF%BD%9C%E6%88%BF%E4%B8%9C%E7%9A%84%E7%8C%AB%20__%20BGM%20OST%20Y%E1%BA%BFt%20H%C3%AD%EF%BD%9CLove%20Between%20Lines%20%E8%BD%A7%E6%88%8F&h=l2eA6RHiGg-59q09ePH6nw&s=1770267308&cid2=MTEzLjE5MC4yNDAuMjM4fFZOfFJJMUE%3D&uT=X',
                  'https://serv2.y2dl.space/dl/xQvmF4CsQ1E?token=bkgVnh8QjOiXQeho-hwgDv0g0E23VdCuDmSOqIUQLDO1wkvUyZt95RTBYQrJK9Q7Lsr3WUllT3r4TI7gFCWinEX9I-ACoKEDvgwavZU25N1eORS231VN7XcfPYVaNkqsP-HVJ2X0a82WDSAmXndc2t__MhIZ_lDNmOKvF19z8qPlHiC3CEIhtNWquYvEf-vZGLNjll8ZgP3NbM-fHprKSWCHdB3ZXPjrzg.7AXvJR1i4clyCjQCuSGwcDGB8ytyTe5SpEypS7CTF-8&name=50+N%C4%83m+V%E1%BB%81+Sau+%28%C4%90%E1%BA%B7ng+Thanh+Tuy%E1%BB%81n%29+-+Nam+Ca+S%C4%A9+Gi%E1%BA%A5u+M%E1%BA%B7t+Cover+x+CaoTri+%7C+Nguy%E1%BB%87n+C%E1%BA%A7u+%C4%90%E1%BA%BFn+50+N%C4%83m+V%E1%BB%81+Sau',
                  'https://serv2.y2dl.space/dl/hsXR0TLPIBE?token=s9UfIAerOKz4XR_oyytHivVGGFvh9v9x2qTLpXTZXOmxx51yGz0gODoV0a713HvM6RXD0rSDyGT8oLLojMCIa-iV4WSQJ4Q36VmS5tf1_vv6tNuiyIevp0DpCy2b1noza0qI3PyZw34o2XalfK-CPaMEHHEZyPKpS35Yt39RkU2IkE-9HLiI9Dr7fPL-IFR8vtS5wZ8jqoGF_TmuHobngBbjYgmiTkVbfQ.lReeX40OCcbv8QGC7kZpL6P0S_40h0TZJN9mc_JAurw&name=Ng%C3%A0y+Th%C3%A1ng+Sau+N%C3%A0y+-+Lillie+x+ViAM+%7C+Ng%C3%A0y+th%C3%A1ng+sau+n%C3%A0y+ph%E1%BA%A3i+nh%E1%BB%9B+%E1%BB%9F+b%C3%AAn+m%E1%BB%99t+ng%C6%B0%E1%BB%9Di+th%E1%BA%ADt+l%C3%B2ng',
                  'https://serv2.y2dl.space/dl/0TicL3SiZKo?token=f4wKbUTu8GRTAYzk8P6S8SCQV-EJEccMPtrnU54f0EEA7KbKj70PX0zlo1o49HpOXsIMo4UCqEskD22gAuG97KVVXoE_krnU3nH-Tsm_hFfqzUWStzmckjiXQjAR_KcHajgt3NcNKIp_q0BlFVRoEAthc9CTzxntVgMnOYlyPPu9Rtp48ReLEPM1MZuDcMG4inG-pwxjB1frdGoYyJs-Wl7QICw78LYyeQ.fRoDz2dnfARLSrQOlPCsQ0i6fq9I8AcDZavql31UiZU&name=M%C6%B0a+C%E1%BB%A7a+Tr%E1%BB%9Di+M%C3%A2y+-+Ca+S%C4%A9+Gi%E1%BA%A5u+M%E1%BA%B7t+Cover+%7C+L%E1%BB%9Di+N%C3%B3i+D%E1%BB%91i+Ch%C3%A2n+Th%E1%BA%ADt+Nh%E1%BA%A5t+L%C3%A0+Em+Ch%C6%B0a+Bao+Gi%E1%BB%9D+H%E1%BA%BFt+Y%C3%AAu',
                  'https://serv2.y2dl.space/dl/hGSIto3FlQQ?token=LOutGXR_wkNawKT0uHcMDQvVPxS2eKVa-2yy68_wPTa_u-m6_Bmd6zomb5z8eIkLpU4V2BRTwlHN0SvG0KbtZZgXn_yS1J-pkUR3OSZACJXdgfYHt7Yrsd2LSBV4gF2yeUh-yR1KL484AlSrglLPPh0BQoPAmvZ45AmoS-ypDLztrRYSKvw-blm9L-eUy6PkjDET6B0yBi3naysKYUw7gPJtV6fsxDoq5w.ChxzieFLpf2nS7g2DpfcA2gOZWJ9n9-plJd7zq3IWqo&name=C%C3%A1nh+Hoa+H%C3%A9o+T%C3%A0n+%28+Lofi+Ver+%29+-+Mochiii+%7C+Gi%E1%BB%91ng+nh%C6%B0+m%E1%BB%99t+v%E1%BB%9F+k%E1%BB%8Bch+bu%E1%BB%93n+anh+di%E1%BB%85n+tr%E1%BB%8Dn+c%E1%BA%A3+hai+vai',
                ],
                onChanged: (value) {
                  setState(() => sound = value);
                  _audioPlayer.stop();
                },
              ),
            ),
            SizedBox(width: 16),
            _buildAudioPlayerButton(sound),
          ],
        ),
      ],
    );
  }

  Widget _buildConditionConfig() {
    Widget? content;
    String? tooltip;
    String title = '';

    switch (widget.alarm.type) {
      case CameraAlarmConfigType.zoneIntrusion:
      case CameraAlarmConfigType.usingPhone:
        tooltip = 'Giới hạn cho phép từ 1 - 3600 giây.';
        title = 'Thời gian xuất hiện trong khu vực quá:';
        content = TextFormField(
          initialValue: '10',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            int? intValue = int.tryParse(value ?? '');

            if (intValue == null) return 'Thời gian không hợp lệ';
            if (intValue < 1) return 'Thời gian không được nhỏ hơn 1s';
            if (intValue > 3600) return 'Thời gian không được vượt quá 3600s';
            return null;
          },
          onChanged: (value) {
            //
          },
          cursorWidth: 1.5,
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w400,
            lineHeight: 20 / 14,
            color: Color(0xFF0F172A),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            errorStyle: AppTypography.style(
              11,
              fontWeight: FontWeight.w400,
              color: AppColors.redFF0004,
            ),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.redFF2F2F),
            ),
            hoverColor: Colors.white70,
            suffixIcon: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF8FAFC),
                border: Border(left: BorderSide(color: AppColors.greyE2E8F0, width: 0.5)),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.only(right: 2.25, top: 2.25, bottom: 2.25),
              child: Text(
                'Giây',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                  lineHeight: 20 / 14,
                ),
              ),
            ),
          ),
        );
        break;
      case CameraAlarmConfigType.fireAlarm:
        title = 'Cảnh báo cháy trong điều kiện:';
        content = _buildDropdown<String>(
          fillColor: Colors.white,
          initialValue: "Phát hiện khói",
          items: ['Phát hiện khói', 'Phát hiện lửa', 'Phát hiện pháo hoa'],
          onChanged: (value) {},
        );
        break;
      default:
        break;
    }

    if (content == null) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16),
        TitleWithTooltip(title: 'Điều kiện cảnh báo', tooltip: tooltip),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.greyE2E8F0),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Text(
                title.toUpperCase(),
                style: AppTypography.style(
                  11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                  lineHeight: 16 / 11,
                ),
              ),

              content,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown<T>({
    required T initialValue,
    required List<T> items,
    required Function(T) onChanged,
    Widget? prefixIcon,
    String? hint,
    String? errorText,
    Color? fillColor,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool showHint = initialValue == null || initialValue == '';

        return PopupMenuButton<T>(
          offset: Offset(0, 41.5),
          tooltip: '',
          menuPadding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            maxWidth: constraints.maxWidth,
          ),
          onSelected: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: AppColors.greyE2E8F0),
          ),
          elevation: 4,
          shadowColor: Color.fromRGBO(147, 152, 154, 0.2),
          color: Colors.white,
          initialValue: initialValue,
          itemBuilder: (context) => [
            for (var e in items) ...[
              PopupMenuItem<T>(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 36,
                value: e,
                child: Text(
                  e.toString(),
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w400,
                    lineHeight: 20 / 14,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
              PopupMenuDivider(
                color: AppColors.greyF2F4FA,
                height: 1.5,
                thickness: 1.5,
                indent: 16,
                endIndent: 16,
              ),
            ],
          ],
          child: SizedBox(
            height: 40,
            child: InputDecorator(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                ),
                fillColor: fillColor,
                filled: fillColor != null,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.greyE2E8F0),
                ),
                prefixIcon: prefixIcon,
                suffixIcon: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: AppColors.grey94A3B8,
                  ),
                ),
              ),
              child: Text(
                showHint ? hint ?? '' : initialValue.toString(),
                style: showHint
                    ? AppTypography.style(
                        12.5,
                        fontWeight: FontWeight.w400,
                        lineHeight: 20 / 12.5,
                        color: AppColors.grey92929D,
                      )
                    : AppTypography.style(
                        14,
                        fontWeight: FontWeight.w400,
                        lineHeight: 20 / 14,
                        color: Color(0xFF0F172A),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAudioPlayerButton(String source) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: source.isNotEmpty
            ? () => switch (_audioPlayer.state.value) {
                AudioPlayerState.playing => _audioPlayer.pause(),
                AudioPlayerState.paused => _audioPlayer.resume(),
                AudioPlayerState.initializing => null,
                _ => _audioPlayer.play(sound),
              }
            : null,
        mouseCursor: source.isNotEmpty ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
        borderRadius: BorderRadius.circular(6),
        child: ValueListenableBuilder<int>(
          valueListenable: _audioPlayer.positionController,
          builder: (context, progress, child) {
            return CustomPaint(
              size: Size(42, 42),
              painter: _BorderProgressPainter(
                progress: progress / max(_audioPlayer.duration, 1),
                progressWidth: 2,
                progressColor: AppColors.blue005AA9,
                borderRadius: 6,
                borderColor: AppColors.greyE2E8F0,
              ),
              child: child,
            );
          },
          child: Ink(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: ValueListenableBuilder<AudioPlayerState>(
                valueListenable: _audioPlayer.state,
                builder: (context, state, child) => switch (state) {
                  AudioPlayerState.playing => SvgPicture.asset(
                    AppAssets.icPauseCircle,
                    width: 18,
                    height: 18,
                  ),
                  AudioPlayerState.paused => SvgPicture.asset(
                    AppAssets.icPlayCircle,
                    width: 17,
                    height: 17,
                  ),
                  AudioPlayerState.error => Tooltip(
                    message: 'Có lỗi xảy ra trong quá trình tải âm thanh!',
                    textStyle: AppTypography.style(
                      12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      lineHeight: 18 / 12,
                    ),
                    preferBelow: false,
                    verticalOffset: 12,
                    child: SvgPicture.asset(AppAssets.icError, width: 18, height: 18),
                  ),
                  AudioPlayerState.initializing => CupertinoActivityIndicator(
                    color: AppColors.black,
                  ),
                  _ => SvgPicture.asset(AppAssets.icPlayCircle, width: 17, height: 17),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BorderProgressPainter extends CustomPainter {
  final double progress;
  final double progressWidth;
  final double borderRadius;
  final Color borderColor;
  final Color progressColor;

  _BorderProgressPainter({
    required this.progress,
    required this.progressWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final half = progressWidth / 2;
    final rect = Rect.fromLTWH(half, half, size.width - progressWidth, size.height - progressWidth);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // 1. Vẽ Border nền (Luôn vẽ)
    final bgPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressWidth;
    canvas.drawRRect(rrect, bgPaint);

    // 2. Vẽ progress khi progress > 0
    if (progress == 0) return;

    final fgPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressWidth
      ..strokeCap = StrokeCap.square;

    // Path bo góc
    final path = Path()..addRRect(rrect);
    final metric = path.computeMetrics().first;

    // Tính điểm bắt đầu: Chính giữa cung Top-Left
    // Thêm chút để nhận biết được đoạn tầm 98% - 100%
    final startDistance = _getTopLeftMidArc(rect, borderRadius) + 3;
    final drawLength = metric.length * progress.clamp(0.0, 1.0);
    double endDistance = startDistance + drawLength;
    if (endDistance <= metric.length) {
      // Trường hợp thông thường: chưa vượt quá điểm kết thúc Path
      final extractPath = metric.extractPath(startDistance, endDistance);
      canvas.drawPath(extractPath, fgPaint);
    } else {
      // TRƯỜNG HỢP VƯỢT NGƯỠNG (Loop):
      // Đoạn 1: Từ startDistance đến cuối Path
      final path1 = metric.extractPath(startDistance, metric.length);
      canvas.drawPath(path1, fgPaint);

      // Đoạn 2: Từ đầu Path (0) đến phần còn thừa
      final path2 = metric.extractPath(0, endDistance % metric.length);
      canvas.drawPath(path2, fgPaint);
    }
  }

  double _getTopLeftMidArc(Rect rect, double r) {
    final edgeH = rect.width - 2 * r; // cạnh đứng
    final edgeV = rect.height - 2 * r; // cạnh ngang
    final arc = (pi * r) / 2; // độ dài cung tròn (border radius)

    // 0 là tại điểm thằng đầu tiên của cạnh trái
    return edgeH + arc + edgeV / 2;
  }

  @override
  bool shouldRepaint(covariant _BorderProgressPainter old) {
    return old.progress != progress;
  }
}
