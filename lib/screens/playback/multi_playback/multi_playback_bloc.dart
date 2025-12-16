import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/shared/player/sources.dart';

class MultiPlaybackBloc
    extends BaseBloc<MultiPlaybackEvent, MultiPlaybackState> {
  final ICameraRepository cameraRepository;
  final IPlaybackRepository playbackRepository;
  MultiPlaybackBloc({
    required this.cameraRepository,
    required this.playbackRepository,
  }) : super(
         MultiPlaybackState(
           playbackDate: DateTime.now(),
           multiPlaybackStatus: MultiPlaybackStatus.init,
           isPlaying: false,
         ),
       ) {
    on<InitEvent>(_init);
    on<ChangePlaybackDate>(_onChangePlaybackDate);
    on<ChangeTimelineDisplayMode>(_onChangeTimelineDisplayMode);
    on<AddCameraEvent>(_onAddNewCamera);
    on<RemoveCameraEvent>(_onRemoveCamera);
    on<MultiTogglePlayEvent>(_onTogglePlay);
    on<MultiSeekEvent>(_onSeek);
    on<MultiChangeSpeedEvent>(_onChangeSpeed);
    on<MultiChangeVolumeEvent>(_onChangeVolume);
    on<MultiJumpDateEvent>(_onJumpNewDate);
  }
  // count time
  Timer? _timer;
  ValueNotifier<DateTime?> timeGlobal = ValueNotifier(null);
  bool flagPauseTime = true;
  int _syncTimeCounter = 0; // Đếm số giây để gọi syncTime

  @override
  Future<void> close() {
    _resetGlobalTime();
    timeGlobal.dispose();
    return super.close();
  }

  void _resetGlobalTime() {
    _timer?.cancel();
    _syncTimeCounter = 0;
    timeGlobal.value = null;
    flagPauseTime = true;
  }

  FutureOr<void> _init(
    InitEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    //init
    emit(
      MultiPlaybackState(
        playbackDate: DateTime.now(),
        multiPlaybackStatus: MultiPlaybackStatus.success,
        isPlaying: false,
      ),
    );
    // get luôn list cam tại đây
    emit(state.copyWith(multiPlaybackStatus: MultiPlaybackStatus.loading));
    final cameras = await cameraRepository.getAllCamera();
    cameras.fold(
      (fail) {
        // get cam lỗi thì vẫn tiếp tục view
        emit(
          state.copyWith(
            multiPlaybackStatus: MultiPlaybackStatus.success,
            listCameraOrigin: [],
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            multiPlaybackStatus: MultiPlaybackStatus.success,
            listCameraOrigin: success,
          ),
        );
      },
    );
  }

  /// Đổi ngày theo dõi playback
  ///
  /// step 1: Update playback date + pause
  ///
  /// step 2: Get video playback của tất cả các camera
  ///
  /// step 3: Save thời gian play = thời gian đầu tiên của _mergerList
  ///
  /// step 4: Setup (mute âm thanh + jumptDate = thời gian vừa lưu) dành cho tất cả các camera
  ///
  /// step 5: Check nếu tồn tại ít nhất 1 cam đang loading thì tiếp tục chờ
  /// => ko còn cam loading thì play toàn bộ cam trong list tại vị trí mốc thời gian đã lưu
  ///
  FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    // step 1: Update playback date + pause
    if (state.playbackDate == event.date) return;

    await _pauseAllCamera();

    emit(
      state.copyWith(
        playbackDate: event.date,
        isPlaying: false,
        multiPlaybackStatus: MultiPlaybackStatus.loading,
      ),
    );
    // case đổi ngày -> reset lại global time
    _resetGlobalTime();

    // step 2: Get video playback của tất cả các camera (Parallel fetch)
    List<ItemPlaybackModel> currentList = state.listItemCamPlayback ?? [];

    List<ItemPlaybackModel> updatedList = await Future.wait(
      currentList.map((item) async {
        final videos = await getVideoPlaybacksByCameraId(
          camera: item.camera,
          playbackDate: event.date,
          indexCam: item.index,
        );
        return item.copyWith(
          listVideoPlaybacks: videos?.reversed.toList(),
          playerController: PlayerController(),
        );
      }),
    );

    // step 3: Save thời gian play = thời gian đầu tiên của _mergerList
    final mergedList = _mergePlaybacks(updatedList);
    DateTime? initialDate;
    if (mergedList.isNotEmpty) {
      initialDate = mergedList.first.startTime;
    }
    // Update all items with initialDate
    updatedList = updatedList.map((item) {
      return item.copyWith(initialDate: initialDate);
    }).toList();
    emit(
      state.copyWith(
        listItemCamPlayback: updatedList,
        mergedPlaybackList: mergedList,
      ),
    );
    await Future.wait(
      updatedList.map(
        (e) => e.isNoVideo
            ? Future.value()
            : e.playerController.waitForAttached.future,
      ),
    );

    if (initialDate != null) {
      checkGlobal(initialDate: initialDate);

      // step 4: Setup (mute âm thanh + jumptDate = thời gian vừa lưu) dành cho tất cả các camera
      // seek all camera
      await _seekAllCamera(initialDate);
      // step 5: check loading
      final checked = await _isAllReady();
      if (checked) {
        await _playAllCamera();
        emit(state.copyWith(isPlaying: true));
        updateFlagPause();
      }
    }
    emit(state.copyWith(multiPlaybackStatus: MultiPlaybackStatus.success));
  }

  FutureOr<void> _onChangeTimelineDisplayMode(
    ChangeTimelineDisplayMode event,
    Emitter<MultiPlaybackState> emit,
  ) {
    emit(state.copyWith(timelineDisplayMode: event.mode));
  }

  /// Thêm 1 camera mới vào lưới
  ///
  /// step 1: Pause tất cả các camera đang play tronmg listCamera (nếu có)
  ///
  /// step 2: Save lại thời gian khi bị pause
  ///
  /// step 3: Get video playback của camera muốn thêm => add thêm camera đó vào list đang có
  ///
  /// step 4: Setup cho cam mới (mute âm thanh + jumpDate cam mới đến khoảng time của các camera đang bị pause)
  ///
  /// step 5: Check nếu tồn tại ít nhất 1 cam trong listCam đang có trạng thái loading init/ loading khi seeking (state =  PlayerState.initializing hoặc isSeeking = true)
  /// thì vẫn chờ, đến khi hết loading => play toàn bộ cam trong listCam
  ///
  FutureOr<void> _onAddNewCamera(
    AddCameraEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    // 1. Pause all existing cameras
    await _pauseAllCamera();
    emit(state.copyWith(isPlaying: false));
    updateFlagPause();

    // Create item mới để loading trước (do wait API -> đơ 1 lúc mới emit state mới update UI)
    final _playerController = PlayerController();
    final _tempDate = timeGlobal.value ?? DateTime.now();

    ItemPlaybackModel _newItem = ItemPlaybackModel(
      index: event.indexCam,
      camera: event.newCam,
      listVideoPlaybacks: null, // Loading state
      playerController: _playerController,
      initialDate: _tempDate,
    );
    List<ItemPlaybackModel> _currentList = List.from(
      state.listItemCamPlayback ?? [],
    );
    _currentList.add(_newItem);
    emit(state.copyWith(listItemCamPlayback: _currentList));

    // get danh sách video playback
    final videos = await getVideoPlaybacksByCameraId(
      camera: event.newCam,
      playbackDate: state.playbackDate,
      indexCam: _newItem.index,
    );

    // 2. Save thời gian pause -> gán cho cam mới
    DateTime? syncDate = timeGlobal.value;
    syncDate ??= videos?.lastOrNull?.startTime;

    // Update lại item mới (update list video và initDate chuẩn)
    final updatedItem = _newItem.copyWith(
      listVideoPlaybacks: videos?.reversed.toList(),
      initialDate:
          syncDate ?? DateTime.now().subtract(const Duration(days: 365)),
    );
    // Re-fetch list to handle concurrent updates
    _currentList = List.from(state.listItemCamPlayback ?? []);
    final index = _currentList.indexWhere((e) => e.index == event.indexCam);
    if (index != -1) {
      _currentList[index] = updatedItem;
      emit(
        state.copyWith(
          listItemCamPlayback: _currentList,
          mergedPlaybackList: _mergePlaybacks(_currentList),
        ),
      );

      // set global
      if (syncDate != null) {
        checkGlobal(initialDate: syncDate);
      } else {
        // case cam đầu tiên
        if (state.mergedPlaybackList.isNotEmpty) {
          checkGlobal(initialDate: state.mergedPlaybackList.first.startTime);
        }
      }
      // check cam mới nếu có video(-> UI là 1 player) -> await initial
      if (updatedItem.isNoVideo != true) {
        await _playerController.waitForAttached.future;
      }

      // 4. Seek new camera to sync date and mute
      // seek all camera
      await _seekAllCamera(syncDate);
      // 5. Check loading
      final checked = await _isAllReady();
      if (checked) {
        await _playAllCamera();
        emit(state.copyWith(isPlaying: true));
        updateFlagPause();
      }
    }
  }

  Future<List<PlaybackVideo>?> getVideoPlaybacksByCameraId({
    required CameraEntity camera,
    required DateTime playbackDate,
    required int indexCam,
  }) async {
    return (await playbackRepository.getTimeShiftVideoCloudCamera(
      cameraId: camera.id,
      currentTime: playbackDate.endOfDay.millisecondsSinceEpoch ~/ 1000,
      timeZone: 7,
      indexPlayback: indexCam,
    )).fold(
      (failure) {
        return [];
      },
      (playbacks) {
        return playbacks;
      },
    );
  }

  FutureOr<void> _onRemoveCamera(
    RemoveCameraEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    _list.removeWhere((e) => e.index == event.indexCam);
    emit(
      state.copyWith(
        listItemCamPlayback: _list,
        mergedPlaybackList: _mergePlaybacks(_list),
      ),
    );
    if ((state.listItemCamPlayback ?? []).isEmpty || !_anyCamPlaying()) {
      _resetGlobalTime();
    }
    await _reNewPlayTime(emit);
  }

  /// merge các section thời gian nếu liền nhau/ giao cắt nhau => dùng để view timeshift
  List<PlaybackVideo> _mergePlaybacks(List<ItemPlaybackModel> items) {
    List<PlaybackVideo> allPlaybacks = [];
    for (var item in items) {
      if (item.listVideoPlaybacks != null) {
        allPlaybacks.addAll(item.listVideoPlaybacks!);
      }
    }

    if (allPlaybacks.isEmpty) return [];

    // sắp xếp các mốc time của playvideo dựa vào start time của từng mốc
    allPlaybacks.sort((a, b) => a.startTime.compareTo(b.startTime));

    List<PlaybackVideo> merged = [];
    PlaybackVideo current = allPlaybacks.first;

    for (int i = 1; i < allPlaybacks.length; i++) {
      PlaybackVideo next = allPlaybacks[i];

      // các khoảng thời gian nếu giao nhau/ nối liền nhau => merge làm 1 khoảng
      if (current.endTime.add(Duration(seconds: 1)).isAfter(next.startTime)) {
        DateTime newEndTime = current.endTime.isAfter(next.endTime)
            ? current.endTime
            : next.endTime;
        current = current.copyWith(endTime: newEndTime);
      } else {
        merged.add(current);
        current = next;
      }
    }
    merged.add(current);

    return merged;
  }

  FutureOr<void> _onTogglePlay(
    MultiTogglePlayEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    final isPlaying = !state.isPlaying;
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.togglePlay?.call();
    }
    emit(state.copyWith(isPlaying: isPlaying));
    updateFlagPause();
  }

  FutureOr<void> _onSeek(
    MultiSeekEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.seek?.call(event.duration);
    }

    // Update lại global time
    if (timeGlobal.value != null) {
      timeGlobal.value = timeGlobal.value!.add(event.duration);
    }
  }

  FutureOr<void> _onChangeSpeed(
    MultiChangeSpeedEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.changeSpeed?.call(event.speed);
    }
    emit(state.copyWith(speed: event.speed));
  }

  FutureOr<void> _onChangeVolume(
    MultiChangeVolumeEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.changeVolume?.call(event.volume);
    }
    emit(state.copyWith(volume: event.volume));
  }

  /// jump date
  ///
  /// step 1: pause
  ///
  /// step 2: jump new date
  ///
  /// step 3: Check loading
  ///
  /// step 4: Play
  FutureOr<void> _onJumpNewDate(
    MultiJumpDateEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    // 1. pause
    await _pauseAllCamera();
    emit(state.copyWith(isPlaying: false));
    updateFlagPause();
    // 2. jump to new date
    await _seekAllCamera(event.newTime);
    // set lại global time
    timeGlobal.value = event.newTime.roundToSecond;
    // 3. check loading
    final checked = await _isAllReady();
    if (checked) {
      await _playAllCamera();
      emit(state.copyWith(isPlaying: true));
      updateFlagPause();
    }
  }

  // các hàm phục vụ đồng bộ
  // 1. Pause
  Future<void> _pauseAllCamera() async {
    final _listCam = state.listItemCamPlayback ?? [];
    if (_listCam.isEmpty) {
      return;
    }
    await Future.wait(
      _listCam.map(
        (e) => e.isNoVideo
            ? Future.value()
            : e.playerController.pause?.call() ?? Future.value(),
      ),
    );
  }

  // 2. Seek
  Future<void> _seekAllCamera(DateTime? newDate) async {
    final _listCam = state.listItemCamPlayback ?? [];
    if (newDate == null || _listCam.isEmpty) {
      return;
    }
    final data = <Future>[];
    for (ItemPlaybackModel e in state.listItemCamPlayback ?? []) {
      if (!e.isNoVideo) {
        final completer = await e.playerController.jumpToDate?.call(newDate);
        if (completer != null) data.add(completer.future);
      }
    }
    await Future.wait(data);
  }

  // 3. Check loading
  Future<bool> _isAllReady() async {
    final _listCam = state.listItemCamPlayback ?? [];
    if (_listCam.isEmpty) {
      return true;
    }

    try {
      await Future.wait(
        _listCam.map(
          (e) => e.isNoVideo
              ? Future.value()
              : e.playerController.waitForReady?.call() ?? Future.value(),
        ),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  // 4. Play
  Future<void> _playAllCamera() async {
    final _listCam = state.listItemCamPlayback ?? [];
    if (_listCam.isEmpty) {
      return;
    }
    await Future.wait(
      _listCam.map(
        (e) => e.isNoVideo
            ? Future.value()
            : e.playerController.play?.call() ?? Future.value(),
      ),
    );
  }

  // 5. Đồng bộ thời gian cho cam lỗi/ cam không có dữ liệu trong khoảng thời gian
  Future<void> syncTime(DateTime syncTime) async {
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    if (_list.isEmpty) return;

    final data = <Future>[];
    for (var e in _list) {
      if (!e.isNoVideo && e.playerController.syncGlobalTime != null) {
        data.add(e.playerController.syncGlobalTime!.call(syncTime));
      }
    }

    await Future.wait(data);
  }

  // check global time
  void checkGlobal({required DateTime initialDate, bool? isPausing}) {
    if (isPausing != null) {
      flagPauseTime = isPausing;
    }
    if (timeGlobal.value == null) {
      timeGlobal.value = initialDate.roundToSecond;
      _timer?.cancel();
      _syncTimeCounter = 0; // Reset counter

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        // nếu không phải trong quá trình pause thì đếm thời gian tiếp
        if (!flagPauseTime) {
          // Tăng timeGlobal theo speed hiện tại
          timeGlobal.value = timeGlobal.value?.add(
            Duration(milliseconds: (1000 * state.speed).round()),
          );
          _syncTimeCounter++;
          // Gọi syncTime mỗi 3 giây một lần
          if (_syncTimeCounter >= 3 && timeGlobal.value != null) {
            syncTime(timeGlobal.value!);
            _syncTimeCounter = 0;
            print('count =${timeGlobal.value}');
          }
        }
      });
    }
  }

  // update flag
  void updateFlagPause() {
    flagPauseTime = !state.isPlaying;
  }

  // case khi xóa cam -> check xem list cam còn lại có cái nào đang playing ko?
  // nếu ko có cam nào đang playing nhưng vẫn có video (timeline xanh)
  // => update lại global time và play lại đoạn mới
  Future<void> _reNewPlayTime(Emitter<MultiPlaybackState> emit) async {
    if (!_anyCamPlaying() && (state.listItemCamPlayback ?? []).isNotEmpty) {
      await _pauseAllCamera();
      DateTime newInitDate = state.mergedPlaybackList.first.startTime;
      checkGlobal(initialDate: newInitDate);
      // seek all camera
      await _seekAllCamera(newInitDate);
      // 5. Check loading
      final checked = await _isAllReady();
      if (checked) {
        await _playAllCamera();
        emit(state.copyWith(isPlaying: true));
        updateFlagPause();
      }
    }
  }

  bool _anyCamPlaying() {
    for (ItemPlaybackModel e in state.listItemCamPlayback ?? []) {
      if (e.playerController.getPlayerStatus?.call() == PlayerStatus.playing &&
          e.playerController.getPlayerState?.call() ==
              PlayerState.initialized) {
        return true;
      }
    }
    return false;
  }
}
