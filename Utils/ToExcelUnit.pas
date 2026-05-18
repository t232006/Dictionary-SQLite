unit ToExcelUnit;

interface
uses comobj, database, system.SysUtils, busyCheckerThread, winapi.Messages,
strutils, ShlObj, utilite;
const
  FILENAME='Inserter/InsertForm.xlsx';
  DBLOADLISTNAME='Inserter/FromExcel.db';
type
TExcelUnit=class
private
  Excel, Workbook, Worksheet: variant;
  busyThread:busyChecker;


public
  procedure FromExcel;
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

procedure TExcelUnit.FromExcel;
var j:word;
    sTopic, sDict, s,s2,s3,s4:string;
begin
    busythread.Terminate;
    //busythread.free;
    {$IFDEF DEBUG}
      workbook:=excel.Workbooks.open(ExtractFilePath(ParamStr(0)) + FILENAME);
    {$ENDIF}
    {$IFDEF RELEASE}
      workbook := GetSpecialPath(CSIDL_APPDATA)+'\'+FILENAME;
    {$ENDIF}



    Worksheet := Workbook.Worksheets[1];
    j:=2; sTopic:=''; sDict:='';
    s:='select id from Topic where Name=''';
    try
    with dm2 do
    begin
      synchConn.Params.Database:=DBLOADLISTNAME;
      ///synch.open;
      s2:=worksheet.cells[j,2];
      while s2<>'' do
      begin
        s3:=worksheet.cells[j,3]; s4:=worksheet.cells[j,4];
         sTopic:=sTopic+string.Format('(''%s''),',[s4]);

         sDict:=sDict+string.Format('select (''%s''),(''%s''),(%s) union ',[s2,s3,s+s4+'''']);

//         insertListtopic.CommandText.Insert(1,sTopic);
 //        insertListDict.CommandText.Insert(1,sDict);

         insertListtopic.CommandText.add(sTopic);
         insertListDict.CommandText.add(sDict);

         inc(j);
         s2:=worksheet.cells[j,2];
      end;
      delete(sTopic,length(STopic),1);
      sDict:=reverseString(sDict);
      sDict:=stringreplace(sDict,'noinu','',[rfIgnoreCase]);
      sDict:=reverseString(sDict);
      synchConn.ExecSQL('Delete from Topic'); synchConn.ExecSQL('Delete from Dict');
      commandDoAndReset(insertListTopic,sTopic);
      commandDoAndReset(insertListDict, sDict);
    end;
    finally
        workbook.close(false);
        deletefile(ExtractFilePath(ParamStr(0)) + FILENAME);
    end;
end;

procedure TExcelUnit.FromExcelInit;
begin
    Worksheet.columns[2].columnwidth:=30;
  Worksheet.columns[3].columnwidth:=30;
  Worksheet.columns[4].columnwidth:=25;
  Worksheet.columns[5].columnwidth:=0;
  workbook.saveas(ExtractFileDir(paramstr(0))+ '\'+FILENAME, 51);
  excel.visible:=true;
   if busyThread=nil then
    busyThread:=busyChecker.Create(false)
   else
    busyThread.Start;
    //
end;

procedure TExcelUnit.ToExcel;
var ij:variant;
begin
   Worksheet.columns[2].columnwidth:=60;
  Worksheet.columns[3].columnwidth:=60;
  Worksheet.columns[4].columnwidth:=50;
  Worksheet.columns[5].columnwidth:=40;
  with DM2.Dict do
  begin
      //sh.name:=FieldByName('topic').AsString;
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

end.
