import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  // Full screen khi chạy app
  override func applicationDidFinishLaunching(_ notification: Notification) {
    super.applicationDidFinishLaunching(notification)

    DispatchQueue.main.async { [weak self] in
      guard let window = self?.mainFlutterWindow,
            let screen = NSScreen.main else { return }

      // Full screen frame
      let screenRect = screen.frame

      // Nếu muốn loại bỏ title bar
      window.titleVisibility = .hidden
      window.titlebarAppearsTransparent = true
      window.styleMask.insert(.fullSizeContentView)

      window.setFrame(screenRect, display: true)
      window.makeKeyAndOrderFront(nil)
    }
  }
}
