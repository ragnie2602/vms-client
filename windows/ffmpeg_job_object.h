#pragma once
#include <windows.h>
#include <flutter/flutter_engine.h>

namespace ffjob {

// Đăng ký MethodChannel "ffmpeg_job"
void RegisterFFmpegJobChannel(flutter::FlutterEngine* engine);

// (tuỳ chọn) đóng JobObject bằng tay (không bắt buộc gọi)
void CloseJobObject();

} // namespace ffjob
