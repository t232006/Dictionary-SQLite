unit BusyCheckerThread;

interface

uses
  System.Classes, winapi.activeX, windows, sysutils, utilite;



type
  BusyChecker = class(TThread)
  private
    function IsDocumentLocked(const fname:string):boolean;
  protected
    procedure Execute; override;
  end;

implementation
uses ToExcelUnit, mainForm;

function BusyChecker.IsDocumentLocked(const FName: string): Boolean;
var
  HFile: THandle;
begin
  Result := True;
  if not FileExists(FName) then
  begin
    Result := True; //locked nevethless
    Exit;
  end;

  HFile := CreateFile(PChar(FName),
                      GENERIC_READ or GENERIC_WRITE,
                      0,                    // FILE_SHARE_NONE Ч эксклюзивно
                      nil,
                      OPEN_EXISTING,
                      FILE_ATTRIBUTE_NORMAL,
                      0);

  if HFile <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(HFile);
    Result := False;
  end;

end;

{ BusyChecker }

procedure BusyChecker.Execute;
begin
   repeat
      sleep(200);
   until not(IsDocumentLocked(GetActualPath+FILENAME));
   synchronize(procedure
   begin
     form1.completeListLoader;
   end
   )
end;

end.
