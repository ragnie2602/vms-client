// ignore_for_file: depend_on_referenced_packages

import 'dart:typed_data';

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

  /// Convert raw RGBA snapshot bytes to displayable PNG
  static img.Image rgbaToImage(Uint8List rgbaBytes, int width, int height) {
    return img.Image.fromBytes(
      width: width,
      height: height,
      bytes: rgbaBytes.buffer,
      order: img.ChannelOrder.rgba,
    );
  }

  static Future<void> saveRgbaDataToSelectedDirectory(
    Uint8List data, {
    required int width,
    required int height,
    String fileName = 'image',
  }) async {
    final result = await getSaveLocation(
      acceptedTypeGroups: [_typeGroupMapper['JPG']!, _typeGroupMapper['PNG']!],
      suggestedName: fileName,
    );
    if (result == null) return;

    await img.encodeImageFile(
      '${result.path}.${result.activeFilter?.extensions?.firstOrNull ?? 'png'}',
      rgbaToImage(data, width, height),
    );
  }

  static Future<String?> selectSaveLocation(String fileName, String extension) async {
    final result = await getSaveLocation(
      acceptedTypeGroups: [_typeGroupMapper[extension.toUpperCase()] ?? _typeGroupMapper['MP4']!],
      suggestedName: fileName,
    );
    if (result == null) return null;

    return '${result.path}.${result.activeFilter?.extensions?.firstOrNull ?? 'mp4'}';
  }
}
