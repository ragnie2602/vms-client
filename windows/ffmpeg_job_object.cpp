#include "ffmpeg_job_object.h"

#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include <windows.h>
#include <atomic>
#include <chrono>
#include <iomanip>
#include <iostream>
#include <memory>
#include <mutex>
#include <sstream>
#include <string>

namespace {

std::string Now() {
    using namespace std::chrono;
    auto t = system_clock::now();
    auto tt = system_clock::to_time_t(t);

    std::tm tm{};
    localtime_s(&tm, &tt);

    char buf[32];
    std::strftime(buf, sizeof(buf), "%H:%M:%S", &tm);
    return buf;
}

void Log(const std::string& level, const std::string& msg) {
    std::stringstream ss;
    ss << "[FFJOB] [" << level << "] " << msg;

    OutputDebugStringA((ss.str() + "\n").c_str());
    std::cout << ss.str() << std::endl;
}

void LOG_INFO(const std::string& msg)  { Log("INFO",  msg); }
void LOG_WARN(const std::string& msg)  { Log("WARN",  msg); }
void LOG_ERROR(const std::string& msg) { Log("ERROR", msg); }

// ===================================================================
//  GLOBALS
// ===================================================================
HANDLE g_job = NULL;
std::mutex g_mu;
std::atomic<bool> g_initialized{false};

// ===================================================================
//  HELPERS
// ===================================================================

bool CreateJobIfNeededLocked() {
    if (g_job != NULL) {
        LOG_INFO("JobObject existed, handle=" + std::to_string((uint64_t)g_job));
        return true;
    }

    g_job = CreateJobObjectW(nullptr, nullptr);
    if (!g_job) {
        LOG_ERROR("CreateJobObjectW FAILED");
        return false;
    }

    JOBOBJECT_EXTENDED_LIMIT_INFORMATION info;
    ZeroMemory(&info, sizeof(info));
    info.BasicLimitInformation.LimitFlags = JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE;

    if (!SetInformationJobObject(
            g_job,
            JobObjectExtendedLimitInformation,
            &info,
            sizeof(info))) {
        LOG_ERROR("SetInformationJobObject FAILED");
        CloseHandle(g_job);
        g_job = NULL;
        return false;
    }

    LOG_INFO("✅ Created JobObject (KILL_ON_JOB_CLOSE) with handle: " +
         std::to_string((uint64_t)g_job));
    return true;
}

bool AssignPidToJob(int pid) {
    std::lock_guard<std::mutex> lk(g_mu);

    if (!g_initialized.load()) {
        LOG_WARN("bindPid called before initJob()");
        return false;
    }

    if (g_job == NULL) {
        if (!CreateJobIfNeededLocked()) return false;
    }

    DWORD access =
        PROCESS_TERMINATE |
        PROCESS_SET_QUOTA |
        PROCESS_QUERY_INFORMATION |
        SYNCHRONIZE;

    HANDLE proc = OpenProcess(access, FALSE, (DWORD)pid);
    if (!proc) {
        LOG_ERROR("OpenProcess FAILED for pid=" + std::to_string(pid));
        return false;
    }

    if (!AssignProcessToJobObject(g_job, proc)) {
        LOG_ERROR("AssignProcessToJobObject FAILED for pid=" + std::to_string(pid));
        CloseHandle(proc);
        return false;
    }

    CloseHandle(proc);
    LOG_INFO("✅ Assigned pid=" + std::to_string(pid) + " into JobObject");
    return true;
}

} // namespace

// ===================================================================
//  PUBLIC API
// ===================================================================
namespace ffjob {

void CloseJobObject() {
    std::lock_guard<std::mutex> lk(g_mu);

    if (g_job) {
        LOG_INFO("CloseJobObject(), handle=" + std::to_string((uint64_t)g_job));
        CloseHandle(g_job);
        g_job = NULL;
    }

    g_initialized.store(false);
    LOG_INFO("JobObject closed.");
}

void RegisterFFmpegJobChannel(flutter::FlutterEngine* engine) {
    static std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel;

    channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
        engine->messenger(),
        "ffmpeg_job",
        &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
        [](const flutter::MethodCall<flutter::EncodableValue>& call,
           std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
    {
        const std::string method = call.method_name();

        if (method == "initJob") {
            std::lock_guard<std::mutex> lk(g_mu);

            if (!g_initialized.load()) {
                if (!CreateJobIfNeededLocked()) {
                    LOG_ERROR("initJob: CreateJobObject failed");
                    result->Error("job_create_failed", "CreateJobObject failed");
                    return;
                }
                g_initialized.store(true);
            }

            result->Success(flutter::EncodableValue(true));
            return;
        }

        if (method == "bindPid") {
            const auto* args = std::get_if<flutter::EncodableMap>(call.arguments());
            if (!args) {
                LOG_ERROR("bindPid: no arguments or not a map");
                result->Error("bad_args", "Arguments must be a Map");
                return;
            }

            auto it = args->find(flutter::EncodableValue("pid"));
            if (it == args->end()) {
                LOG_ERROR("bindPid: missing pid");
                result->Error("bad_args", "Missing pid");
                return;
            }

            int pid = 0;
            if (std::holds_alternative<int32_t>(it->second)) {
                pid = (int)std::get<int32_t>(it->second);
            } else if (std::holds_alternative<int64_t>(it->second)) {
                pid = (int)std::get<int64_t>(it->second);
            } else {
                LOG_ERROR("bindPid: pid invalid type");
                result->Error("bad_args", "pid must be int");
                return;
            }

            bool ok = AssignPidToJob(pid);
            result->Success(flutter::EncodableValue(ok));
            return;
        }

        if (method == "closeJob") {
            CloseJobObject();
            result->Success(flutter::EncodableValue(true));
            return;
        }

        LOG_WARN("Method not implemented: " + method);
        result->NotImplemented();
    });

    LOG_INFO("✅ MethodChannel ffmpeg_job registered successfully");
}

} // namespace ffjob
