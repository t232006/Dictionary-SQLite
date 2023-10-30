program dictionary;

uses
  Forms,
  lessons in 'lessons.pas',
  lesson4 in 'lesson4.pas',
  thread2 in 'thread2.pas',
  PoBukvam in 'PoBukvam.pas',
  saver in 'saver.pas',
  Vcl.Themes,
  Vcl.Styles,
  ToExcelUnit in 'ToExcelUnit.pas',
  regInstaller in 'regInstaller.pas',
  addnewword in 'forms\addnewword.pas' {addneword},
  dateform in 'forms\dateform.pas' {dateformm},
  dialogtopic in 'forms\dialogtopic.pas' {topicform},
  helpdict in 'forms\helpdict.pas' {Manual},
  basemanipulation in 'database\basemanipulation.pas',
  database in 'database\database.pas' {DataModule2: TDataModule},
  deepSearch in 'database\deepSearch.pas',
  cards in 'frames\cards.pas',
  coloredRowFrame in 'frames\coloredRowFrame.pas' {ColoredRow: TFrame},
  frame in 'frames\frame.pas' {Frame2: TFrame},
  RowColorsUnit in 'frames\RowColorsUnit.pas' {RowColors},
  squares in 'frames\squares.pas' {Frame3: TFrame},
  UpDownHor in 'frames\UpDownHor.pas' {Frame4: TFrame},
  MainForm in 'MainForm.pas' {Form1},
  RemindCard in 'frames\RemindCard.pas' {Card};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Individual dictionary';

  Application.CreateForm(TDataModule2, DM2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Taddneword, addneword);
  Application.CreateForm(Tdateformm, dateformm);
  Application.CreateForm(Ttopicform, topicform);
  Application.CreateForm(TManual, Manual);
  Application.CreateForm(TRowColors, RowColors);
  Application.Run;

  end.
