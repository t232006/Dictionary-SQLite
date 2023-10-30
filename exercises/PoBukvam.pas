unit PoBukvam;

interface
uses classes, lessons;
type
TPoBukvam=class(TGeneral)
private
  _sl, _per:string;
  buf, bmas:TStringList;
public
  table:array [0..4,0..4] of string;
  property per:string read _per;
  property sl:string read _sl;
  function phrase:boolean;
private
  procedure Implement;
  procedure writeslovo;
public
  constructor Create;
end;

implementation

constructor TPoBukvam.Create;
var
ii,jj:byte;
begin
    inherited create(1);
    buf:=TStringList.Create;
    bmas:=TStringList.Create;
    writeslovo;//загаданные слово и перевод
    Implement;
    for jj:=0 to 4 do
    for ii:=0 to 4 do
      if  (5*jj+ii)<bmas.Count then table[ii,jj]:=bmas[5*jj+ii]
      else table[ii,jj]:='';
end;

procedure TPoBukvam.writeslovo;//ind-индекс верного ответа
var ind:integer;
begin
  randomize;
  ind:=random(length(v));
  _per:=v[ind].perevod;  _sl:=v[ind].slovo;
end;

function TPoBukvam.phrase:boolean; //отвечает фраза ли это или слово
var j,z:byte;
begin
      z:=0;
     for j:=0 to length(per)-1 do
     begin
      if per[j]=' ' then inc(z);
      if z>=3 then        //3 пробела - 4 слова
        begin
          phrase:=true;
          break;
        end else phrase:=false;
     end;
end;

procedure TPobukvam.Implement;
var st1:string;
j:byte;

         //..................................
begin
st1:='';
if phrase then
  begin
    j:=0;
    repeat
      while (per[j]<>' ') and (j<=length(per)) do
        begin
          st1:=st1+per[j];
          inc(j);
        end;
      buf.Add(st1);  //накопление слов из фразы
      inc(j);
      st1:='';
    until j>length(per)-1;
    //массив сформирован, теперь нужно его перемешать


  end else  //------------------------------------
  begin
     for j:=0 to length(per)-1 do
      buf.Add(per[j+1]);     //массив сформирован
  end;

  //---------------------------------
    repeat
      j:=random(buf.Count);
      bmas.Add(buf[j]);
      buf.Delete(j);
    until buf.Count=0;


end;

end.
