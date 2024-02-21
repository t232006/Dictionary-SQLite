unit Logo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, lesson4, lessons, PoBukvam, cardsUnit;

const MSG_PROGRESS = WM_USER+100;
type
  TLogoForm = class(TForm)
    pgb: TProgressBar;
    Image1: TImage;
  private
    procedure onMyMessage(var msg: TMessage); message MSG_PROGRESS;
  public

  end;



implementation

{$R *.dfm}

procedure TLogoForm.onMyMessage(var msg: TMessage);
begin
  pgb.Position:=pgb.Position+msg.LParam;
  if pgb.Position>=100 then close;

end;

end.
