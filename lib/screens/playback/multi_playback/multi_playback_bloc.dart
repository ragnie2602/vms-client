import 'dart:async';

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

    for (var item in (state.listItemCamPlayback ?? [])) {
      await item.playerController.pause?.call();
    }

    emit(state.copyWith(playbackDate: event.date));

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

    // Update state with new playbacks
    emit(
      state.copyWith(
        listItemCamPlayback: updatedList,
        mergedPlaybackList: _mergePlaybacks(updatedList),
      ),
    );

    // step 3: Save thời gian play = thời gian đầu tiên của _mergerList
    DateTime? startTime;
    if (state.mergedPlaybackList.isNotEmpty) {
      startTime = state.mergedPlaybackList.first.startTime;
    }

    // step 4: Setup (mute âm thanh + jumptDate = thời gian vừa lưu) dành cho tất cả các camera
    Future.delayed(const Duration(milliseconds: 500), () async {
      for (var item in updatedList) {
        item.playerController.changeVolume?.call(0);
        if (startTime != null) {
          await item.playerController.jumpToDate?.call(startTime);
        }
      }

      // step 5: Check nếu tồn tại ít nhất 1 cam đang loading thì tiếp tục chờ
      // => ko còn cam loading thì play toàn bộ cam trong list tại vị trí mốc thời gian đã lưu
      Future.doWhile(() async {
        bool anyInitializing = updatedList.any(
          (item) =>
              ((item.playerController.getPlayerState != null &&
                  item.playerController.getPlayerState!() ==
                      PlayerState.initializing) ||
              item.playerController.isSeeking?.call().value == true),
        );
        if (anyInitializing) {
          await Future.delayed(const Duration(milliseconds: 100));
          return true; // keep waiting
        }
        return false; // all ready
      }).then((_) async {
        for (var item in updatedList) {
          await item.playerController.play?.call();
        }
      });
    });
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
    for (var item in _list) {
      await item.playerController.pause?.call();
    }

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
    final playerController = PlayerController();
    ItemPlaybackModel newItem = ItemPlaybackModel(
      index: event.indexCam,
      camera: event.newCam,
      listVideoPlaybacks: [], // Empty initially
      playerController: playerController,
    );
    _list.add(newItem);
    emit(
      state.copyWith(
        listItemCamPlayback: _list,
        mergedPlaybackList: _mergePlaybacks(_list),
      ),
    );

    // 4. Fetch videos and update
    final videos = await getVideoPlaybacksByCameraId(
      camera: event.newCam,
      playbackDate: state.playbackDate,
    );

    // tìm vị trí camera để update list video playback cho đúng camera đó trong list
    final index = _list.indexWhere((e) => e.index == event.indexCam);
    if (index != -1) {
      _list[index] = _list[index].copyWith(
        listVideoPlaybacks: videos?.reversed.toList(),
      );
      emit(
        state.copyWith(
          listItemCamPlayback: List.from(_list), // Create new list reference
          mergedPlaybackList: _mergePlaybacks(_list),
        ),
      );
    }

    // 4. Seek new camera to sync date and mute
    Future.delayed(const Duration(milliseconds: 500), () async {
      playerController.changeVolume?.call(0);
      if (syncDate != null) {
        await playerController.jumpToDate?.call(syncDate);
      }

      // 5. Wait until all players are ready, then play all
      Future.doWhile(() async {
        // If any camera is initializing or seeking = true, all camera must be paused
        bool anyInitializing = _list.any(
          (item) =>
              ((item.playerController.getPlayerState != null &&
                  item.playerController.getPlayerState!() ==
                      PlayerState.initializing) ||
              item.playerController.isSeeking?.call().value == true),
        );
        if (anyInitializing) {
          for (var item in _list) {
            await item.playerController.pause?.call();
          }
          await Future.delayed(const Duration(milliseconds: 100));
          return true; // keep waiting
        }
        return false; // all ready
      }).then((_) async {
        for (var item in _list) {
          await item.playerController.play?.call();
        }
      });
    });
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
  /// step 1: Jump new date
  ///
  /// step 2: Pause
  ///
  /// step 3: Check loading
  ///
  /// step 4: Play
  FutureOr<void> _onJumpNewDate(
    MultiJumpDateEvent event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    final list = state.listItemCamPlayback ?? [];

    Future.delayed(const Duration(milliseconds: 100), () async {
      // step 1: Jump new date
      for (var item in list) {
        await item.playerController.jumpToDate?.call(event.newTime);
      }

      // step 2: Pause
      for (var item in list) {
        await item.playerController.pause?.call();
      }

      // step 3: Check loading
      Future.doWhile(() async {
        bool anyInitializing = list.any(
          (item) =>
              ((item.playerController.getPlayerState != null &&
                  item.playerController.getPlayerState!() ==
                      PlayerState.initializing) ||
              item.playerController.isSeeking?.call().value == true),
        );
        if (anyInitializing) {
          await Future.delayed(const Duration(milliseconds: 100));
          return true; // keep waiting
        }
        return false; // all ready
      }).then((_) async {
        // step 4: Play
        for (var item in list) {
          await item.playerController.play?.call();
        }
      });
    });
  }
}
