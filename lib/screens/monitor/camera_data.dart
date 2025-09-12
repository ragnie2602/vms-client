class CameraData {
  final String source;
  final String name;
  final String username;
  final String password;

  CameraData({
    required this.source,
    required this.name,
    required this.username,
    required this.password,
  });

  Uri buildUri() {
    final uri = Uri.parse(source);

    // Encode password để tránh lỗi khi có ký tự đặc biệt (@, :, /, ...)
    final encodedPassword = Uri.encodeComponent(password);

    return Uri(
      scheme: uri.scheme,
      userInfo: "$username:$encodedPassword",
      host: uri.host,
      port: uri.port,
      path: uri.path,
      query: uri.query,
    );
  }

  static List<CameraData> cameras = [
    CameraData(
      source: 'rtsp://10.3.3.131:554/cam/realmonitor?channel=1&subtype=0&unicast=true&proto=Onvif',
      name: 'ONVIF Camera',
      username: 'test',
      password: 'Vivas@2022',
    ),
    CameraData(
      source: 'rtsp://10.3.3.125:554/onvif/profile2/media.smp',
      name: 'HCTC Camera',
      username: 'admin',
      password: 'Vivas@115TDH',
    ),
    CameraData(
      source: 'rtsp://10.3.3.129:554/cam/realmonitor?channel=1&subtype=0',
      name: 'HCTC Camera',
      username: 'admin',
      password: 'Vivas@2022',
    ),
  ];
}
