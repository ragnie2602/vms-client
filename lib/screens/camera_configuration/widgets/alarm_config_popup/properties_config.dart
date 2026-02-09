part of 'alarm_config_popup.dart';

class PropertiesConfig extends StatefulWidget {
  final CameraAlarmConfig alarm;
  final AIAlarmConfig alarmConfig;
  const PropertiesConfig({super.key, required this.alarm, required this.alarmConfig});

  @override
  State<PropertiesConfig> createState() => _PropertiesConfigState();
}

class _PropertiesConfigState extends State<PropertiesConfig> with StateBuilderMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late final aiBoxBloc = AiBoxBloc(
    aiBoxRepository: context.read(),
    filterAiBoxUseCase: context.read(),
  );
  late final alarmSoundBloc = AlarmSoundBloc(context.read());

  AiBoxEntity? _selectedAiBox;
  AiBoxEntity? get selectedAiBox => _selectedAiBox;
  set selectedAiBox(AiBoxEntity? value) {
    _selectedAiBox = value;
    widget.alarmConfig.aiBoxId = value?.id;
    _triggerValidate();
  }

  AlarmSound? _selectedSound;
  AlarmSound? get selectedSound => _selectedSound;
  set selectedSound(AlarmSound? value) {
    _selectedSound = value;
    widget.alarmConfig.soundId = value?.id;
    _triggerValidate();
  }

  late FireAlarmType? _selectedFireAlarmType = widget.alarmConfig.alarmConditions.busiType;
  FireAlarmType? get selectedFireAlarmType => _selectedFireAlarmType;
  set selectedFireAlarmType(FireAlarmType? value) {
    _selectedFireAlarmType = value;
    widget.alarmConfig.alarmConditions.busiType = value;
    _triggerValidate();
  }

  void _triggerValidate({bool? force}) {
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      context.read<AlarmConfigDetailBloc>().add(ValidateAlarmConfig(force: force));
    });
  }

  @override
  void initState() {
    super.initState();

    aiBoxBloc.add(
      GetListAiBoxEvent(
        onSuccess: () {
          //
          if(aiBoxBloc.state is! AIBoxLoadedState) return;

          final listAiBox = (aiBoxBloc.state as AIBoxLoadedState).aiBoxes ?? [];
          if (selectedAiBox != null || listAiBox.isEmpty) return;

          // Init suggested AI Box
          selectedAiBox = listAiBox.firstWhere(
            (e) => e.id == (widget.alarmConfig.aiBoxId ?? widget.alarmConfig.suggestedAiBoxId),
            orElse: () => listAiBox.first,
          );

          // Init full slot AI Box or offline AI Box
          if (selectedAiBox?.isFullSlot == true || selectedAiBox!.status != 1) {
            selectedAiBox = listAiBox.firstWhereOrNull(
              (e) => !e.isFullSlot && e.status == 1,
            );
          }

          // Có giá trị thì update UI
          if (selectedAiBox != null) setState(() {});
        },
      ),
    );

    alarmSoundBloc.add(
      GetAlarmSounds(
        onSuccess: () {
          if (widget.alarmConfig.soundId == null) return;

          selectedSound = (alarmSoundBloc.state as AlarmSoundLoaded).alarmSounds.firstWhereOrNull(
            (e) => e.id == widget.alarmConfig.soundId,
          );
          if (selectedSound != null) setState(() {});
        },
      ),
    );
  }

  @override
  void dispose() {
    aiBoxBloc.close();
    alarmSoundBloc.close();
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
                  value: widget.alarmConfig.status == 1,
                  splashRadius: 0,
                  onChanged: (value) {
                    setState(() => widget.alarmConfig.status = value ? 1 : 0);
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
        _buildAiBoxSelection(),

        /* Select Sound */
        SizedBox(height: 16),
        Text("Âm thanh cảnh báo", style: titleStyle),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: _buildAlarmSoundSelection()),
            SizedBox(width: 12),
            _buildAudioPlayerButton(selectedSound?.url),
          ],
        ),
      ],
    );
  }

  Widget _buildAiBoxSelection() {
    String? errorMsg;
    if (selectedAiBox != null && selectedAiBox!.isFullSlot) {
      errorMsg = "Thiết bị này đã hết kênh phân tích, vui lòng chọn thiết bị khác";
      _triggerValidate(force: false);
    }

    return _buildDropdown<AiBoxEntity?>(
      hint: 'Vui lòng chọn thiết bị phân tích AI',
      initialValue: selectedAiBox,
      buildLabel: (data) => data!.dropDownLabel,
      onChanged: (value) => setState(() => selectedAiBox = value),
      errorText: errorMsg,
      itemBuilder: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 36),
        child: BlocProvider.value(
          value: aiBoxBloc,
          child: BlocBuilder<AiBoxBloc, AiBoxState>(
            builder: (context, state) => stateBuilder<AIBoxLoadedState>(
              state,
              errorBuilder: (message) => _buildStateError(
                "Có lỗi xảy ra trong quá trình tải danh sách thiết bị phân tích AI, hãy thử lại sau!",
                () => aiBoxBloc.add(GetListAiBoxEvent()),
              ),
              loadingBuilder: () => Center(
                child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()),
              ),
              emptyBuilder: () => Center(
                child: Text(
                  'Không còn kênh phân tích trống nào.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.redFF2F2F,
                  ),
                ),
              ),
              child: (state) => ListView.separated(
                shrinkWrap: true,
                itemCount: state.aiBoxes?.length ?? 0,
                separatorBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.greyF2F4FA,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final item = state.aiBoxes![index];
                  final bool isOffline = item.status != 1;

                  return InkWell(
                    onTap: isOffline ? null : () => Navigator.pop(context, item),
                    mouseCursor: isOffline ? SystemMouseCursors.forbidden : null,
                    child: Container(
                      color: item.id == selectedAiBox?.id
                          ? Theme.of(context).highlightColor
                          : Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        item.dropDownLabel,
                        maxLines: 3,
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          lineHeight: 20 / 14,
                          color: isOffline ? AppColors.grey6F767E : Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlarmSoundSelection() {
    return _buildDropdown<AlarmSound?>(
      hint: 'Vui lòng chọn âm thanh cảnh báo',
      initialValue: selectedSound,
      buildLabel: (data) => data!.name,
      onChanged: (value) => setState(() => selectedSound = value),
      errorText: _selectedSound == null ? 'Vui lòng chọn âm thanh cảnh báo' : null,
      itemBuilder: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 36),
        child: BlocProvider.value(
          value: alarmSoundBloc,
          child: BlocBuilder<AlarmSoundBloc, AlarmSoundState>(
            builder: (context, state) => stateBuilder<AlarmSoundLoaded>(
              state,
              errorBuilder: (message) => _buildStateError(
                "Có lỗi xảy ra trong quá trình tải danh sách âm thanh cảnh báo, hãy thử lại sau!",
                () => alarmSoundBloc.add(GetAlarmSounds()),
              ),
              loadingBuilder: () => Center(
                child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()),
              ),
              emptyBuilder: () => Center(
                child: Text(
                  'Không có âm thanh cảnh báo nào.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.redFF2F2F,
                  ),
                ),
              ),
              child: (state) => ListView.separated(
                shrinkWrap: true,
                itemCount: state.alarmSounds.length,
                separatorBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.greyF2F4FA,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final item = state.alarmSounds[index];

                  return InkWell(
                    onTap: () => Navigator.pop(context, item),
                    child: Container(
                      color: item.id == selectedSound?.id
                          ? Theme.of(context).highlightColor
                          : Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        item.name,
                        maxLines: 3,
                        style: AppTypography.style(
                          14,
                          fontWeight: FontWeight.w400,
                          lineHeight: 20 / 14,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConditionConfig() {
    Widget? content;
    String? tooltip;
    String title = '';

    switch (widget.alarm.type) {
      case AIAlarmType.zoneIntrusion:
      case AIAlarmType.usingPhone:
        tooltip = 'Giới hạn cho phép từ 1 - 3600 giây.';
        title = 'Thời gian xuất hiện trong khu vực quá:';
        content = TextFormField(
          initialValue: widget.alarmConfig.alarmConditions.keepTimeThreshold?.toString(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            int? intValue = int.tryParse(value ?? '');

            if (intValue == null) return 'Thời gian không hợp lệ';
            if (intValue < 1) return 'Thời gian không được nhỏ hơn 1s';
            if (intValue > 3600) return 'Thời gian không được vượt quá 3600s';
            return null;
          },
          onChanged: (value) {
            widget.alarmConfig.alarmConditions.keepTimeThreshold = int.tryParse(value);
            _triggerValidate();
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
      case AIAlarmType.fireAlarm:
        title = 'Cảnh báo cháy trong điều kiện:';
        content = _buildDropdown<FireAlarmType?>(
          fillColor: Colors.white,
          initialValue: selectedFireAlarmType,
          items: FireAlarmType.values,
          buildLabel: (data) => data!.label,
          onChanged: (value) => setState(() => selectedFireAlarmType = value),
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
    String Function(T)? buildLabel,
    List<T>? items,
    Widget? itemBuilder,
    required Function(T) onChanged,
    Widget? prefixIcon,
    String? hint,
    String? errorText,
    Color? fillColor,
    double? popupMaxHeight,
  }) {
    final child = LayoutBuilder(
      builder: (context, constraints) {
        bool showHint = initialValue == null || initialValue == '';

        return PopupMenuButton<T>(
          offset: Offset(0, 41.5),
          tooltip: '',
          menuPadding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            maxWidth: constraints.maxWidth,
            maxHeight: popupMaxHeight ?? MediaQuery.of(context).size.height * 0.35,
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
            // Fix cứng
            if (items != null) ...[
              for (var e in items) ...[
                PopupMenuItem<T>(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  height: 36,
                  value: e,
                  child: Text(
                    buildLabel?.call(e) ?? e.toString(),
                    maxLines: 3,
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
            ]
            // Dynamic
            else if (itemBuilder != null)
              PopupMenuItem(padding: EdgeInsets.zero, enabled: false, child: itemBuilder),
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
                showHint ? hint ?? '' : buildLabel?.call(initialValue) ?? initialValue.toString(),
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

    if (errorText != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          child,
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Text(
              maxLines: 3,
              errorText,
              style: AppTypography.style(
                11,
                fontWeight: FontWeight.w400,
                color: AppColors.redFF2F2F,
                lineHeight: 14 / 11,
              ),
            ),
          ),
        ],
      );
    }

    return child;
  }

  Widget _buildAudioPlayerButton(String? source) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: source != null
            ? () => switch (_audioPlayer.state.value) {
                AudioPlayerState.playing => _audioPlayer.pause(),
                AudioPlayerState.paused => _audioPlayer.resume(),
                AudioPlayerState.initializing => null,
                _ => _audioPlayer.play(source),
              }
            : null,
        mouseCursor: source != null ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
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

  Widget _buildStateError(String message, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: AppTypography.style(
                13,
                fontWeight: FontWeight.w500,
                color: AppColors.redFF2F2F,
                lineHeight: 16 / 13,
              ),
            ),
            SizedBox(height: 2),
            SvgPicture.asset(
              AppAssets.icRefresh,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(AppColors.redFF2F2F, BlendMode.srcIn),
            ),
          ],
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
