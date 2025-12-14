unit RemindCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, UpDownHor,
  Vcl.ExtCtrls, database;

type
  TCard = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Frame41: TFrame4;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Frame41Edit1Change(Sender: TObject);
  private

  public
    constructor Create(fontUp, fontDo: TFont; cardCol:TColor; AOwner: TComponent);
  end;

{var
  Card: TCard; }

implementation
 //uses unit1;
{$R *.dfm}

//constructor TCard.Create(upperword, bottomword:string; fontUp, fontDo: TFont; cardCol:TColor; time:byte; AOwner: TComponent);
constructor TCard.Create(fontUp: TFont; fontDo: TFont; cardCol: TColor; AOwner: TComponent);
begin
    inherited Create(AOwner);
    panel1.Caption:=DM2.Dict.Fields[1].AsString;
    panel1.Font:=fontUp;
    panel2.Caption:=DM2.Dict.Fields[2].AsString;
    panel2.Font:=fontDo;
    color:=cardCol;
end;

procedure TCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  timer1.Enabled:=true;
end;

procedure TCard.FormShow(Sender: TObject);
begin
  timer1.Enabled:=false;
end;

procedure TCard.Frame41Edit1Change(Sender: TObject);
var k:integer;
begin
  k:=integer.Parse(Frame41.Edit1.Text);
  try
  timer1.Interval:=k * 60000;
  finally

  end;

end;

procedure TCard.Timer1Timer(Sender: TObject);
begin
    SetForegroundWindow(Handle);
    SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE+SWP_NOSIZE);
      showmodal;

end;

end.
