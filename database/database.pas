unit database;

interface

uses
  SysUtils, Classes, DB, Data.Win.ADODB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  Tdatamodule2 = class(TDataModule)
    dspotential: TDataSource;
    dsselectsel: TDataSource;
    dstopic: TDataSource;
    dsdict: TDataSource;
    dssynch: TDataSource;
    synchConn: TFDConnection;
    synch: TFDQuery;
    synchAttachDetach: TFDCommand;
    FDConnection: TFDConnection;
    Top: TFDTable;
    Topic: TFDQuery;
    Topicquery: TFDQuery;
    potential: TFDQuery;
    dropspot: TFDQuery;
    addball: TFDQuery;
    selectsel: TFDQuery;
    deepsearch: TFDCommand;
    dropch: TFDCommand;
    droprate: TFDCommand;
    dsTop: TDataSource;
    Dict: TFDQuery;
    DictNumber: TFDAutoIncField;
    DictWord: TWideStringField;
    DictTranslation: TWideStringField;
    DictTopic: TIntegerField;
    DictDateRec: TDateField;
    DictRelevation: TIntegerField;
    DictScore: TSmallintField;
    DictUsersel: TBooleanField;
    DictSpot: TBooleanField;
    DictPhrase: TBooleanField;
    DictTopicName: TWideStringField;
    FDQuery1: TFDQuery;
    recordCount: TFDQuery;
    SelectedCount: TFDQuery;
    function GetRecordCount:string;
    function GetSelectedCount:string;
    procedure vokabAfterRefresh(DataSet: TDataSet);
    procedure synchAfterOpen(DataSet: TDataSet);
    function loadDB(dbPath:string):boolean;
    procedure synchBeforeOpen(DataSet: TDataSet);
    procedure synchBeforeClose(DataSet: TDataSet);
    procedure Dict1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //procedure edittable(op:boolean);

var
  DM2: Tdatamodule2;

implementation

uses MainForm, saver;


{$R *.dfm}

function TDataModule2.GetRecordCount:string;
begin
    RecordCount.Close;
    RecordCount.open;
    result:=inttostr(RecordCount.fields[0].asInteger);
end;

function Tdatamodule2.GetSelectedCount: string;
begin
    SelectedCount.Close;
    SelectedCount.open;
    result:=inttostr(SelectedCount.fields[0].asInteger);
end;

procedure TDataModule2.Dict1AfterInsert(DataSet: TDataSet);
begin
  //FDConnection.Commit;
  if DataSet.RecordCount=6 then
    form1.PagesBlock(false);
  Form1.StBar.panels[0].Text:='Всего слов: '+ GetRecordCount;
  form1.test.recreate:=true;
end;

function TDataModule2.loadDB(dbPath:string):boolean;
begin
   if FileExists(dbPath) then
   begin
    FDConnection.Params.Database:=dbPath;
    FDConnection.Connected:=false;
    FDConnection.Connected:=true;
    try
      Dict.Active:=true;
      Top.Active:=true;
      Topic.Active:=true;
      selectsel.Active:=true;
      if Dict.RecordCount<6 then form1.PagesBlock(true);
      Form1.StBar.panels[0].Text:='Всего слов: '+GetRecordCount;
      result:=true;
    except
       result:=false;
    end;
   end
   else result:=false;


end;

procedure TDataModule2.synchAfterOpen(DataSet: TDataSet);
begin
with form1 do
  begin
    SpeedButton9.Enabled:=true;
    StBar.panels[1].Text:='Выделено слов: '+GetSelectedCount;
    Fill4Status;
  end;
end;

procedure TDataModule2.synchBeforeClose(DataSet: TDataSet);
begin
  synchAttachDetach.CommandText.Add('detach database TempDB');
  synchAttachDetach.Execute;
end;

procedure TDataModule2.synchBeforeOpen(DataSet: TDataSet);
begin
    synchAttachDetach.CommandText.Add('attach database '''+form1.baseFolder.Caption+''' as TempDB');
    synchAttachDetach.Execute;
end;

procedure TDataModule2.vokabAfterRefresh(DataSet: TDataSet);
//var R:Integer;
begin
  seAndCor.calcProgress;
  form1.StBar.Panels[4].Text:='Потенциал: '+seAndCor.potcount;
  {if (DataSet.Filtered) then
    begin
      DataSet.Filtered:=false;
      R:=DataSet.RecordCount;
      form1.StBar.panels[0].Text:='Всего слов: '+inttostr(R);
      DataSet.Filtered:=true;
    end;  }
  form1.StBar.panels[0].Text:='Всего слов: '+GetRecordCount;
end;


end.
