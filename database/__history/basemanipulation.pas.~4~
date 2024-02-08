unit basemanipulation;

interface

uses database, System.SysUtils, System.Types, ComCtrls;

type
  Tgrademanipulation = class

    private
      _potcount: string;
      _percent: string;
      //_space: TRect;
      DM: TDataModule2;
      reccount: integer;
      pc: integer;

    public
      //operation: byte;
      property potcount: string read _potcount;
      property percent: string read _percent;
      procedure searchandcor(add:boolean; field, word:string);
      procedure calcProgress;
      //function drawPot: TProgressBar;
      constructor Create(_DM: TDataModule2);


  end;
  procedure Seeking(sNum: string);
  procedure edittable(op:boolean);
  procedure baserefresh;
implementation

procedure edittable(op:boolean);
var no:integer;
    _sort:widestring;
begin
   with DM2.Dict do
   begin
      no:=RecNo;  //остаться на старой записи
      _sort:=Sort;
      Active:=false;
      ReadOnly :=not(op);//если редактировать, то не только чтение
      Active:=true;
      Sort:=_sort;
      RecNo:=no;
   end;
end;

procedure baserefresh;
begin
  {edittable(true);
  edittable(false);}
  dm2.Dict.Active:=false; dm2.Dict.Active:=true;
end;

procedure Seeking(sNum: string);
  begin
    DM2.addball.SQL.Text:='UPDATE Dict SET Relevation=Relevation+1 WHERE Number="'+sNum+'"';
    DM2.addball.ExecSQL;

  end;

{function Tgrademanipulation.drawPot: TProgressBar;
var
  intermed: TProgressBar;
begin
    intermed.Max:=reccount * 6;
    intermed.Position:=pc;
    result:=intermed;
end;    }

procedure Tgrademanipulation.calcProgress;
var
  answerscount: integer;

  percentNum: integer;
begin
    DM.potential.Active:=false;
    DM.potential.Active:=true;
    DM.selectsel.Active:=false; DM.selectsel.Active:=true;
    try
      answerscount := DM.dspotential.DataSet.Fields[0].AsInteger;
    except answerscount:=0;
    end;
    reccount := DM.selectsel.RecordCount;
    pc := reccount * 6 - answerscount;
    percentNum := trunc (pc / (reccount * 6) * 100);
    _potcount := IntToStr(pc);
    _percent := IntToStr(percentNum);

end;

constructor Tgrademanipulation.Create(_DM: TDataModule2);
begin
    DM:=_DM;
    //_space:=space;
    calcprogress;
end;

procedure Tgrademanipulation.searchandcor(add: Boolean; field: string; word: string);
begin
     with DM do
  begin
    if add then
      addball.SQL.Text:='UPDATE Dict SET Score=Score+1 WHERE (Score<6) and (' +field+'='''+word+''')'
    else
      addball.SQL.Text:='UPDATE Dict SET Score=Score-2 WHERE (' +field+'='''+word+''') and (Score>1)';
    addball.ExecSQL;
    calcProgress;
  end;
  baserefresh;
end;


end.
