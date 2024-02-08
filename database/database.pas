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
    Dict: TFDTable;
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
    DictNumber: TFDAutoIncField;
    DictWord: TWideStringField;
    DictTranslation: TWideStringField;
    DictDateRec: TDateField;
    DictScore: TSmallintField;
    DictUsersel: TBooleanField;
    DictPhrase: TBooleanField;
    DictRelevation: TIntegerField;
    DictSpot: TBooleanField;
    DictTopic: TIntegerField;
    DictTopicName: TStringField;
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
  FDConnection.Connected:=false;
  FDConnection.Connected:=true;
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
    StBar.panels[1].Text:='�������� ����: '+inttostr(DBGrid2.SelectedRows.Count);
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
  form1.StBar.Panels[4].Text:='���������: '+seAndCor.potcount;
  {if (DataSet.Filtered) then
    begin
      DataSet.Filtered:=false;
      R:=DataSet.RecordCount;
      form1.StBar.panels[0].Text:='����� ����: '+inttostr(R);
      DataSet.Filtered:=true;
    end;  }
  form1.StBar.panels[0].Text:='����� ����: '+inttostr(DataSet.RecordCount);
end;


end.
