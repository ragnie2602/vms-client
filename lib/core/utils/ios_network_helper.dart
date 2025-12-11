import 'dart:io';

class IosNetworkHelper {
  /// Triggers the "Local Network" permission dialog on iOS.
  /// This is done by sending a UDP packet to a multicast address (224.0.0.1),
  /// which forces iOS to ask the user if they want to allow the app to find
  /// and connect to devices on the local network.
  ///
  /// Only runs on iOS.
  static Future<void> triggerPermission() async {
    if (!Platform.isIOS) return;

    try {
      // Create a UDP socket
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

      // Send a dummy packet to a multicast address (All Hosts)
      // Port 4444 is arbitrary
      socket.send('ping'.codeUnits, InternetAddress('224.0.0.1'), 4444);

      socket.close();
    } catch (_) {
      // Ignore errors
    }
  }
}
