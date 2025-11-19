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

  Future<String> ensureSnapshotFolder(String folderName, String fileName) async {
    String path = snapshotFolder;
    if (path.isEmpty) path = (await FileUtil.ensureConfigurationFolders()).snapshots;

    path = path.joinPath(folderName, fileName);
    await FileUtil.ensureFolderExists(path);

    return path;
  }

  Future<String> ensureVideoFolder(String folderName, String fileName) async {
    String path = videoFolder;
    if (path.isEmpty) path = (await FileUtil.ensureConfigurationFolders()).video;

    path = path.joinPath(folderName, fileName);
    await FileUtil.ensureFolderExists(path);

    return path;
  }

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
