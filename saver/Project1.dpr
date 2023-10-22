program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  windows,
  shellapi;

var theprogr, command, whereto:string;
begin
    //command:=Format('saver\DownloadDB.exe "%s" "%s" "%s"',['saver\client_secret_for_Delphi.json', WhereTo, 'Dictionary.db']);
    whereto:='z:\Программирование';
    theprogr:=Format('%s\DownloadDB.exe ',[GetCurrentDir]);
    command:= 'saver\client_secret_for_Delphi.json '+ Whereto + ' блокнот.txt';// %s %s',[GetCurrentDir,'saver\client_secret_for_Delphi.json', WhereTo, 'Dictionary.db']);
    shellexecute(0, 'open', PChar(theprogr), Pchar(command), nil, SW_SHOWNORMAL);
    Writeln('первичная консоль');
    Readln;
end.
