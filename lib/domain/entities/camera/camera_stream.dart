class CameraStreamResolution {
  final int width;
  final int height;

  const CameraStreamResolution({
    required this.width,
    required this.height,
  });
}

class CameraStreamEncoder {
  final int quality;
  final int framerate;
  final int bitrate;
  final String encoding;

  const CameraStreamEncoder({
    required this.quality,
    required this.framerate,
    required this.bitrate,
    required this.encoding,
  });
}

class CameraStreamPtzRangeValue {
  final int min;
  final int max;

  const CameraStreamPtzRangeValue({
    required this.min,
    required this.max,
  });
}

class CameraStreamPtzRange {
  final CameraStreamPtzRangeValue x;
  final CameraStreamPtzRangeValue y;
  final CameraStreamPtzRangeValue z;

  const CameraStreamPtzRange({
    required this.x,
    required this.y,
    required this.z,
  });
}

enum CameraStreamDefaultURL {
  hls(0),
  rtspOrigin(1),
  rtspProxy(2),
  rtmp(3);

  final int value;

  const CameraStreamDefaultURL(this.value);

  static CameraStreamDefaultURL fromValue(int value) {
    return CameraStreamDefaultURL.values.firstWhere(
      (url) => url.value == value,
      orElse: () => CameraStreamDefaultURL.hls,
    );
  }
}

enum CameraStreamUrlStreamType {
  hls(0),
  rtsp(1),
  udp(2),
  rtspProxy(3),
  rtmp(4);

  final int value;

  const CameraStreamUrlStreamType(this.value);

  static CameraStreamUrlStreamType fromValue(int value) {
    return CameraStreamUrlStreamType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => CameraStreamUrlStreamType.hls,
    );
  }
}

class CameraStreamUrlStream {
  final bool isDefault;
  final String nameOfStream;
  final String urlOfStream;
  final CameraStreamUrlStreamType stype;
  final bool isMainStream;
  final String originStream;

  const CameraStreamUrlStream({
    required this.isDefault,
    required this.nameOfStream,
    required this.urlOfStream,
    required this.stype,
    required this.isMainStream,
    required this.originStream,
  });
}

class CameraStream {
  final String streamOriginUrl;
  final String streamIvaUrl;
  final String streamName;
  final CameraStreamResolution? res;
  final CameraStreamEncoder? encoder;
  final CameraStreamPtzRange? ptzRange;
  final String userOriginAddedUrl;
  final String streamHlsUrl;
  final CameraStreamDefaultURL defaultUrl;
  final List<CameraStreamUrlStream> streamLinks;

  const CameraStream({
    required this.streamOriginUrl,
    required this.streamIvaUrl,
    required this.streamName,
    this.res,
    this.encoder,
    this.ptzRange,
    required this.userOriginAddedUrl,
    required this.streamHlsUrl,
    required this.defaultUrl,
    required this.streamLinks,
  });
}
