unit Logo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, lesson4, lessons, PoBukvam, cardsUnit, MainForm;

const MSG_PROGRESS = WM_USER+100;
type
  TLogoForm = class(TForm)
    pgb: TProgressBar;
    Image1: TImage;
    procedure FormPaint(Sender: TObject);
  private
    procedure onMyMessage(var msg: TMessage); message MSG_PROGRESS;
  public

  end;



implementation

{$R *.dfm}


procedure TLogoForm.FormPaint(Sender: TObject);
var arect:TRect;  BmpImage: TBitMap;
begin
    {BmpImage:=TBitMap.Create;
    BmpImage.LOADFROMFILE('Dictionary.bmp');
    aRect:=Rect(0,0,275,256);
    Canvas.stretchDraw(aRect,BmpImage);
    BmpImage.Destroy;  }
end;

procedure TLogoForm.onMyMessage(var msg: TMessage);
begin
  pgb.Position:=pgb.Position+msg.LParam;
  if pgb.Position>=100 then pgb.Tag:=1;

end;

end.
