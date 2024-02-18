program dictionary;

uses
  Forms,
  thread2 in 'Utils\thread2.pas',
  Vcl.Themes,
  Vcl.Styles,
  addnewword in 'forms\addnewword.pas' {addneword},
  dateform in 'forms\dateform.pas' {dateformm},
  dialogtopic in 'forms\dialogtopic.pas' {topicform},
  helpdict in 'forms\helpdict.pas' {Manual},
  basemanipulation in 'database\basemanipulation.pas',
  database in 'database\database.pas' {DataModule2: TDataModule},
  deepSearch in 'database\deepSearch.pas',
  coloredRowFrame in 'frames\coloredRowFrame.pas' {ColoredRow: TFrame},
  frame in 'frames\frame.pas' {Frame2: TFrame},
  RowColorsUnit in 'frames\RowColorsUnit.pas' {RowColors},
  squares in 'frames\squares.pas' {Frame3: TFrame},
  UpDownHor in 'frames\UpDownHor.pas' {Frame4: TFrame},
  MainForm in 'MainForm.pas' {Form1},
  RemindCard in 'frames\RemindCard.pas' {Card},
  regInstaller in 'InstallerDB\regInstaller.pas',
  lesson4 in 'exercises\lesson4.pas',
  lessons in 'exercises\lessons.pas',
  PoBukvam in 'exercises\PoBukvam.pas',
  saver in 'saver\saver.pas',
  cardsUnit in 'frames\cardsUnit.pas',
  Logo in 'forms\Logo.pas' {LogoForm},
  CloudSaveThread in 'utils\CloudSaveThread.pas',
  Utilite in 'Utils\Utilite.pas',
  ToExcelUnit in 'Utils\ToExcelUnit.pas';

{$R *.res}
 var
  LogoForm: TLogoForm;
begin
   Application.Initialize;

  TStyleManager.TrySetStyle('Luna');
  Application.Title := 'Individual dictionary';
  Application.CreateForm(TDataModule2, DM2);

  Logoform :=TLogoForm.Create(Application);
  Logoform.show;

  Application.CreateForm(TForm1, Form1);
  while LogoForm.Pgb.Tag<>1 do Application.ProcessMessages;
   //LogoForm.Free;
  //Application.CreateForm(TLogoForm, LogoForm);
  Application.CreateForm(Taddneword, addneword);
  Application.CreateForm(Tdateformm, dateformm);
  Application.CreateForm(Ttopicform, topicform);
  Application.CreateForm(TManual, Manual);
  Application.CreateForm(TRowColors, RowColors);
  Application.Run;

  end.
