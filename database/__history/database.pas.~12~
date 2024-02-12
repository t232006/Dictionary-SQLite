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
  TDataModule2 = class(TDataModule)
    dspotential: TDataSource;
    dsselectsel: TDataSource;
    dstopic: TDataSource;
    dsdict: TDataSource;
    dssynch: TDataSource;
    synchConn: TFDConnection;
    synch: TFDQuery;
    synchAttachDetach: TFDCommand;
    FDConnection: TFDConnection;
    Dict1: TFDTable;
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
    Dict1Number: TFDAutoIncField;
    Dict1Word: TWideStringField;
    Dict1Translation: TWideStringField;
    Dict1DateRec: TDateField;
    Dict1Score: TSmallintField;
    Dict1Usersel: TBooleanField;
    Dict1Phrase: TBooleanField;
    Dict1Relevation: TIntegerField;
    Dict1Spot: TBooleanField;
    Dict1Topic: TIntegerField;
    Dict1TopicName: TStringField;
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
  DM2: TDataModule2;

implementation

uses MainForm, saver;


{$R *.dfm}

procedure TDataModule2.Dict1AfterInsert(DataSet: TDataSet);
begin
  if DataSet.RecordCount=6 then
    form1.PagesBlock(false);
end;

function TDataModule2.loadDB(dbPath:string):boolean;
begin
   if FileExists(dbPath) then
   begin
    FDConnection.Params.Database:=dbPath;
    FDConnection.Connected:=false;
    FDConnection.Connected:=true;
    Dict.Active:=true;
    Top.Active:=true;
    Topic.Active:=true;
    selectsel.Active:=true;
    if Dict.RecordCount<6 then form1.PagesBlock(true);
    result:=true;
   end
   else result:=false;


end;

procedure TDataModule2.synchAfterOpen(DataSet: TDataSet);
begin
with form1 do
  begin
    SpeedButton9.Enabled:=true;
    StBar.panels[1].Text:='Выделено слов: '+inttostr(DBGrid2.SelectedRows.Count);
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
  form1.StBar.panels[0].Text:='Всего слов: '+inttostr(DataSet.RecordCount);
end;


end.
