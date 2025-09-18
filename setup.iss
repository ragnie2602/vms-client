; Inno Setup Script for Flutter Windows App
[Setup]
AppName=VMS Flutter Client
AppVersion=1.0.0
DefaultDirName={pf}\VMS Flutter Client
DefaultGroupName=VMS Flutter Client
OutputDir=output
OutputBaseFilename=VMSFlutterInstaller
Compression=lzma
SolidCompression=yes
WizardStyle=modern

AppPublisher=Vivas
AppPublisherURL=https://vivas.vn

[Files]
; Copy all files from Release folder
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Icons]
; Start menu shortcut
Name: "{group}\VMS Flutter Client"; Filename: "{app}\vms_flutter_client.exe"
; Desktop shortcut
Name: "{commondesktop}\VMS Flutter Client"; Filename: "{app}\vms_flutter_client.exe"

[Run]
; Option to launch app after install
Filename: "{app}\vms_flutter_client.exe"; Description: "Launch VMS Flutter Client"; Flags: nowait postinstall skipifsilent
