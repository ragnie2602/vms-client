import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/account_config.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';

part 'storage_folder_event.dart';
part 'storage_folder_state.dart';

class StorageFolderBloc extends Bloc<StorageFolderEvent, StorageFolderState> {
  StorageFolderBloc() : super(const StorageFolderState()) {
    on<StorageFolderStarted>(_onStorageFolderStarted);
    on<SaveStorageFolders>(_onSaveStorageFolders);
  }

  FutureOr<void> _onStorageFolderStarted(
    StorageFolderStarted event,
    Emitter<StorageFolderState> emit,
  ) async {
    final configurationFolders = await FileUtil.ensureConfigurationFolders();
    final accountConfig = AccountConfig.current();

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
    if (event.videoFolder != state.videoFolder || event.snapshotFolder != state.snapshotFolder) {
      await (AccountConfig.current() ?? AccountConfig.empty()).updateAndSave(
        videoFolder: event.videoFolder,
        snapshotFolder: event.snapshotFolder,
      );
    }

    emit(state.copyWith(videoFolder: event.videoFolder, snapshotFolder: event.snapshotFolder));
    event.onSaved?.call();
  }
}
