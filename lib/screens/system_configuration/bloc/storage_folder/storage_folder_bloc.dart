import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/data/models/account_config.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_use_case.dart';

part 'storage_folder_event.dart';
part 'storage_folder_state.dart';

class StorageFolderBloc extends Bloc<StorageFolderEvent, StorageFolderState> {
  final SendMultiWindowEventUseCase sendMultiWindowEventUseCase;
  final SubscribeMultiWindowEventUseCase subscribeMultiWindowEventUseCase;

  StorageFolderBloc(this.sendMultiWindowEventUseCase, this.subscribeMultiWindowEventUseCase)
    : super(const StorageFolderState()) {
    on<StorageFolderStarted>(_onStorageFolderStarted);
    on<SaveStorageFolders>(_onSaveStorageFolders);

    _listenMultiWindowEvent();
  }

  StreamSubscription? _multiWindowEventSubscription;

  @override
  Future<void> close() {
    _multiWindowEventSubscription?.cancel();
    return super.close();
  }

  void _listenMultiWindowEvent() {
    _multiWindowEventSubscription?.cancel();
    _multiWindowEventSubscription = subscribeMultiWindowEventUseCase
        .execute(SubscribeMultiWindowEventInput())
        .listen((output) async {
          if (output.event is MWESyncStorageConfig) add(StorageFolderStarted(bypassCache: true));
        });
  }

  FutureOr<void> _onStorageFolderStarted(
    StorageFolderStarted event,
    Emitter<StorageFolderState> emit,
  ) async {
    final configurationFolders = await FileUtil.ensureConfigurationFolders();
    final accountConfig = await AccountConfig.current(bypassCache: event.bypassCache);

    emit(
      state.copyWith(
        vmsLibraryFolder: configurationFolders.vmsLibrary,
        videoFolder: accountConfig?.videoFolder ?? configurationFolders.video,
        snapshotFolder: accountConfig?.snapshotFolder ?? configurationFolders.snapshots,
      ),
    );
  }

  FutureOr<void> _onSaveStorageFolders(
    SaveStorageFolders event,
    Emitter<StorageFolderState> emit,
  ) async {
    bool shouldUpdate =
        event.videoFolder != state.videoFolder || event.snapshotFolder != state.snapshotFolder;

    emit(state.copyWith(videoFolder: event.videoFolder, snapshotFolder: event.snapshotFolder));
    event.onSaved?.call();

    if (shouldUpdate) {
      await AccountConfig.empty().updateAndSave(
        videoFolder: event.videoFolder,
        snapshotFolder: event.snapshotFolder,
      );

      sendMultiWindowEventUseCase.execute(SendMultiWindowEventInput(-1, 'sync_storage_config'));
    }
  }
}
