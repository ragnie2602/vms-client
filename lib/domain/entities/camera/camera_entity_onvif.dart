class CameraEntityOnvif {
  final String urn;
  final String name;
  final String hardware;
  final String xaddr;
  final List<String> scopes;
  final String onvifRtspUrl;

  CameraEntityOnvif({
    required this.urn,
    required this.name,
    required this.hardware,
    required this.xaddr,
    required this.scopes,
    required this.onvifRtspUrl,
  });
}
