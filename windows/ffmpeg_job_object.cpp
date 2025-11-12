#include "ffmpeg_job_object.h"
#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include <windows.h>
#include <atomic>
#include <filesystem>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>

namespace {

// ======================================================
// Logging (console only)
// ======================================================
std::mutex g_logMutex;

void Log(const std::string& level, const std::string& msg) {
    std::lock_guard<std::mutex> lk(g_logMutex);

    SYSTEMTIME st;
    GetLocalTime(&st);
    char buf[512];
    int len = snprintf(buf, sizeof(buf), "[%02d:%02d:%02d][%s] %s\n",
                       st.wHour, st.wMinute, st.wSecond,
                       level.c_str(), msg.c_str());
    if (len <= 0) return;

    OutputDebugStringA(buf);
    std::cout << buf;
}

#define LOGI(x) Log("INFO", x)
#define LOGW(x) Log("WARN", x)
#define LOGE(x) Log("ERR",  x)

// ======================================================
// Globals
// ======================================================
HANDLE g_appJob = NULL;
HANDLE g_ffmpegJob = NULL;
std::mutex g_mutex;
std::atomic<int> g_ffmpegPid{0};
std::wstring g_tempAudio, g_tempVideo, g_outputFile, g_logPath;

// ======================================================
// JobObject Helpers
// ======================================================
bool CreateAppJobIfNeeded() {
    std::lock_guard<std::mutex> lock(g_mutex);
    if (g_appJob) return true;

    g_appJob = CreateJobObjectW(nullptr, nullptr);
    if (!g_appJob) return false;

    JOBOBJECT_EXTENDED_LIMIT_INFORMATION info{};
    info.BasicLimitInformation.LimitFlags =
        JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE |
        JOB_OBJECT_LIMIT_BREAKAWAY_OK |
        JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK;
    SetInformationJobObject(g_appJob, JobObjectExtendedLimitInformation, &info, sizeof(info));
    LOGI("Created AppJob (KILL_ON_JOB_CLOSE)");
    return true;
}

bool CreateFFmpegJobIfNeeded() {
    std::lock_guard<std::mutex> lock(g_mutex);
    if (g_ffmpegJob) return true;

    g_ffmpegJob = CreateJobObjectW(nullptr, nullptr);
    if (!g_ffmpegJob) return false;

    JOBOBJECT_EXTENDED_LIMIT_INFORMATION info{};
    info.BasicLimitInformation.LimitFlags = 0;
    SetInformationJobObject(g_ffmpegJob, JobObjectExtendedLimitInformation, &info, sizeof(info));
    LOGI("Created FFmpegJob (no auto-kill)");
    return true;
}

void AssignCurrentProcessToAppJob() {
    CreateAppJobIfNeeded();
    HANDLE h = OpenProcess(PROCESS_ALL_ACCESS, FALSE, GetCurrentProcessId());
    if (h) {
        AssignProcessToJobObject(g_appJob, h);
        CloseHandle(h);
        LOGI("Assigned Flutter process to AppJob");
    }
}

bool AssignPidToAppJob(int pid) {
    CreateAppJobIfNeeded();
    HANDLE hProc = OpenProcess(PROCESS_ALL_ACCESS, FALSE, (DWORD)pid);
    if (!hProc) {
        LOGE("AssignPidToAppJob: OpenProcess failed for PID=" + std::to_string(pid) +
             " err=" + std::to_string(GetLastError()));
        return false;
    }

    if (!AssignProcessToJobObject(g_appJob, hProc)) {
        LOGE("AssignPidToAppJob: failed to assign PID=" + std::to_string(pid) +
             " to AppJob, err=" + std::to_string(GetLastError()));
        CloseHandle(hProc);
        return false;
    }

    CloseHandle(hProc);
    LOGI("Assigned PID=" + std::to_string(pid) + " to AppJob (auto-kill on close)");
    return true;
}

bool AssignPidToFFmpegJob(int pid) {
    CreateFFmpegJobIfNeeded();
    HANDLE h = OpenProcess(PROCESS_ALL_ACCESS, FALSE, (DWORD)pid);
    if (!h) {
        LOGE("OpenProcess failed for FFmpeg PID=" + std::to_string(pid));
        return false;
    }
    if (!AssignProcessToJobObject(g_ffmpegJob, h)) {
        LOGW("AssignProcessToJobObject failed for FFmpegJob (already in parent job?)");
        CloseHandle(h);
        return false;
    }
    CloseHandle(h);
    LOGI("Assigned FFmpeg PID to FFmpegJob");
    return true;
}

// ======================================================
// Watchdog Launcher
// ======================================================
bool LaunchFFmpegWatchdog(DWORD flutterPid, DWORD ffmpegPid,
                          const std::wstring& audio, const std::wstring& video,
                          const std::wstring& output, const std::wstring& logPath) {
    wchar_t exePath[MAX_PATH];
    GetModuleFileNameW(NULL, exePath, MAX_PATH);
    std::filesystem::path base(exePath);
    auto watchdog = base.parent_path() / "ffmpeg_watchdog.exe";

    if (!std::filesystem::exists(watchdog)) {
        LOGW("ffmpeg_watchdog.exe not found");
        return false;
    }

    std::wstring cmd = L"\"" + watchdog.wstring() + L"\" " +
                       std::to_wstring(flutterPid) + L" " +
                       std::to_wstring(ffmpegPid) + L" \"" +
                       audio + L"\" \"" + video + L"\" \"" + output + L"\"";

    if (!logPath.empty()) {
        cmd += L" \"" + logPath + L"\"";
    }

    STARTUPINFOW si{};
    PROCESS_INFORMATION pi{};
    si.cb = sizeof(si);

    DWORD flags = CREATE_NO_WINDOW | DETACHED_PROCESS | CREATE_BREAKAWAY_FROM_JOB;
    std::wstring mutableCmd = cmd;

    if (CreateProcessW(nullptr, &mutableCmd[0], nullptr, nullptr, FALSE, flags,
                       nullptr, nullptr, &si, &pi)) {
        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);
        LOGI("Spawned ffmpeg_watchdog.exe detached successfully");
        return true;
    } else {
        LOGE("Failed to spawn ffmpeg_watchdog.exe, err=" + std::to_string(GetLastError()));
        return false;
    }
}

// ======================================================
// Entry Binding
// ======================================================
void BindPidAndWatcher(int ffmpegPid,
                       const std::wstring& audio,
                       const std::wstring& video,
                       const std::wstring& output,
                       const std::wstring& logPath) {
    g_ffmpegPid.store(ffmpegPid);
    g_tempAudio = audio;
    g_tempVideo = video;
    g_outputFile = output;
    g_logPath = logPath;

    AssignPidToFFmpegJob(ffmpegPid);

    DWORD flutterPid = GetCurrentProcessId();
    LaunchFFmpegWatchdog(flutterPid, ffmpegPid, audio, video, output, logPath);
}

} // namespace

// ======================================================
// Flutter Channel Registration
// ======================================================
namespace ffjob {

void RegisterFFmpegJobChannel(flutter::FlutterEngine* engine) {
    CreateAppJobIfNeeded();
    AssignCurrentProcessToAppJob();

    static std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel;
    channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
        engine->messenger(), "ffmpeg_job", &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler([](const flutter::MethodCall<flutter::EncodableValue>& call,
                                     std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
        if (call.method_name() == "bindPid") {
            const auto* args = std::get_if<flutter::EncodableMap>(call.arguments());
            if (!args) {
                result->Error("bad_args", "Expect map args");
                return;
            }

            auto getStr = [&](const char* key) -> std::string {
                auto it = args->find(flutter::EncodableValue(key));
                if (it == args->end()) return {};
                if (auto s = std::get_if<std::string>(&it->second)) return *s;
                return {};
            };

            int pid = 0;
            auto itPid = args->find(flutter::EncodableValue("pid"));
            if (itPid != args->end()) {
                if (std::holds_alternative<int32_t>(itPid->second))
                    pid = (int)std::get<int32_t>(itPid->second);
                else if (std::holds_alternative<int64_t>(itPid->second))
                    pid = (int)std::get<int64_t>(itPid->second);
            }

            std::string a = getStr("temp_audio");
            std::string v = getStr("temp_video");
            std::string o = getStr("output");
            std::string l = getStr("log_path");

            // 🟢 Case 1: chỉ truyền pid → gán vào AppJob
            if (pid > 0 && (a.empty() || v.empty() || o.empty())) {
                if (AssignPidToAppJob(pid))
                    result->Success(flutter::EncodableValue(true));
                else
                    result->Error("assign_fail", "Failed to assign PID to AppJob");
                return;
            }

            if (pid <= 0 || a.empty() || v.empty() || o.empty()) {
                result->Error("bad_args", "Missing pid/temp_audio/temp_video/output");
                return;
            }

            BindPidAndWatcher(pid,
                              std::wstring(a.begin(), a.end()),
                              std::wstring(v.begin(), v.end()),
                              std::wstring(o.begin(), o.end()),
                              std::wstring(l.begin(), l.end()));

            LOGI("Bound FFmpeg PID and launched ffmpeg_watchdog");
            result->Success(flutter::EncodableValue(true));
            return;
        }
        result->NotImplemented();
    });

    LOGI("Registered ffmpeg_job channel");
}

} // namespace ffjob
