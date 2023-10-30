unit lessons;

interface

uses       SysUtils,  Controls, database, Dialogs, Graphics, basemanipulation;

type
  {worded=record
    ind:word;
    slovo:string;
    perevod:string; }
    //topic:word;
    //date:TDate;
    //reit:byte;
  //end;
  SlPerSl=record
    slovo:string;
    perevod:string;
  end;
 otv=array[0..6] of SlPerSl; //массив,отвечающий за ответы

 TGeneral=class
     v:array of SlPerSl;  //заполнение массива отдельной процедурой
     constructor Create(countrec:byte);
 end;

 TYesNo=class(TGeneral)
 public
    promptcolor:Tcolor;
 private
    //_answer:boolean;
    _serial:byte;
    _prompt:string;
    _GetString:string;
    word1:string;
    word2:string;
    IsItTrue:boolean;
    seAndCor:Tgrademanipulation;
 public
    property serial:byte read _serial;
    property prompt:string read _prompt;
    property GetString:string read _GetString;
    procedure GiveAnswer(answer:boolean);
    procedure Init;
    procedure Reset;
 end;
 TTest=class(TGeneral)
    public
    procedure slovoPer(var w:otv; var ind:byte); //ind-верный вариант
    procedure PerevodSlo(var w:otv; var ind:byte); //ind-верный вариант
 end;
//var

//bmas: array of string; //массив букв или слов

implementation

uses DB;

procedure TYesNo.Reset();
begin
   _serial:=0;
end;

procedure TYesNo.GiveAnswer(answer: boolean);
begin
    if answer=IsItTrue then
  begin
    inc(_serial); //serial of true answers
    PromptColor:=clgreen;
    _prompt:='вы правы';
    if IsItTrue=true then
    begin
      seAndCor.searchandcor(true,'word',word1);
      seAndCor.searchandcor(true,'translation',word2);
    end;
  end else
  begin
    reset;
    PromptColor:=clred;
    _prompt:='вы неправы';
  end;
end;

procedure TYesNo.Init;
var giveTrue:byte;
    l,ll:integer;
begin
  seAndCor:=Tgrademanipulation.Create(DM2);
  randomize;
  giveTrue:=random(2);
  l:=random(length(v)); //conjectived word
  repeat
    ll:=random(length(v)); //wrong answer
  until l<>ll;
  if giveTrue=1 then
  begin
    word1:=v[l].slovo;
    word2:=v[l].perevod;
    IsItTrue:=true;
  end else
  begin
    word1:=v[l].slovo;
    word2:=v[ll].perevod;
    IsItTrue:=false;
  end;
  _GetString:=word1+' = '+word2;


end;


constructor TGeneral.Create(countrec:byte);
var {f:text; ss:string;} i:word;
procedure zapmas (kl:word);
begin
    with DM2.Dict do
  begin
    //v[kl].ind:=kl;
    v[kl].slovo:=Fields[1].AsString;
    v[kl].perevod:=fields[2].AsString;
    //v[kl].date:=fields[4].AsDateTime;
    //v[kl].topic:=fields[3].AsInteger;
    //v[kl].reit:=fields[5].AsInteger;
  end;
end;
begin

    //---------------------------------------
  with DM2.Dict do
  begin
    Open;
    if RecordCount<countrec then
    begin
      DM2.topicquery.SQL.Text:='UPDATE Dict SET usersel=true';//если отмечено менее 6 записей, то выделить все записи
      DM2.topicquery.ExecSQL;
      showmessage('выделены все записи, поскольку должно быть не менее '+inttostr(countrec));
      Close; Open;
    end;

    setlength(v,RecordCount);
    First;
    for i:=0 to RecordCount-1 do
    begin
      zapmas (i); //заполнить нулевой
      Next;
    end;
  end;
end;

procedure TTest.PerevodSlo(var w:otv; var ind:byte); //ind-верный вариант; w по сути string
var l:integer;
    i,g:byte;
    j:set of byte; //распределение ответов
    jj:set of byte;
begin
    randomize;
    j:=[]; jj:=j;
    l:=random(length(v)); //загаданное слово (индекс)
    w[0].perevod:=v[l].perevod; //загаданное слово
    g:=random(6)+1;  //любому варианту
    w[g].slovo:=v[l].slovo;  // даем верный ответ
    ind:=g;
    j:=j+[g];  jj:=jj+[l];
    for i:=2 to 6 do  //остальным даем неверные
    begin
      repeat
        g:=random(6)+1;
      until not(g in j);
      j:=j+[g];
      repeat
        l:=random(length(v));//генерим любой вариант
      until not(l in jj);
      jj:=jj+[l];      //чтобы не было повторов
      w[g].slovo:=v[l].slovo; //кладем в неверный вариант
      w[g].perevod:=v[l].perevod;
    end;
end;

procedure TTest.slovoPer(var w:otv; var ind:byte); //ind-верный вариант;w record со словом-переводом
var l:integer;
    i,g:byte;
    j:set of byte; //распределение ответов
    jj:set of byte;
begin
    randomize;
    j:=[]; jj:=j;
    l:=random(length(v)); //загаданное слово (индекс)
    w[0].slovo:=v[l].slovo; //загаданное слово
      g:=random(6)+1;  //любому варианту
       w[g].perevod:=v[l].perevod;  // даем верный ответ
    ind:=g;
      j:=j+[g];  jj:=jj+[l];
    for i:=2 to 6 do  //остальным даем неверные
    begin
      repeat
        g:=random(6)+1;
      until not(g in j);
      j:=j+[g];
      repeat
        l:=random(length(v));//генерим любой вариант
      until not(l in jj);
      jj:=jj+[l];      //чтобы не было повторов
      w[g].perevod:=v[l].perevod; //кладем в неверный вариант
      w[g].slovo:=v[l].slovo; //put wrong word
    end;
end;

//-----------------------------------


end.
