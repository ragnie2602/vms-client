#include <windows.h>
#include <string>
#include <cstdio>
#include <thread>

// ======================== Logging =========================
std::wstring g_logPath;
void Log(const std::string& msg, bool withTime = true) {
    if (g_logPath.empty()) return; // Skip logging if no path provided

    FILE* f = nullptr;
    _wfopen_s(&f, g_logPath.c_str(), L"a");
    if (!f) return;

    if (withTime) {
        SYSTEMTIME st;
        GetLocalTime(&st);
        fprintf(f, "[%02d:%02d:%02d] %s\n",
                st.wHour, st.wMinute, st.wSecond, msg.c_str());
    } else {
        fprintf(f, "%s\n", msg.c_str());
    }

    fclose(f);
}

// ====================== String Helpers =====================
std::wstring Utf8ToWide(const std::string& s) {
    int len = MultiByteToWideChar(CP_UTF8, 0, s.c_str(), -1, nullptr, 0);
    if (len <= 0) return L"";
    std::wstring result(len - 1, L'\0');
    MultiByteToWideChar(CP_UTF8, 0, s.c_str(), -1, result.data(), len);
    return result;
}
std::string WideToUtf8(const std::wstring& w) {
    if (w.empty()) return std::string();
    int len = WideCharToMultiByte(CP_UTF8, 0, w.c_str(), -1, nullptr, 0, nullptr, nullptr);
    if (len <= 0) return std::string();
    std::string result(len - 1, '\0');
    WideCharToMultiByte(CP_UTF8, 0, w.c_str(), -1, &result[0], len, nullptr, nullptr);
    return result;
}

// ====================== File Helpers =======================
bool FileExists(const wchar_t* path) {
    DWORD attr = GetFileAttributesW(path);
    return (attr != INVALID_FILE_ATTRIBUTES && !(attr & FILE_ATTRIBUTE_DIRECTORY));
}

// ===================== Process Helpers =====================
bool IsAlive(DWORD pid) {
    HANDLE h = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
    if (!h) {
        DWORD err = GetLastError();
        if (err == ERROR_ACCESS_DENIED) {
            Log("IsAlive: access denied for PID=" + std::to_string(pid) + " → assume alive");
            return true; // Giả định vẫn sống nếu bị hạn chế quyền (JobObject khác)
        }
        Log("IsAlive: failed to open PID=" + std::to_string(pid) +
            " err=" + std::to_string(err));
        return false;
    }
    DWORD code = 0;
    GetExitCodeProcess(h, &code);
    CloseHandle(h);
    return (code == STILL_ACTIVE);
}

void SendQuitToFFmpeg(DWORD pid) {
    Log("Attempting graceful quit to FFmpeg...");

    if (AttachConsole(pid)) {
        SetConsoleCtrlHandler(NULL, TRUE);
        if (GenerateConsoleCtrlEvent(CTRL_C_EVENT, 0)) {
            Log("✅ Sent Ctrl+C (SIGINT) to FFmpeg");
        } else {
            Log("❌ Failed to send Ctrl+C event, err=" + std::to_string(GetLastError()));
        }
        FreeConsole();
    } else {
        DWORD err = GetLastError();
        Log("⚠️ AttachConsole failed, err=" + std::to_string(err) + " → fallback to TerminateProcess");
        HANDLE h = OpenProcess(PROCESS_TERMINATE, FALSE, pid);
        if (h) {
            TerminateProcess(h, 2);
            CloseHandle(h);
            Log("💀 Force terminated FFmpeg (PID=" + std::to_string(pid) + ")");
        } else {
            Log("❌ Failed to open FFmpeg PID for terminate, err=" + std::to_string(GetLastError()));
        }
    }
}

// ========================== Main ===========================
int main(int argc, char* argv[]) {
    // Parse wide command line to preserve Unicode arguments
    LPWSTR* wargv = nullptr;
    int wargc = 0;
    LPWSTR cmdline = GetCommandLineW();
    wargv = CommandLineToArgvW(cmdline, &wargc);
    if (!wargv || wargc < 6) {
        OutputDebugStringW(L"\u274C Invalid args (wide parsing).\nUsage: cleanup_watchdog <flutterPid> <ffmpegPid> <audio> <video> <output> [logPath]\n");
        if (wargv) LocalFree(wargv);
        return 1;
    }

    int flutterPid = _wtoi(wargv[1]);
    int ffmpegPid  = _wtoi(wargv[2]);

    std::wstring audio  = wargv[3];
    std::wstring video  = wargv[4];
    std::wstring output = wargv[5];

    if (wargc >= 7) {
        g_logPath = wargv[6];
    }

    // Wait for Flutter app to exit
    HANDLE hApp = OpenProcess(SYNCHRONIZE, FALSE, flutterPid);
    if (!hApp) {
        LocalFree(wargv);
        return 1;
    }

    while (true) {
        // Check if FFmpeg is still alive
        if (!IsAlive(ffmpegPid)) {
            CloseHandle(hApp);
            LocalFree(wargv);
            return 0;
        }

        // Check if app exited
        DWORD res = WaitForSingleObject(hApp, 1000); // check every 1s
        if (res == WAIT_OBJECT_0) {
            CloseHandle(hApp);
            break; // app exited → cleanup
        }
    }

    LocalFree(wargv);

    {
        SYSTEMTIME st;
        GetLocalTime(&st);
        char buffer[128];
        sprintf_s(buffer, "\n═══╡ [APP EXIT - CLEANING UP] %04d-%02d-%02d %02d:%02d:%02d ╞═══════════════",
                st.wYear, st.wMonth, st.wDay, st.wHour, st.wMinute, st.wSecond);
        Log(buffer, false);
    }

    // Stop ffmpeg gracefully
    if (IsAlive(ffmpegPid)) {
        SendQuitToFFmpeg(ffmpegPid);

        HANDLE hF = OpenProcess(SYNCHRONIZE, FALSE, ffmpegPid);
        if (hF) {
            Log("Waiting up to 8s for FFmpeg to exit...");
            DWORD res = WaitForSingleObject(hF, 8000);
            CloseHandle(hF);
            if (res == WAIT_OBJECT_0)
                Log("✅ FFmpeg exited cleanly.");
            else
                Log("⚠️ FFmpeg did not exit within timeout.");
        }

        Log("Waiting 3 seconds before merge...");
        Sleep(3000);
    } else {
        Log("⚠️ FFmpeg already exited or not accessible");
    }

    // Merge temp files
    if (FileExists(video.c_str()) && FileExists(audio.c_str())) {
        std::wstring cmd = L"ffmpeg -y -fflags +genpts "
                           L"-i \"" + video + L"\" "
                           L"-i \"" + audio + L"\" "
                           L"-c copy -shortest \"" + output + L"\"";

        STARTUPINFOW si{};
        PROCESS_INFORMATION pi{};
        si.cb = sizeof(si);
        std::wstring mutableCmd = cmd;
        Log("Launching merge process...");

        if (CreateProcessW(nullptr, &mutableCmd[0], nullptr, nullptr, FALSE,
                           CREATE_NO_WINDOW,
                           nullptr, nullptr, &si, &pi)) {
            WaitForSingleObject(pi.hProcess, INFINITE);
            CloseHandle(pi.hProcess);
            CloseHandle(pi.hThread);
            Log("✅ Merge done");
        } else {
            Log("❌ Failed to start merge ffmpeg, err=" + std::to_string(GetLastError()));
        }

        // Cleanup temp files
        if (DeleteFileW(video.c_str()))
            Log("🧹 Deleted temp video");
        else
            Log("⚠️ Failed to delete temp video, err=" + std::to_string(GetLastError()));

        if (DeleteFileW(audio.c_str()))
            Log("🧹 Deleted temp audio");
        else
            Log("⚠️ Failed to delete temp audio, err=" + std::to_string(GetLastError()));
    } else {
        // Ghi rõ file nào bị thiếu (in đường dẫn bằng UTF-8)
        std::string videoPathUtf8 = WideToUtf8(video);
        std::string audioPathUtf8 = WideToUtf8(audio);
        Log("⚠️ Temp files missing, skip merge (video=" + videoPathUtf8 + ", audio=" + audioPathUtf8 + ")");
    }

    Log("✅ Cleanup complete");
    return 0;
}
