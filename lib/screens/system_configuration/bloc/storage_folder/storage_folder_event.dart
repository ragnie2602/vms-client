part of 'storage_folder_bloc.dart';

sealed class StorageFolderEvent extends BaseEvent {}

class StorageFolderStarted extends StorageFolderEvent {
  final bool bypassCache;
  StorageFolderStarted({this.bypassCache = false});
}

class SaveStorageFolders extends StorageFolderEvent {
  final String videoFolder;
  final String snapshotFolder;
  final Function()? onSaved;
  SaveStorageFolders({required this.videoFolder, required this.snapshotFolder, this.onSaved});
}
