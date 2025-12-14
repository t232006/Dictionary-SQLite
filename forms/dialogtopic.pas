unit dialogtopic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, database, Buttons, Grids, DBGrids, StdCtrls, DB, DBCtrls, basemanipulation;

type
  Ttopicform = class(TForm)
    DBGrid1: TDBGrid;
    AddBut: TSpeedButton;
    DelBut: TSpeedButton;
    EdBut: TSpeedButton;
    BitBtn1: TBitBtn;
    DBMemo1: TDBMemo;
    procedure EdButClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DelButClick(Sender: TObject);
    procedure AddButClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  topicform: Ttopicform;
  //itemlist:Tstrings;

implementation

{$R *.dfm}
procedure TopicRefresh;
begin
  with DM2 do
  begin
    //top.Active:=false;
    //top.Active:=true;
    topic.Active:=false;
    topic.Active:=true;
  end;
end;

procedure Ttopicform.EdButClick(Sender: TObject);
begin
     if EdBut.Down then
     with DBMemo1 do
       begin
        ReadOnly:=false;
        DataSource.DataSet.Edit;
        SetFocus;
       end
     else
     With DM2 do
     begin
        topic.Post;
        TopicRefresh;
        DBmemo1.ReadOnly:=true;
        DBGrid1.SetFocus;
     end;
end;

procedure Ttopicform.BitBtn1Click(Sender: TObject);
 
var k:byte;
begin
if DM2.topic.State in [dsedit, dsinsert]
then
begin
  EdBut.Down:=false;
  EdButClick(sender);
  //DM2.topic.Post;
  //DM2.topic.Refresh;
  //DM2.Dict.Refresh;
end else
begin
      if DelBut.Down then delbut.Down:=false else
      if AddBut.Down then AddBut.Down:=false else
      //if EdBut.Down then EdBut.Down:=false else //equals dm2.topic.state=[dsedit]
      if DBGrid1.SelectedRows.Count>0 then
      begin
        dbgrid1.DataSource.DataSet.DisableControls; //чтобы не перескакивать
        for k:=0 to DBGrid1.SelectedRows.Count-1 do
             begin
              DBGrid1.DataSource.DataSet.GotoBookmark(DBGrid1.SelectedRows.items[k]);;
              //DataModule2.dropch.ExecSQL;
              //DataModule2.topicquerly.SQL.Clear; //чтобы втрой раз не добавлять ту же строку
              if k>0 then  DM2.topicquery.SQL.Add(' or ');//for separation
              DM2.topicquery.SQL.Add('topic = '+ DM2.topic.Fields[0] .AsString );
             end;
        DM2.topicquery.ExecSQL;
        DBGrid1.DataSource.DataSet.enablecontrols;
      end;
      //DM2.Dict.Refresh;
      baserefresh;
end;
//DBGrid1.Options:=DBGrid1.Options-[dgediting];
end;

procedure Ttopicform.DelButClick(Sender: TObject);
begin
//DBGrid1.Options:=DBGrid1.Options+[dgediting];
if DelBut.Down then  DelBut.Caption:='точно удалить?'
else
begin
    DelBut.Caption:='удалить';
    dm2.Topic.Delete;
    TopicRefresh;
end;
end;

procedure Ttopicform.AddButClick(Sender: TObject);
begin
  if AddBut.Down then
  with DBMemo1 do
  begin
    SetFocus;
    ReadOnly:=false;
    DataSource.DataSet.Insert;
  end
  else
  begin
    if DBMemo1.Text='' then
      DM2.top.Cancel
    else
      DM2.topic.Post;
      DBMemo1.ReadOnly:=true;
      TopicRefresh;
      DBGrid1.SetFocus;
  end;
end;

procedure Ttopicform.DBGrid1CellClick(Column: TColumn);
begin
with DM2 do
begin
       top.Locate('id',topic.Fields[0].asinteger, []);
end;

end;

procedure Ttopicform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      DBGrid1.Options:=DBGrid1.Options-[dgediting];
end;

procedure Ttopicform.FormShow(Sender: TObject);
begin
     TopicRefresh;
end;

end.
