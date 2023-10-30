unit lesson4;

interface

uses SysUtils, Controls, lessons, database;

type
   TComplience = class (TGeneral)
private

public
    o1,o2:array [1..12] of slpersl; //массивы для задания для соответствий
    constructor Create;
    function outword(_komp:byte; slovo:boolean): string;
    //procedure determ;
//procedure apostr(var dest:string);
end;


implementation
function TComplience.outword(_komp:byte; slovo:boolean): string;
begin
     if slovo then
      result:=o2[_komp-6].slovo
     else
      result:=o1[_komp].perevod;
end;

{procedure apostr(var dest:string);
var ppos:byte;
begin
   ppos:=pos('''',dest);
  insert('''',dest,ppos);
end;   }


constructor Tcomplience.Create;
var
  l:integer; jk,i:byte; oo1,oo2,oo:set of byte;
begin
  inherited Create(6);
  randomize;
  oo1:=[]; oo2:=[];oo:=[];
  for i:=1 to 6 do
  begin
     repeat
     l:=random(length(v)); //взяли случайно слово
     until not (l in oo); //чтобы не повторялось
     oo:=oo+[l];
     repeat
     jk:=random(6)+1; //индекс первого массива ответов
     until not (jk in oo1);
     oo1:=oo1+[jk];
     o1[jk].slovo:=v[l].slovo; //кладем слово
     o1[jk].perevod:=v[l].perevod;
     repeat
      jk:=random(6)+1; //индекс второго массива ответов
     until not (jk in oo2);
     oo2:=oo2+[jk];
     o2[jk].perevod:=v[l].perevod; //кладем слово
     o2[jk].slovo:=v[l].slovo;

  end;
end;



{procedure determ;  //opriciation for every word
var m:byte;

begin
    for m:=1 to 6 do
      searchandcor(false,'word',o1[m].slovo);
end;    }


end.

