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

  FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    // update change date for multi playback
    if (state.playbackDate == event.date) return;

    // 1. Pause all existing cameras
    for (var item in (state.listItemCamPlayback ?? [])) {
      item.playerController.pause?.call();
    }

    emit(state.copyWith(playbackDate: event.date));
    // đổi ngày xem lại => get lại list video playback của từng cam
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
    emit(
      state.copyWith(
        listItemCamPlayback: updatedList,
        mergedPlaybackList: _mergePlaybacks(updatedList),
      ),
    );

    // 2. Wait until all players are ready, then play all
    Future.delayed(const Duration(milliseconds: 500), () {
      Future.doWhile(() async {
        bool allReady = updatedList.every(
          (item) =>
              item.playerController.getPlayerState != null &&
              item.playerController.getPlayerState!() !=
                  PlayerState.initializing,
        );
        if (!allReady) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
        return !allReady;
      }).then((_) {
        for (var item in updatedList) {
          item.playerController.play?.call();
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
      final refController = _list.first.playerController;
      if (refController.isInitialized?.call() == true &&
          refController.getCurrentDate != null) {
        syncDate = refController.getCurrentDate!();
      }
    }

    // 3. Add new camera
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
    );
    _list.add(newItem);
    emit(
      state.copyWith(
        listItemCamPlayback: _list,
        mergedPlaybackList: _mergePlaybacks(_list),
      ),
    );

    // 4. Seek new camera to sync date and mute
    Future.delayed(const Duration(milliseconds: 500), () async {
      playerController.changeVolume?.call(0);
      if (syncDate != null) {
        await playerController.jumpToDate?.call(syncDate);
      }

      // 5. Wait until all players are ready, then play all
      Future.doWhile(() async {
        // If any camera is initializing, all must be paused
        bool anyInitializing = _list.any(
          (item) =>
              item.playerController.getPlayerState != null &&
              item.playerController.getPlayerState!() ==
                  PlayerState.initializing,
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
}
