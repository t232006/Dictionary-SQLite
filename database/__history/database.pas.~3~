unit database;

interface

uses
  SysUtils, Classes, DB, Data.Win.ADODB;

type
  TDataModule2 = class(TDataModule)
    dspotential: TDataSource;
    dsselectsel: TDataSource;
    dstopic: TDataSource;
    ADOConnection: TADOConnection;
    top: TADOTable;
    Dict: TADOTable;
    dsdict: TDataSource;
    topic: TADOQuery;
    topicquery: TADOQuery;
    dropch: TADOCommand;
    selectsel: TADOQuery;
    potential: TADODataSet;
    addball: TADOQuery;
    droprate: TADOCommand;
    topid: TIntegerField;
    topicid: TIntegerField;
    topiccountdicttopic: TIntegerField;
    dropspot: TADOQuery;
    DictNumber: TAutoIncField;
    DictWord: TWideStringField;
    DictTranslation: TWideStringField;
    DictTopic: TIntegerField;
    DictScore: TSmallintField;
    DictUsersel: TBooleanField;
    DictRelevation: TIntegerField;
    DictSpot: TBooleanField;
    topName: TWideStringField;
    DictTopicName: TStringField;
    DictDateRec: TDateField;
    topicName: TWideStringField;
    DictPhrase: TBooleanField;
    dssynch: TDataSource;
    deepsearch: TADOCommand;
    synch: TADOQuery;
    synchAttachDetach: TADOCommand;
    synchConn: TADOConnection;
    procedure vokabAfterRefresh(DataSet: TDataSet);
    procedure synchAfterOpen(DataSet: TDataSet);
    procedure ReloadConnection;
    procedure synchBeforeOpen(DataSet: TDataSet);
    procedure synchBeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //procedure edittable(op:boolean);

var
  DM2: TDataModule2;

implementation

uses MainForm;


{$R *.dfm}
procedure TDataModule2.ReloadConnection;
begin
  ADOConnection.Connected:=false;
  ADOConnection.Connected:=true;
  Dict.Active:=true;
  Top.Active:=true;
  Topic.Active:=true;
  selectsel.Active:=true;
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
  synchAttachDetach.CommandText:='detach database TempDB';
  synchAttachDetach.Execute;
end;

procedure TDataModule2.synchBeforeOpen(DataSet: TDataSet);
begin
    synchAttachDetach.CommandText:='attach database '''+form1.baseFolder.Caption+''' as TempDB';
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
