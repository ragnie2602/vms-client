// Source - https://stackoverflow.com/a/79414170
// Posted by Jason Holt
// Retrieved 2025-12-08, License - CC BY-SA 4.0

import Foundation
import UIKit
import Flutter

@objc class DocumentAccessManager: NSObject {
    private let methodChannel: FlutterMethodChannel
    private var securityScopedURL: URL?
    private var pendingResult: FlutterResult?

    // 🔥 ĐÃ CẬP NHẬT TÊN CHANNEL CHUẨN
    static let CHANNEL_NAME = "document_access_manager"

    init(messenger: FlutterBinaryMessenger) {
        self.methodChannel = FlutterMethodChannel(
            name: DocumentAccessManager.CHANNEL_NAME,
            binaryMessenger: messenger
        )
        super.init()
        self.methodChannel.setMethodCallHandler(handle)
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "selectDirectory":
            handleSelectDirectory(result)
        case "restoreSecurityBookmark":
            if let args = call.arguments as? [String: Any],
               let bookmarkData = args["bookmark"] as? String {
                handleRestoreBookmark(bookmarkData, result)
            } else {
                result(FlutterError(
                    code: "INVALID_ARGS",
                    message: "Invalid arguments for restoreSecurityBookmark",
                    details: nil
                ))
            }
        case "writeFile":
            if let args = call.arguments as? [String: Any],
               let path = args["path"] as? String,
               let content = args["content"] as? String {
                handleWriteFile(path: path, content: content, result)
            } else {
                result(FlutterError(
                    code: "INVALID_ARGS",
                    message: "Invalid arguments for writeFile",
                    details: nil
                ))
            }
        case "deleteFile":
            if let args = call.arguments as? [String: Any],
               let path = args["path"] as? String {
                handleDeleteFile(path: path, result)
            } else {
                result(FlutterError(
                    code: "INVALID_ARGS",
                    message: "Invalid arguments for deleteFile",
                    details: nil
                ))
            }
        case "copyFile":
            if let args = call.arguments as? [String: Any],
               let sourcePath = args["sourcePath"] as? String,
               let destinationPath = args["destinationPath"] as? String {
                handleCopyFile(sourcePath: sourcePath, destinationPath: destinationPath, result)
            } else {
                result(FlutterError(
                    code: "INVALID_ARGS",
                    message: "Invalid arguments for copyFile",
                    details: nil
                ))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func handleSelectDirectory(_ result: @escaping FlutterResult) {
        DispatchQueue.main.async {
            let documentPicker: UIDocumentPickerViewController

            if #available(iOS 14.0, *) {
                documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.folder])
            } else {
                documentPicker = UIDocumentPickerViewController(documentTypes: ["public.folder"], in: .open)
            }

            documentPicker.delegate = self
            documentPicker.allowsMultipleSelection = false
            documentPicker.shouldShowFileExtensions = true

            self.pendingResult = result

            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                viewController.present(documentPicker, animated: true)
            } else {
                result(FlutterError(
                    code: "NO_VIEWCONTROLLER",
                    message: "Could not present directory picker",
                    details: nil
                ))
            }
        }
    }

    private func handleRestoreBookmark(_ bookmarkData: String, _ result: FlutterResult) {
        guard let data = Data(base64Encoded: bookmarkData) else {
            result(FlutterError(
                code: "INVALID_BOOKMARK",
                message: "Invalid bookmark data",
                details: nil
            ))
            return
        }

        var isStale = false
        do {
            let url = try URL(resolvingBookmarkData: data,
                              options: [],
                              relativeTo: nil,
                              bookmarkDataIsStale: &isStale)

            if isStale {
                result(false)
                return
            }

            self.securityScopedURL = url

            if url.startAccessingSecurityScopedResource() {
                result(true)
            } else {
                result(false)
            }
        } catch {
            result(FlutterError(
                code: "BOOKMARK_ERROR",
                message: "Failed to resolve bookmark: \(error.localizedDescription)",
                details: nil
            ))
        }
    }

    private func handleWriteFile(path: String, content: String, _ result: @escaping FlutterResult) {
        guard let baseURL = securityScopedURL else {
            result(FlutterError(
                code: "NO_ACCESS",
                message: "No security-scoped access available",
                details: nil
            ))
            return
        }

        do {
            let fileURL = baseURL.appendingPathComponent(path)
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            result(nil)
        } catch {
            result(FlutterError(
                code: "WRITE_ERROR",
                message: "Failed to write file: \(error.localizedDescription)",
                details: nil
            ))
        }
    }

    private func handleDeleteFile(path: String, _ result: @escaping FlutterResult) {
        guard let baseURL = securityScopedURL else {
            result(FlutterError(
                code: "NO_ACCESS",
                message: "No security-scoped access available",
                details: nil
            ))
            return
        }

        do {
            let fileURL = baseURL.appendingPathComponent(path)
            try FileManager.default.removeItem(at: fileURL)
            result(nil)
        } catch {
            result(FlutterError(
                code: "DELETE_ERROR",
                message: "Failed to delete file: \(error.localizedDescription)",
                details: nil
            ))
        }
    }

    private func handleCopyFile(sourcePath: String, destinationPath: String, _ result: @escaping FlutterResult) {
        guard let baseURL = securityScopedURL else {
            result(FlutterError(
                code: "NO_ACCESS",
                message: "No security-scoped access available",
                details: nil
            ))
            return
        }

        do {
            let fileManager = FileManager.default

            let sourceURL = URL(fileURLWithPath: sourcePath)
            let destinationURL = baseURL.appendingPathComponent(destinationPath)

            let destinationDir = destinationURL.deletingLastPathComponent()
            try fileManager.createDirectory(at: destinationDir, withIntermediateDirectories: true)

            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }

            try fileManager.copyItem(at: sourceURL, to: destinationURL)

            result(nil)
        } catch {
            result(FlutterError(
                code: "COPY_ERROR",
                message: "Failed to copy file: \(error.localizedDescription)",
                details: nil
            ))
        }
    }

    deinit {
        securityScopedURL?.stopAccessingSecurityScopedResource()
    }
}

extension DocumentAccessManager: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            pendingResult?(FlutterError(
                code: "NO_SELECTION",
                message: "No directory selected",
                details: nil
            ))
            pendingResult = nil
            return
        }

        let path = url.path
        var isDir: ObjCBool = false

        guard FileManager.default.fileExists(atPath: path, isDirectory: &isDir) && isDir.boolValue else {
            pendingResult?(FlutterError(
                code: "NOT_DIRECTORY",
                message: "Selected item is not a directory or path is invalid",
                details: nil
            ))
            pendingResult = nil
            return
        }

        self.securityScopedURL = url

        guard url.startAccessingSecurityScopedResource() else {
            pendingResult?(FlutterError(
                code: "ACCESS_DENIED",
                message: "Could not access selected directory",
                details: nil
            ))
            pendingResult = nil
            return
        }

        do {
            let fileManager = FileManager.default
            let testDirURL = url.appendingPathComponent("test_access_dir", isDirectory: true)
            try fileManager.createDirectory(at: testDirURL, withIntermediateDirectories: true)
            try FileManager.default.removeItem(at: testDirURL)

            let bookmarkData = try url.bookmarkData(
                options: [],
                includingResourceValuesForKeys: nil,
                relativeTo: nil
            )

            let result: [String: Any] = [
                "path": url.path,
                "bookmark": bookmarkData.base64EncodedString()
            ]

            pendingResult?(result)
        } catch {
            url.stopAccessingSecurityScopedResource()
            pendingResult?(FlutterError(
                code: "WRITE_ACCESS_ERROR",
                message: "Cannot write to selected directory: \(error.localizedDescription)",
                details: nil
            ))
        }

        pendingResult = nil
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        pendingResult?(nil)
        pendingResult = nil
    }
}
