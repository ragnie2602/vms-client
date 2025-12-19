[Setup]
AppName=VNPT Secure Vision
AppVersion=1.1.1
DefaultDirName={pf}\VNPT Secure Vision
DefaultGroupName=VNPT Secure Vision
OutputDir=output
OutputBaseFilename=VNPTSecureVisionInstaller_1.1.1_10
Compression=lzma
SolidCompression=yes
WizardStyle=modern

AppPublisher=Vivas
AppPublisherURL=https://vivas.vn

[Files]
; Copy all files from Release folder (trừ vms_flutter_client.exe)
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Excludes: "vms_flutter_client.exe"; Flags: recursesubdirs createallsubdirs

; Copy vms_flutter_client.exe và đổi tên thành vnpt_secure_vision.exe
Source: "..\build\windows\x64\runner\Release\vms_flutter_client.exe"; DestDir: "{app}"; DestName: "vnpt_secure_vision.exe"; Flags: ignoreversion

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
