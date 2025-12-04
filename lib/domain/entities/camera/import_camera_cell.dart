
class ImportCameraCell {
  final int indexNumer;
  final String type;
  final String cameraName;
  final String onvifXaadr;
  final String userName;
  final String password;
  final String mainStream;
  final String subStream;
  final int error;  

  ImportCameraCell(
    this.indexNumer,
    this.type,
    this.cameraName,
    this.onvifXaadr,
    this.userName,
    this.password,
    this.mainStream,
    this.subStream,
    this.error,
  );
}
