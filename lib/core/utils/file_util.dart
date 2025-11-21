import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';

class FileUtil {
  const FileUtil._();

  static final Map<String, XTypeGroup> _typeGroupMapper = {
    'JPG': XTypeGroup(label: 'jpg', extensions: <String>['jpg']),
    'PNG': XTypeGroup(label: 'png', extensions: <String>['png']),
    'MP4': XTypeGroup(label: 'mp4', extensions: <String>['mp4']),
    'AVI': XTypeGroup(label: 'avi', extensions: <String>['avi']),
    'MOV': XTypeGroup(label: 'mov', extensions: <String>['mov']),
    'MKV': XTypeGroup(label: 'mkv', extensions: <String>['mkv']),
    'WEBM': XTypeGroup(label: 'webm', extensions: <String>['webm']),
    'M3U8': XTypeGroup(label: 'm3u8', extensions: <String>['m3u8']),
  };

  static Future<String?> selectSaveLocation(String fileName, String extension) async {
    try {
      // Use file_picker for Windows to prevent UI freezing with lockParentWindow
      if (Platform.isWindows) {
        final cleanExtension = extension.replaceAll('.', '').toLowerCase();
        final result = await FilePicker.platform.saveFile(
          dialogTitle: 'Save file',
          fileName: fileName,
          allowedExtensions: [cleanExtension],
          type: FileType.custom,
          lockParentWindow: true, // Prevents UI freezing on Windows
        );
        if (result == null) return null;

        // Ensure file has extension
        return result.endsWith('.$cleanExtension') ? result : '$result.$cleanExtension';
      }

      // Use file_selector for other platforms (macOS, Linux)
      final result = await getSaveLocation(
        acceptedTypeGroups: [_typeGroupMapper[extension.toUpperCase()] ?? _typeGroupMapper['MP4']!],
        suggestedName: fileName,
      );
      if (result == null) return null;

      final _extension = result.activeFilter?.extensions?.firstOrNull ?? 'mp4';

      // MacOS thì result.path đã gắn extension luôn
      return result.path.endsWith(_extension) ? result.path : '${result.path}.$_extension';
    } catch (e) {
      // Handle any errors from the file dialog
      return null;
    }
  }
}
