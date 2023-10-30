program dictionary;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  lessons in 'lessons.pas',
  lesson4 in 'lesson4.pas',
  database in 'database.pas' {DataModule2: TDataModule},
  addnewword in 'addnewword.pas' {addneword},
  dialogtopic in 'dialogtopic.pas' {topicform},
  frame in 'frame.pas' {Frame2: TFrame},
  helpdict in 'helpdict.pas' {Manual},
  thread2 in 'thread2.pas',
  PoBukvam in 'PoBukvam.pas',
  basemanipulation in 'basemanipulation.pas',
  RowColorsUnit in 'RowColorsUnit.pas' {RowColors},
  coloredRowFrame in 'coloredRowFrame.pas' {ColoredRow: TFrame},
  saver in 'saver.pas',
  Vcl.Themes,
  Vcl.Styles,
  ToExcelUnit in 'ToExcelUnit.pas',
  squares in 'squares.pas' {Frame3: TFrame},
  UpDownHor in 'UpDownHor.pas' {Frame4: TFrame},
  dateform in 'dateform.pas' {dateformm},
  deepSearch in 'deepSearch.pas',
  cards in 'cards.pas',
  RemindCard in 'RemindCard.pas' {Card},
  regInstaller in 'regInstaller.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Individual dictionary';
  Application.CreateForm(TDataModule2, DM2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Taddneword, addneword);
  Application.CreateForm(Ttopicform, topicform);
  Application.CreateForm(TManual, Manual);
  Application.CreateForm(TRowColors, RowColors);
  Application.CreateForm(Tdateformm, dateformm);
  Application.CreateForm(TCard, Card);
  Application.Run;

  end.
