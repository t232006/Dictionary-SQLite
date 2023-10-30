unit dateform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, database, StdCtrls, DBCtrls, Buttons, remproc, Grids, DBGrids,
  Data.DB, Data.Win.ADODB;

type
  Tdateformm = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    dsdateq: TDataSource;
    dateq: TADOQuery;
    dateqcountdaterec: TIntegerField;
    dateqDateRec: TDateField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dateqDateRecGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dateformm: Tdateformm; //datetr:Tdatethread;

implementation

uses  MainForm;

{$R *.dfm}


procedure Tdateformm.FormShow(Sender: TObject);
begin
    tag:=0;
    if Form1.selspot.Checked then
    begin
      if dateq.SQL.Count=2 then dateq.SQL.Insert(1,'where usersel=true')
    end else
    begin
      if dateq.sql.Count=1 then dateq.sql.delete(1);
    end;
    dateq.Close;
    dateq.open;
end;

procedure Tdateformm.BitBtn1Click(Sender: TObject);
var im:byte;
    myday:TDate;
    Smyday:string;

begin

    with DM2 do
    begin
      topicquery.SQL.Add('(');
      for im := 0 to dbgrid1.selectedrows.Count-1 do
        begin
          dbgrid1.DataSource.DataSet.GotoBookmark(dbgrid1.selectedrows.items[im]);
          myday:=dateq.Fields[0].AsDateTime;
          //smyday:=StringReplace(smyday,'.','-',[rfReplaceAll]);
          //smyday:=datetostring(myday);//вставляет нужный разделитель
          DateTimeToString(smyday,'yyyy-mm-dd',myday);
          if im>0 then

          DM2.topicquery.SQL.Add('or');
        DM2.topicquery.SQL.Add('DateRec= '''+smyday +'''');

        end;
      {topicquerly.SQL.Delete(topicquerly.SQL.Count-1);}//удаляем крайний and
      topicquery.SQL.Add(')');
      topicquery.ExecSQL;
      //vokab.Refresh;
    end;
 end;

procedure Tdateformm.dateqDateRecGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  text:=sender.AsString;
end;

procedure Tdateformm.DBGrid1TitleClick(Column: TColumn);
begin
   with dateq do
   begin
    if tag<>0 then sql.Delete(sql.Count-1);
    if (tag=1) or (tag=0) then
    begin
      sql.add('order by daterec desc');
      tag:=2;
    end else
    begin
      sql.add('order by daterec ');
      tag:=1;
    end;
    open;
    // memo1.Lines:=sql;
 end;


end;

end.
