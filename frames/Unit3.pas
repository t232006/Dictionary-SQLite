unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrame3 = class(TFrame)
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    const fmax:byte=30;
    const fmin:byte=1;
  public

  end;

implementation

{$R *.dfm}

procedure TFrame3.Image1Click(Sender: TObject);
var cur:variant;
begin
  cur:=edit1.Text;
  if cur>fmin then dec(cur);
  edit1.Text:=cur;

end;

procedure TFrame3.Image2Click(Sender: TObject);
var cur:variant;
begin
  cur:=edit1.Text;
  if cur<fmax then inc(cur);
  edit1.Text:=cur;
end;

end.
