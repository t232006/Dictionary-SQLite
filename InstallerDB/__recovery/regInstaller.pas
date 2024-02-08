unit regInstaller;

interface
uses
  System.SysUtils,
  System.Classes,
  registry,
  winApi.Windows;
Type TDBRegistry=class
  reg:TRegistry;
  key1:string;
  private function IsWow64: bool;
  public
    procedure WritePath(filename:string);
    function GetPath: string;
    constructor Create;
    destructor Destroy;
end;

implementation

function TDBRegistry.IsWow64: bool;
type
  TIsWow64Process = function(hProcess: THandle;
    var Wow64Process: BOOL): BOOL; stdcall;
var
  IsWow64Process: TIsWow64Process;
begin
  Result := False;
  @IsWow64Process := GetProcAddress(GetModuleHandle(kernel32),
    'IsWow64Process');
  if Assigned(@IsWow64Process) then
    IsWow64Process(GetCurrentProcess, Result);
end;

destructor TDBRegistry.Destroy;
begin
  reg.Free;
end;

Constructor TDBRegistry.Create;
begin
    reg:=TRegistry.Create;
    reg.rootkey:= HKEY_LOCAL_MACHINE;
    if ISWow64 then
      key1:='SOFTWARE\WOW6432Node\ODBC\ODBC.INI\dictionary'
      else
      key1:='SOFTWARE\ODBC\ODBC.INI\dictionary';
end;

function TDBRegistry.GetPath: string;
begin
    if reg.OpenKey(key1, false) then
    result:=reg.ReadString('Database');
    reg.CloseKey;
end;

procedure TDBRegistry.WritePath(filename:string);
var key2:string;
begin
  with reg do
    begin
      if not(keyexists(key1)) then
      begin
        openkey(key1,true);
        WriteString('Driver','C:\WINDOWS\system32\sqlite3odbc.dll');
        CloseKey;
        if Iswow64 then
        key2:='SOFTWARE\WOW6432Node\ODBC\ODBC.INI\ODBC Data Sources'
        else
        key2:='SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources';
        openKey(key2,true);
        WriteString('dictionary','SQLite3 ODBC Driver');
        CloseKey;
      end;
      OpenKey(key1,false);
      WriteString('Database',filename);
      CloseKey;
    end;
end;
end.
