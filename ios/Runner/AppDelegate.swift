import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 🔥 Đăng ký DocumentAccessManager channel
    if let controller = window?.rootViewController as? FlutterViewController {
        // Khởi tạo DocumentAccessManager và nó sẽ tự động đăng ký MethodChannel
        _ = DocumentAccessManager(messenger: controller.binaryMessenger)
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
