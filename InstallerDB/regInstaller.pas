unit regInstaller;

interface
uses
  System.SysUtils,
  System.Classes,
  registry,
  winApi.Windows;
procedure InstallReg(filename:string);

implementation
procedure InstallReg(filename:string);
var reg:TRegistry;  key1, key2:string;
begin
  reg:=Tregistry.Create;
  key1:='SOFTWARE\ODBC\ODBC.INI\dictionary';
  with reg do
    begin
      rootkey:= HKEY_LOCAL_MACHINE;
      if not(keyexists(key1)) then
      begin
        openkey(key1,true);
        WriteString('Driver','C:\WINDOWS\system32\sqlite3odbc.dll');
        CloseKey;
        key2:='SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources';
        openKey(key2,true);
        WriteString('dictionary','SQLite3 ODBC Driver');
        CloseKey;
      end;
      OpenKey(key1,false);
      WriteString('Database',filename);
      CloseKey;
      Destroy;
    end;
end;
end.
