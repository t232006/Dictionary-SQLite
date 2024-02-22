unit Utilite;

interface
uses WinAPI.Windows, System.SysUtils, VCL.forms,
      shellAPI, Classes, strUtils, ShlObj;

type arraydir = array[0..255] of char;
TCmd = class
    private Programname, params, dir: string;
    public
    Constructor Create(Programname, params, dir: String);
    function WinExecAndWait:cardinal;
    function RunCmd:string;
end;

function runcmd(aString: WideString): string;

function getfilesList(): TStringList;
function GetSpecialPath(CSIDL: word):string;


implementation

function GetSpecialPath(CSIDL: word): string;
var s: PChar;
begin
s:=stralloc(max_path);
if not SHGetSpecialFolderPath(0, s, CSIDL, true)
then s := '';
result := s;
end;

function getfilesList(): TStringList;
type Tcollect=array of string;
procedure split(s:string; c:char; var collection:TCollect);
var _pos:word;  col:Tcollect;
begin
  while s<>'' do
  begin
    setlength(collection, length(collection)+1);
    //s:=trim(s);
    _pos:=AnsiPos(c,s);
    //if _pos=0 then _pos:=length(s);
    collection[length(collection)-1]:=trim(AnsiLeftStr(s,_pos));
    delete(s,1,_pos);
  end;
end;
var f:textfile;
    s:string;
    sList:TStringList;
    sArr:Tcollect;  i:word;
    filename:string;
begin
   filename:=Concat(GetSpecialPath(CSIDL_APPDATA),'\Individual dictionary\','fileslist.b');
   try
     assignfile(f, filename);
     reset(f);
     readln(f,s);
     closefile(f);
     sList:=TStringList.Create;
     split(s,' ',sArr);
     for i := Low(sArr) to High(sArr) do
      sList.Add(sArr[i]);
     //DeleteFile(filename);
   finally
   result:=sList;
   end;
end;

constructor TCmd.Create(Programname, params, dir: string);
var WorkDir:string;
begin
     //self.params:=params;
     GetDir(0,WorkDir);
     self.ProgramName:=WorkDir+'\'+dir+'\'+ProgramName;
     //self.Programname:=Programname;
     self.dir:=dir;
     self.params:=self.programName+' '+params;
end;

function TCmd.WinExecAndWait:cardinal;
    var
     StartupInfo:TStartupInfo;
     ProcessInfo:TProcessInformation;
    begin
       FillChar(StartupInfo,Sizeof(StartupInfo),#0);
     StartupInfo.cb:= Sizeof(StartupInfo);
     StartupInfo.dwFlags:= STARTF_USESHOWWINDOW;
     StartupInfo.wShowWindow:= SW_SHOW;
     if not CreateProcess(nil,
      PChar(params),
      nil,
      nil,
      false,
      CREATE_NEW_CONSOLE or
      NORMAL_PRIORITY_CLASS,
      nil,
      nil,
      StartupInfo,
      ProcessInfo) then result := 0
     else begin
      WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, result);
     end;
      //shellexecute(0, 'open', Pchar(Programname), Pchar(params), Pchar(dir), SW_show);
  end;

function runcmd(aString: WideString): string;
const
  CReadBuffer = 2400;
var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dRead: DWord;
  dRunning: DWord;
begin
  Result := '';

  saSecurity.nLength := SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle := True;
  saSecurity.lpSecurityDescriptor := nil;

  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
  begin
    try
      FillChar(suiStartup, SizeOf(TStartupInfo), #0);
      suiStartup.cb := SizeOf(TStartupInfo);
      suiStartup.hStdInput := hRead;
      suiStartup.hStdOutput := hWrite;
      suiStartup.hStdError := hWrite;
      suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      suiStartup.wShowWindow := SW_HIDE;

      if CreateProcessW(PChar(astring), nil, @saSecurity, @saSecurity, True,
        CREATE_NEW_PROCESS_GROUP or NORMAL_PRIORITY_CLASS, nil, nil,
        suiStartup, piProcess) then
      begin
        CloseHandle(hWrite);
        try
          repeat
            dRunning := WaitForSingleObject(piProcess.hProcess, 100);

            repeat
              dRead := 0;
              if ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil) then
              begin
                pBuffer[dRead] := #0;
                //OemToAnsi(pBuffer, pBuffer);
                Result := Result + String(pBuffer);
              end else
              result:='error '+floattostr(getlasterror());
            until (dRead < CReadBuffer);
          until (dRunning <> WAIT_TIMEOUT);
        finally
          CloseHandle(piProcess.hProcess);
          CloseHandle(piProcess.hThread);
        end;
      end else
        raise Exception.Create('Can not CreateProcess ' + QuotedStr(aString));
    finally
      CloseHandle(hRead);
    end;
  end else
    raise Exception.Create('Can not CreatePipe ' + QuotedStr(aString));
end;

  function Tcmd.RunCMD:string;
const BUFSIZE = 2000;
var SecAttr: TSecurityAttributes;
    hReadPipe, hWritePipe: THandle;
    StartupInfo: TStartUpInfo;
    ProcessInfo: TProcessInformation;
    Buffer: PAnsichar;
    WaitReason,BytesRead: DWord;
    WorkDir: string;
begin  // start
 with SecAttr do
  begin
   nlength:= SizeOf(TSecurityAttributes);

   binherithandle:= true;
   lpsecuritydescriptor:= nil;
  end;
 if Createpipe(hReadPipe, hWritePipe, @SecAttr, 0) then
  begin
   Buffer:= AllocMem(BUFSIZE + 1);
   FillChar(StartupInfo, Sizeof(StartupInfo), #0);
   StartupInfo.cb:= SizeOf(StartupInfo);
   StartupInfo.hStdOutput:= hWritePipe;
   StartupInfo.hStdInput:= hReadPipe;
   StartupInfo.dwFlags:= STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
   StartupInfo.wShowWindow:= SW_HIDE;
   params:=params+' '; // бубен без него не работает
// смысл бубна в обязательном наличии любых изменений перемменной comand чтобы компилятор видел
   if CreateProcess(PChar(Programname), PChar(params), @SecAttr, @SecAttr, false, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
    begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    //GetExitCodeProcess(ProcessInfo.hProcess, result);
    result:='';
     repeat
      WaitReason:= WaitForSingleObject( ProcessInfo.hProcess, 100);
      Application.ProcessMessages;
     until(WaitReason <> WAIT_TIMEOUT);
     repeat
      BytesRead := 0;
      ReadFile(hReadPipe, Buffer[0], BUFSIZE, BytesRead, nil);
      Buffer[BytesRead]:= #0;
      //OemToAnsi(Buffer,Buffer);
      result := result + String(Buffer);
     until(BytesRead < BUFSIZE);
    end;
   FreeMem(Buffer);
   CloseHandle(ProcessInfo.hProcess);
   CloseHandle(ProcessInfo.hThread);
   CloseHandle(hReadPipe);
   CloseHandle(hWritePipe);
  end;
end;

end.
