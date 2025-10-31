[Setup]
AppName=VNPT Secure Vision
AppVersion=1.0.4
DefaultDirName={pf}\VNPT Secure Vision
DefaultGroupName=VNPT Secure Vision
OutputDir=output
OutputBaseFilename=VNPTSecureVisionInstaller_1.0.4_4
Compression=lzma
SolidCompression=yes
WizardStyle=modern

AppPublisher=Vivas
AppPublisherURL=https://vivas.vn

[Files]
; Copy all files from Release folder
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

; Include VC++ redistributable installer
Source: "VC_redist.x64.exe"; DestDir: "{tmp}"; Flags: dontcopy

[Icons]
; Start menu shortcut
Name: "{group}\VMS Flutter Client"; Filename: "{app}\vnpt_secure_vision.exe"
; Desktop shortcut
Name: "{commondesktop}\VMS Flutter Client"; Filename: "{app}\vnpt_secure_vision.exe"

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
