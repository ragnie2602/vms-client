import 'dart:async';
import 'dart:math';

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

    emit(state.copyWith(playbackDate: event.date, isPlaying: false));

    // step 2: Get video playback của tất cả các camera
    List<ItemPlaybackModel> updatedList = [];
    for (ItemPlaybackModel item in (state.listItemCamPlayback ?? [])) {
      final videos = await getVideoPlaybacksByCameraId(
        camera: item.camera,
        playbackDate: event.date,
      );
      updatedList.add(
        item.copyWith(listVideoPlaybacks: videos?.reversed.toList()),
      );
    }

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

    // Update state with new playbacks
    emit(
      state.copyWith(
        listItemCamPlayback: updatedList,
        mergedPlaybackList: mergedList,
      ),
    );

    // step 3: Save thời gian play = thời gian đầu tiên của _mergerList

    // step 4: Setup (mute âm thanh + jumptDate = thời gian vừa lưu) dành cho tất cả các camera
    // seek all camera
    await _seekAllCamera(initialDate);
    // step 5: check loading
    final checked = await _isAllReady();
    if (checked) {
      await _playAllCamera();
      emit(state.copyWith(isPlaying: true));
    }
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
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    // 1. Pause all existing cameras
    await _pauseAllCamera();
    emit(state.copyWith(isPlaying: false));
    // 2. Get sync date from first camera
    DateTime? syncDate;
    if (_list.isNotEmpty) {
      // check cam đầu tiên trong list có dữ liệu đang play
      for (ItemPlaybackModel e in _list) {
        if ((e.listVideoPlaybacks ?? []).isNotEmpty) {
          final refController = e.playerController;
          if (refController.isInitialized?.call() == true &&
              refController.getCurrentDate != null) {
            syncDate = refController.getCurrentDate!();
            break;
          }
        }
      }
    }

    // Fallback: nếu chưa có cam nào play (syncDate == null) thì lấy mốc start của merged list
    if (syncDate == null && state.mergedPlaybackList.isNotEmpty) {
      syncDate = state.mergedPlaybackList.first.startTime;
    }

    // 3. Add new camera (Emit immediately to show loading)
    // get danh sách video playback
    final videos = await getVideoPlaybacksByCameraId(
      camera: event.newCam,
      playbackDate: state.playbackDate,
    );
    final playerController = PlayerController();

    ItemPlaybackModel newItem = ItemPlaybackModel(
      index: event.indexCam,
      camera: event.newCam,
      listVideoPlaybacks: videos?.reversed.toList(),
      playerController: playerController,
      initialDate: syncDate, // Save the sync date as initial date
    );
    _list.add(newItem);
    emit(
      state.copyWith(
        listItemCamPlayback: _list,
        mergedPlaybackList: _mergePlaybacks(_list),
      ),
    );
    // check cam mới nếu có video(-> UI là 1 player) -> await initial
    if (newItem.isNoVideo != true) {
      await playerController.waitForAttached.future;
    }

    // 4. Seek new camera to sync date and mute
    // seek all camera
    print('date pause = $syncDate');
    await _seekAllCamera(syncDate);
    // 5. Check loading
    final checked = await _isAllReady();
    if (checked) {
      await _playAllCamera();
      emit(state.copyWith(isPlaying: true));
    }
  }

  Future<List<PlaybackVideo>?> getVideoPlaybacksByCameraId({
    required CameraEntity camera,
    required DateTime playbackDate,
  }) async {
    return (await playbackRepository.getTimeShiftVideoCloudCamera(
      cameraId: camera.id,
      currentTime: playbackDate.endOfDay.millisecondsSinceEpoch ~/ 1000,
      timeZone: 7,
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
  ) {
    List<ItemPlaybackModel> _list = List.from(state.listItemCamPlayback ?? []);
    _list.removeWhere((e) => e.index == event.indexCam);
    emit(
      state.copyWith(
        listItemCamPlayback: _list,
        mergedPlaybackList: _mergePlaybacks(_list),
      ),
    );
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

    //   // sắp xếp các mốc time của play video dựa vào start time của từng mốc
    //   allPlaybacks.sort((a, b) => a.startTime.compareTo(b.startTime));

    //  return allPlaybacks;

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
  }

  FutureOr<void> _onSeek(
    MultiSeekEvent event,
    Emitter<MultiPlaybackState> emit,
  ) {
    for (var item in state.listItemCamPlayback ?? []) {
      item.playerController.seek?.call(event.duration);
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
    // 2. jump to new date
    print('jump new date = ${event.newTime}');
    await _seekAllCamera(event.newTime);
    // 3. check loading
    final checked = await _isAllReady();
    if (checked) {
      await _playAllCamera();
      emit(state.copyWith(isPlaying: true));
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
    // for (ItemPlaybackModel e in state.listItemCamPlayback ?? []) {
    //   await e.playerController.pause?.call();
    // }
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
    // for (ItemPlaybackModel e in state.listItemCamPlayback ?? []) {
    //   await e.playerController.jumpToDate?.call(newDate);
    // }
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
    // for (ItemPlaybackModel e in state.listItemCamPlayback ?? []) {
    //   await e.playerController.play?.call();
    // }
  }
}
