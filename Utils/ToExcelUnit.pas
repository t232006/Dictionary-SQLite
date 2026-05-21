unit ToExcelUnit;

interface
uses comobj, database, system.SysUtils, busyCheckerThread, winapi.Messages,
strutils, ShlObj, utilite, classes, comCtrls;
const
  FILENAME='Inserter\InsertForm.xlsx';
  DBLOADLISTNAME='Inserter\FromExcel.db';
type
TLoaderThread = class(TThread)
private
  fExcel:OleVariant;
  FOnFinish: TNotifyEvent;
  fErrorMessage: string;
  workbook, worksheet: variant;
  fBar: TProgressBar;
  procedure OnFinish;
protected
  procedure Execute; override;
public
  //property RowCount:word; read FRowCount;
  constructor Create(AExcel:OleVariant;
                      AOnFinish: TNotifyEvent;
                      var ABar:TProgressBar);
end;


TExcelUnit=class
private
  Excel, Workbook, Worksheet: variant;
  busyThread:busyChecker;
  EUT:TLoaderThread;
  procedure onThreadFinish(sender:TObject);
public
  procedure FromExcel(var bar:TProgressBar);
  procedure ToExcel;
  procedure FromExcelInit;
  constructor Create;
end;

implementation
uses mainForm;

constructor TExcelUnit.Create;
begin
   Excel:=createOLEobject('excel.application');
  Workbook:=Excel.workbooks.add;
  //Excel.visible:=true;
  Worksheet:=Excel.workbooks[1].worksheets[1];

  Worksheet.cells[1,2]:='слово';
  Worksheet.cells[1,3]:='перевод';
  Worksheet.cells[1,4]:='тема';
  Worksheet.cells[1,5]:='дата';
end;

procedure TExcelUnit.FromExcel(var bar:TProgressBar);

begin
    busythread.Terminate;
    EUT:=TLoaderThread.create(Excel, OnThreadFinish, Bar);
end;

procedure TExcelUnit.FromExcelInit;
begin
    Worksheet.columns[2].columnwidth:=30;
  Worksheet.columns[3].columnwidth:=30;
  Worksheet.columns[4].columnwidth:=25;
  Worksheet.columns[5].columnwidth:=0;
  workbook.saveas(getactualpath + FILENAME, 51);
  excel.visible:=true;
   if busyThread=nil then
    busyThread:=busyChecker.Create(false)
   else
    busyThread.Start;
    //
end;

procedure TExcelUnit.onThreadFinish(sender:TObject);
begin
    if EUT.fErrorMessage<>'' then
      raise Exception.Create(TLoaderThread(sender).fErrorMessage);
    EUT:=nil;
end;

procedure TExcelUnit.ToExcel;
var ij:variant;
begin
   Worksheet.columns[2].columnwidth:=60;
  Worksheet.columns[3].columnwidth:=60;
  Worksheet.columns[4].columnwidth:=50;
  Worksheet.columns[5].columnwidth:=40;
  with DM2.toExcelQuery do
  begin
      //sh.name:=FieldByName('topic').AsString;
      open;
      first;
      ij:=2;
      while not(eof) do
      begin
          Worksheet.cells[ij,2]:=FieldByName('word').AsString;
          Worksheet.cells[ij,3]:=FieldByName('translation').AsString;
          Worksheet.cells[ij,4]:=FieldByName('topic').AsString;
          Worksheet.cells[ij,5]:=FieldByName('daterec').AsString;
          next;
          inc(ij);
      end;

  end;
  excel.visible:=true;

end;

{ TExcelUnitThread }

constructor TLoaderThread.Create(AExcel: OleVariant;
                                    AOnFinish: TNotifyEvent;
                                    var ABar:TProgressBar);
begin
  inherited Create(true);
  FExcel:=AExcel;
  FOnFinish:=AOnFinish;
  FreeOnTerminate:=true;

end;

procedure TLoaderThread.Execute;
var j:word;
    sTopic, sDict, s,s2,s3,s4:string;
    RowCount: word;
begin
    RowCount:=2;
    FBar.Min:=RowCount;
    workbook:=Fexcel.Workbooks.open(getActualPath+FILENAME);
    Worksheet := Workbook.Worksheets[1];
    j:=2; sTopic:=''; sDict:='';
    s:='select id from Topic where Name=''';
    try
      with dm2 do
      begin
        synchConn.Params.Database:=getActualPath + DBLOADLISTNAME;
        ///synch.open;
        s2:=worksheet.cells[j,2];
        while s2<>'' do
        begin
          inc(RowCount);
          s2:=worksheet.cells[j,2];
        end;
        FBar.Max:=RowCount-2;

        For var i:=2 to RowCount do
        begin
          if Terminated then break;

          s3:=worksheet.cells[i,3]; s4:=worksheet.cells[i,4]; s2:=worksheet.cells[i,2];
           sTopic:=string.Format('(''%s''),',[s4]);

           sDict:=string.Format('select (''%s''),(''%s''),(%s) union ',[s2,s3,s+s4+'''']);

           insertListtopic.CommandText.add(sTopic);
           insertListDict.CommandText.add(sDict);

        end;
        delete(sTopic,length(STopic),1);
        sDict:=reverseString(sDict);
        sDict:=stringreplace(sDict,'noinu','',[rfIgnoreCase]);
        sDict:=reverseString(sDict);
        synchConn.ExecSQL('Delete from Topic'); synchConn.ExecSQL('Delete from Dict');
        commandDoAndReset(insertListTopic,sTopic);
        commandDoAndReset(insertListDict, sDict);
      end;
    except
        on E: Exception do fErrorMessage:=e.Message;
    end;
        workbook.close(false);
        deletefile(getActualPath + FILENAME);
        if not(terminated) then synchronize(OnFinish);
end;

procedure TLoaderThread.OnFinish;
begin
  if Assigned(FOnFinish) then FOnFinish(self);
end;

end.
