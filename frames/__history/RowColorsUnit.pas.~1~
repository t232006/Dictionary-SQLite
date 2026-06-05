unit RowColorsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, coloredRowFrame;

type
  TRowColors = class(TForm)
    CheckBox1: TCheckBox;
    ColoredRow1: TColoredRow;
    ColoredRow2: TColoredRow;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ColoredRow1Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    RowColor1 : TColor;
    RowColor2 : TColor;
  end;

var
  RowColors: TRowColors;

implementation
uses MainForm;

{$R *.dfm}

procedure TRowColors.CheckBox1Click(Sender: TObject);
begin
  if not(CheckBox1.Checked) then
  begin
    ColoredRow2.Panel1.Color:=ColoredRow1.Panel1.Color;
    ColoredRow2.panel1.Enabled:=false;
  end
  else
   ColoredRow2.panel1.Enabled:=true;
end;

procedure TRowColors.ColoredRow1Panel1Click(Sender: TObject);
begin
  ColoredRow1.Panel1Click(Sender);
  coloredrow2.panel1.color:=coloredrow1.Panel1.Color;
end;

procedure TRowColors.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  RowColor1:=ColoredRow1.Panel1.Color;
  RowColor2:=ColoredRow2.Panel1.Color;
end;

procedure TRowColors.FormShow(Sender: TObject);
begin
    ColoredRow1.Panel1.Color:=form1.TableGreedRow.RowBrushColor1;
    ColoredRow2.Panel1.Color:=form1.TableGreedRow.RowBrushColor2;
end;

end.
