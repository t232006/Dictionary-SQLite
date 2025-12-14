unit addnewword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, database, StdCtrls, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  Menus, basemanipulation, Vcl.Mask, ansistrings;

type
  Taddneword = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit2Enter(Sender: TObject);
    procedure LabeledEdit1Enter(Sender: TObject);
  private
    { Private declarations }
    function isItPhrase(sl:string):boolean;
  public
    { Public declarations }
  end;

var
  addneword: Taddneword;

implementation

uses DB, dialogtopic, lessons, MainForm;

{$R *.dfm}

function Taddneword.isItPhrase(sl:string):boolean; //отвечает фраза ли это или слово
var j,z:byte;
    s:string;
begin
      s:=ansireplacetext(sl,', ','');// to exclude list of words
      z:=0;
     for j:=0 to length(sl)-1 do
      if sl[j]=' ' then inc(z);
    if z>=3 then        //3 пробела - 4 словая
        result:=true
    else result:=false;
end;

procedure Taddneword.BitBtn1Click(Sender: TObject);
begin
  try
  edittable(true);
  with DM2.Dict do
  begin
    Insert;
    Fields[1].AsString:=LabeledEdit1.Text;
    Fields[2].AsString:=LabeledEdit2.Text;
    fields[3].AsInteger:=DBLookupComboBox1.KeyValue;
    if (isItPhrase(labelededit2.Text) and isItPhrase(labelededit1.Text)) then
    FieldByName('Phrase').AsBoolean:=true else
    FieldByName('Phrase').AsBoolean:=false;
    //FieldByName('DateRec').AsDateTime:=Date;
    Post;
    LabeledEdit1.Text:='';
    LabeledEdit2.Text:='';
    LabeledEdit2.SetFocus;
    edittable(false);
  end;
  except
    DM2.Dict.Delete;
    edittable(false);
    addneword.Close;
    form1.WindowState:=wsMaximized;
  end;
end;

procedure Taddneword.Label2Click(Sender: TObject);
begin
  topicform.showmodal;
end;

procedure Taddneword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    form1.WindowState:=wsMaximized;
end;

procedure Taddneword.LabeledEdit2Change(Sender: TObject);
begin
  label3.Caption:=inttostr(255- LabeledEdit2.GetTextLen);
end;

procedure Taddneword.LabeledEdit2Enter(Sender: TObject);
Var
KK : HKL;
  KBid : Integer;
Const
  USKeyboard = 1033;
  RusKeyboard = 1049;
begin
  KK := GetKeyboardLayout(0);
  KBid := LOWORD(KK);
  If KBid <> USKeyboard Then
    ActivateKeyboardLayout(HKL_NEXT, 0);
end;

procedure Taddneword.LabeledEdit1Change(Sender: TObject);
begin
    label4.Caption:=inttostr(255- LabeledEdit1.GetTextLen);
end;


procedure Taddneword.LabeledEdit1Enter(Sender: TObject);
{Var
KK : HKL;
  KBid : Integer; }
Const
  USKeyboard = 1033;
  RusKeyboard = 1049;
begin
  {KK := GetKeyboardLayout(0);
  KBid := LOWORD(KK);
  If KBid = USKeyboard Then
    ActivateKeyboardLayout(HKL_NEXT, 0);   }
    LoadKeyboardLayout('00000419',KLF_ACTIVATE)
end;

end.
