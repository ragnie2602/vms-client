#pragma once
#include <windows.h>
#include <flutter/flutter_engine.h>
#include <flutter_plugin_registrar.h>

namespace ffjob {

// Đăng ký MethodChannel "ffmpeg_job"
void RegisterFFmpegJobChannel(flutter::FlutterEngine* engine);

void FFmpegJobRegisterWithRegistrar(FlutterDesktopPluginRegistrarRef registrar);

// (tuỳ chọn) đóng JobObject bằng tay (không bắt buộc gọi)
void CloseJobObject();

} // namespace ffjob
