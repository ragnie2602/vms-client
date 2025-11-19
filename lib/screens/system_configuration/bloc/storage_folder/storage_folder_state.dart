part of 'storage_folder_bloc.dart';

class StorageFolderState extends BaseState {
  const StorageFolderState({
    this.videoFolder = '',
    this.snapshotFolder = '',
    this.vmsLibraryFolder = '',
  });

  final String videoFolder;
  final String snapshotFolder;
  final String vmsLibraryFolder;

  @override
  List<Object> get props => [videoFolder, snapshotFolder, vmsLibraryFolder];

  StorageFolderState copyWith({
    String? videoFolder,
    String? snapshotFolder,
    String? vmsLibraryFolder,
  }) {
    return StorageFolderState(
      videoFolder: videoFolder ?? this.videoFolder,
      snapshotFolder: snapshotFolder ?? this.snapshotFolder,
      vmsLibraryFolder: vmsLibraryFolder ?? this.vmsLibraryFolder,
    );
  }
}
