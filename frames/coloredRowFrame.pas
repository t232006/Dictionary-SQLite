unit coloredRowFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TColoredRow = class(TFrame)
    Panel1: TPanel;
    ColorDialog1: TColorDialog;
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TColoredRow.Panel1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    panel1.Color:=ColorDialog1.Color;
end;

end.
