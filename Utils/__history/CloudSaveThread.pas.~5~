unit CloudSaveThread;

interface
uses Utilite, SysUtils, Classes, Controls, Forms;
type
  Tcloud = class
    public
      procedure saveToCloud(whereFrom:string);
      procedure loadFromCloud(whereTo:string);
  end;

TSaveThread = class(TThread)
  public DBDir:string;
  protected
  procedure Execute; override;
  procedure SaveProcess;
end;

implementation
uses MainForm;
procedure Tcloud.saveToCloud(whereFrom:string);
var  command, filename:string;
var cmd: TCmd;
begin

    filename := ExtractFileName(WhereFrom);
    WhereFrom := ExtractFileDir(WhereFrom);
    command := Format(' client_secret_for_Delphi.json %s %s', [WhereFrom, filename]);// %s %s',[GetCurrentDir,'saver\client_secret_for_Delphi.json', WhereTo, 'Dictionary.db']);
    cmd:=TCmd.Create('UploaderDB.exe', command, 'saver');
    cmd.WinExecAndWait;
    //shellexecute(0, 'open', 'UploaderDB.exe', Pchar(command), 'saver', SW_show);
    //shellexecute(0, 'open', PChar(theprogr), Pchar(command), nil, SW_SHOW);
end;
procedure Tcloud.loadFromCloud(whereTo: string);
//var command, filename:string;
 begin
    {
    filename:= ExtractFileName(WhereTo);
    WhereTo:= ExtractFileDir(WhereTo);
    command := Format('client_secret_for_Delphi.json %s %s', [WhereTo, filename]);// %s %s',[GetCurrentDir,'saver\client_secret_for_Delphi.json', WhereTo, 'Dictionary.db']);
    shellexecute(0, 'open', 'DownloadDB.exe', Pchar(command), nil, SW_HIDE);}
end;


procedure TSaveThread.Execute;
begin
  synchronize(SaveProcess);
end;

procedure TSaveThread.SaveProcess();
var Cloud: TCloud;
begin
    Cloud:=Tcloud.Create();
    Cloud.SaveToCloud(DBDir);
    Cloud.Free;
end;

end.
