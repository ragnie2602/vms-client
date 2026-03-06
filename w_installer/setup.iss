#define ExePath "..\build\windows\x64\runner\Release\vms_flutter_client.exe"
#define ReleaseDir "..\build\windows\x64\runner\Release"

; --- [1] DỌN DẸP ---
#pragma message ">>> [1/4] Kiểm tra và làm sạch môi trường build trước đó..."
#if DirExists(ReleaseDir)
    #pragma message "          - Phát hiện bản build cũ → thực hiện dọn dẹp..."
    #expr Exec("cmd.exe", "/c rd /s /q """ + ReleaseDir + """", ExtractFileDir(SourcePath), SW_HIDE)
#else
    #pragma message "          - Đã sạch sẽ → bỏ qua"
#endif

; --- [2] BUILD RELEASE ---
#pragma message ">>> [2/4] Thực hiện build release..."
#if Exec("cmd.exe", "/c flutter build windows --release", "..\", SW_MINIMIZE) != 0
    #error "!!! LỖI: Build release thất bại. Vui lòng kiểm tra lại mã nguồn!"
#endif

; --- [3] ĐỌC THÔNG TIN VERSION ---
#pragma message ">>> [3/4] Trích xuất thông tin phiên bản từ bản build..."
#if FileExists(ExePath)
    #define Major
    #define Minor
    #define Build
    #define Rev
    #expr GetVersionComponents(ExePath, Major, Minor, Build, Rev)

    ; Định nghĩa lại các biến Version để dùng cho Setup
    #define AppFullVersion str(Major) + "." + str(Minor) + "." + str(Build)
    #define AppBuildNumber str(Rev)

    #pragma message "          --------------------------------------------------"
    #pragma message "          THÔNG TIN BẢN BUILD:"
    #pragma message "          - Version: " + AppFullVersion
    #pragma message "          - Build: " + AppBuildNumber
    #pragma message "          --------------------------------------------------"
#else
    #error "!!! LỖI: Không tìm thấy 'vms_flutter_client.exe' sau khi build!"
#endif

; ----------------------------------------------------------------------------
#pragma message ">>> [4/4] Tạo bộ cài..."

[Setup]
AppName=VNPT Secure Vision
AppVersion={#AppFullVersion}
VersionInfoVersion={#AppFullVersion}
DefaultDirName={pf}\VNPT Secure Vision
DefaultGroupName=VNPT Secure Vision
OutputDir=output
OutputBaseFilename=VNPTSecureVisionInstaller_{#AppFullVersion}_{#AppBuildNumber}
Compression=lzma
SolidCompression=yes
WizardStyle=modern

AppPublisher=Vivas
AppPublisherURL=https://vivas.vn

[Files]
; Copy all files from Release folder (trừ vms_flutter_client.exe)
Source: "{#ReleaseDir}\*"; DestDir: "{app}"; Excludes: "vms_flutter_client.exe"; Flags: recursesubdirs createallsubdirs

; Copy vms_flutter_client.exe và đổi tên thành vnpt_secure_vision.exe
Source: "{#ExePath}"; DestDir: "{app}"; DestName: "vnpt_secure_vision.exe"; Flags: ignoreversion

; Include VC++ redistributable installer
Source: "VC_redist.x64.exe"; DestDir: "{tmp}"; Flags: dontcopy

[Icons]
; Start menu shortcut
Name: "{group}\VNPT Secure Vision"; Filename: "{app}\vnpt_secure_vision.exe"
; Desktop shortcut
Name: "{commondesktop}\VNPT Secure Vision"; Filename: "{app}\vnpt_secure_vision.exe"

[Run]
; Install VC++ Redistributable silently if not installed
Filename: "{tmp}\VC_redist.x64.exe"; Parameters: "/install /quiet /norestart"; \
    StatusMsg: "Installing Microsoft Visual C++ Redistributable..."; \
    Check: NeedVCppRuntime

; Option to launch app after install
Filename: "{app}\vnpt_secure_vision.exe"; Description: "Launch VNPT Secure Vision Client"; \
    Flags: nowait postinstall skipifsilent

[Code]
function NeedVCppRuntime(): Boolean;
var
  key: String;
  exists: Boolean;
begin
  { Check for VC++ 2015-2022 x64 runtime (14.x) }
  key := 'SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64';
  exists := RegKeyExists(HKLM, key);
  Result := not exists;
end;

[UninstallDelete]
Type: files; Name: "{userappdata}\Vivas\VNPT Secure Vision\shared_preferences.json"
