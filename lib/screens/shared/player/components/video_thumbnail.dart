import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';

class VideoThumbnail extends StatefulWidget {
  const VideoThumbnail({super.key, required this.source, this.borderRadius, this.fit});
  final String source;
  final double? borderRadius;
  final BoxFit? fit;

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  ImageProvider? _cachedProvider;
  String? _lastSavePath;
  late final MethodChannel _channel = MethodChannel('fvp');

  // Lưu giữ future để không bị trigger lại khi build
  Future<ImageProvider?>? _fetchFuture;

  @override
  void dispose() {
    _cleanupTempFile();
    super.dispose();
  }

  @override
  void didUpdateWidget(VideoThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.source != widget.source) {
      _cleanupTempFile();
      _lastSavePath = null;
      _cachedProvider = null;
      _fetchFuture = null;

      setState(() {});
    }
  }

  Future<void> _cleanupTempFile() async {
    if (_lastSavePath == null) return;

    await _cachedProvider?.evict();
    File(_lastSavePath!).delete();
  }

  Future<ImageProvider?> _fetchFirstFrame({int? width, int? height}) async {
    if (_cachedProvider != null) return _cachedProvider;

    final directory = await getTemporaryDirectory(); // Hoặc getApplicationDocumentsDirectory()
    final String savePath = p.join(
      directory.path,
      'thumbnail_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    try {
      _lastSavePath = await _channel.invokeMethod('GetThumbnail', {
        'url': widget.source,
        'path': savePath,
        'from': 0,
        'width': width ?? -1,
        'height': height ?? -1,
        'timeout': 15000,
      });

      return _cachedProvider = ResizeImage(
        FileImage(File(_lastSavePath!)),
        width: width,
        height: height,
      );
    } catch (e) {
      String message = e.toString();
      if (e is PlatformException) {
        message = "${e.code}: ${e.message} (${widget.source})";
      }

      Logger.warn(message, tag: 'THUMBNAIL');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cachedProvider != null) {
      return _buildThumbnail();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double? width = constraints.maxWidth;
        if (!width.isFinite || width < 0) width = null;
        double? height = constraints.maxHeight;
        if (!height.isFinite || height < 0) height = null;

        return FutureBuilder<ImageProvider?>(
          future: _fetchFuture ??= _fetchFirstFrame(width: width?.toInt(), height: height?.toInt()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator(color: AppColors.black));
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => setState(() {
                  _cachedProvider = null;
                  _fetchFuture = _fetchFirstFrame(width: width?.toInt(), height: height?.toInt());
                }),
                child: _wrapBorderRadius(Image.asset(AppAssets.imgPlaceholder, fit: BoxFit.cover)),
              );
            }

            return _buildThumbnail();
          },
        );
      },
    );
  }

  Widget _buildThumbnail() => RepaintBoundary(
    child: _wrapBorderRadius(
      Image(
        image: _cachedProvider!,
        fit: widget.fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;

          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: child,
          );
        },
      ),
    ),
  );

  Widget _wrapBorderRadius(Widget child) {
    if (widget.borderRadius != null) {
      return ClipRRect(borderRadius: BorderRadius.circular(widget.borderRadius!), child: child);
    }

    return child;
  }
}
