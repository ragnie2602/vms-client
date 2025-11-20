// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image/image.dart' as img;

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

  /// Convert raw RGBA snapshot bytes to displayable JPG
  static Uint8List rawRGBAToJPGBytes(Uint8List rgbaBytes, int width, int height) {
    final image = img.Image.fromBytes(
      width: width,
      height: height,
      bytes: rgbaBytes.buffer,
      order: img.ChannelOrder.rgba,
    );

    return img.encodeJpg(image);
  }

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
