unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, ComCtrls, DB, StdCtrls, DBGrids,
  ExtCtrls, lessons, PoBukvam, lesson4, database, DBCtrls, addnewword, dateform,
  Buttons, frame, helpdict, Mask, ActnList, ActnMan, ActnColorMaps, ImgList,
  OleCtrls, SHDocVw, Gauges, DdeMan, Menus, System.Actions,
  basemanipulation, cardsUnit, RowColorsUnit, saver, deepSearch, ToExcelUnit,
  squares, Vcl.PlatformDefaultStyleActnCtrls, UpDownHor, remindcard, reginstaller,
  registry, CloudSaveThread, thread2;

type
  TForm1 = class(TForm)
    ColorDialog1: TColorDialog;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    StBar: TStatusBar;
    Action4: TAction;
    FontDialog1: TFontDialog;
    Action5: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grid: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    SelOper: TComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    rg2: TRadioGroup;
    TabSheet4: TTabSheet;
    protv: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    CheckBox2: TCheckBox;
    TabSheet5: TTabSheet;
    m1: TMemo;
    m2: TMemo;
    m3: TMemo;
    m4: TMemo;
    m5: TMemo;
    m6: TMemo;
    m7: TMemo;
    m8: TMemo;
    m9: TMemo;
    m10: TMemo;
    M11: TMemo;
    M12: TMemo;
    TabSheet6: TTabSheet;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Frame21: TFrame2;
    Frame22: TFrame2;
    Frame23: TFrame2;
    Frame24: TFrame2;
    Frame25: TFrame2;
    Frame26: TFrame2;
    Frame27: TFrame2;
    Frame28: TFrame2;
    Frame29: TFrame2;
    Button4: TButton;
    Frame210: TFrame2;
    Frame211: TFrame2;
    Frame212: TFrame2;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    DBGrid2: TDBGrid;
    od1: TOpenDialog;
    DBGrid3: TDBGrid;
    Label8: TLabel;
    spb5: TSpeedButton;
    Label9: TLabel;
    SpeedButton9: TSpeedButton;
    Action6: TAction;
    spb4: TSpeedButton;
    DBNavigator2: TDBNavigator;
    selectall: TAction;
    fromleft: TAction;
    DBNavigator3: TDBNavigator;
    Gauge2: TGauge;
    BitBtn1: TBitBtn;
    rg3: TRadioGroup;
    nil_menu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    sg: TStringGrid;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    pb: TPaintBox;
    left1: TLabel;
    left2: TLabel;
    left3: TLabel;
    left4: TLabel;
    left5: TLabel;
    left6: TLabel;
    right1: TLabel;
    right2: TLabel;
    right3: TLabel;
    right4: TLabel;
    right5: TLabel;
    right6: TLabel;
    nexttack: TAction;
    StaticText3: TStaticText;
    Memo2: TMemo;
    Button2: TSpeedButton;
    TabSheet9: TTabSheet;
    ProgressBar: TProgressBar;
    YesB: TBitBtn;
    NoB: TBitBtn;
    Memo4: TMemo;
    Memo3: TMemo;
    Label5: TLabel;
    Label29: TLabel;
    TB: TBitBtn;
    st3: TLabel;
    progress_Menu: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    Dpot: TProgressBar;
    GridPanel1: TGridPanel;
    ShTableFontColor: TShape;
    Frame31: TFrame3;
    ChScaleColor: TShape;
    ChShowNumber: TCheckBox;
    ChShowScale: TCheckBox;
    ShCardColor: TShape;
    LaUpperCard: TPanel;
    LaBottomCard: TPanel;
    Frame42: TFrame4;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Timer1: TTimer;
    N11: TMenuItem;
    N13: TMenuItem;
    Label23: TLabel;
    st2: TLabel;
    st1: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    rg1: TRadioGroup;
    Memo1: TMemo;
    canedit: TSpeedButton;
    cardActivate: TCheckBox;
    DBText1: TDBText;
    deepbut: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    Label7: TLabel;
    lb: TLabel;
    rg: TRadioGroup;
    search: TLabeledEdit;
    selspot: TCheckBox;
    SpBut8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label17: TLabel;
    Label26: TLabel;
    baseFolder: TLabel;
    LFromClBut: TSpeedButton;
    UToClBut: TSpeedButton;
    ChShowScore: TCheckBox;
    Panel2: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    SaveDlg: TSaveDialog;
    cloudProgr: TProgressBar;
    cloudTimer: TTimer;
    CloudProcBut: TBitBtn;
    procedure rg1Click(Sender: TObject);
    procedure rg2Click(Sender: TObject);
    procedure InitSlovoPer;
    procedure InitPerevodSlo;
    procedure PageControl1Change(Sender: TObject);
    procedure m1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure m7DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure m7DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure m1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelOperCloseUp(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure caneditClick(Sender: TObject);
    procedure stringselect(po:boolean);
    procedure InitPobukvam;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Frame21BitBtn1Click(Sender: TObject);
    procedure rgClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure selspotClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SelOperDropDown(Sender: TObject);
    procedure ChangeColrigth(p:boolean);
    procedure Action4Execute(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Frame21BitBtn2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure Butt7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure spb4Click(Sender: TObject);
    procedure spb6Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
procedure sgMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure rg3Click(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect2: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure nexttackExecute(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure YesBClick(Sender: TObject);
    procedure NoBClick(Sender: TObject);
    procedure TB1Click(Sender: TObject);
    procedure SmallTimerTimer(Sender: TObject);
    procedure sgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure SpBut8Click(Sender: TObject);
    procedure deepbutClick(Sender: TObject);
    procedure TableFontColorExecute(Sender: TObject);
    procedure ShowNumberExecute(Sender: TObject);
    procedure ShTableFontColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Frame31Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChScaleColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N5Click(Sender: TObject);
    procedure ChShowNumberClick(Sender: TObject);
    procedure ChShowScaleClick(Sender: TObject);
    procedure ShCardColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Frame42Edit1Change(Sender: TObject);
    procedure cardActivateClick(Sender: TObject);
    procedure Fill4Status;
    procedure N11Click(Sender: TObject);
    //procedure GridPanel1Click(Sender: TObject);
    procedure baseFolderClick(Sender: TObject);
    procedure LFromClButClick(Sender: TObject);
    procedure UToClButClick(Sender: TObject);
    procedure ChShowScoreClick(Sender: TObject);
    procedure searchChange(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PagesBlock(block:boolean);
    procedure cloudTimerTimer(Sender: TObject);
    procedure CloudProcButClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    
  private
    { Private declarations }
    procedure YesNoContinue(b:boolean);
    procedure Keynottab (var msg:TCMDialogKey); message CM_DialogKey;
    function memonumber (name:string):byte;
    procedure Ins;
    procedure FrameGeneralization(Sender: TObject; bool:boolean);
    procedure DragDrop(sender, source: TObject; mm7: boolean);
    procedure N13active;
    procedure StartTimer;
  public
    color_scale:TColor;
    TableGreedRow:record
      //drawTrueBack:boolean;
      RowBrushColor1:TColor;
      RowBrushColor2:Tcolor;
    end;
  end;
  //procedure InstallReg(filename:string); stdcall; External 'reginstaller.dll';

var
  Form1: TForm1;
  card:TCard;
  pravotv:byte;
  i:byte;   //ОСТОРОЖНО!
  s, filtr:string;
  koor:Tpoint;
  o:otv;
  posi:TPoint;
  f:textfile;
  kolright:word;
  synchtr:synchthread;
  CloudThread:TSaveThread;


  YesNo:TYesNo;
  poBukv:TPoBukvam;
  test:TTest;
  complience:TComplience;
  seAndCor:Tgrademanipulation;
  cards:Tcards;
  //recreate:boolean;
  //isOdd:boolean;

  conteiner:record
    leftnum:byte;
    rightnum:byte;
  end;

implementation

uses dialogtopic;

{$R *.dfm}
procedure TForm1.PagesBlock(block: boolean);
var i:byte;
begin
if block then
      for I := 1 to 6 do
        PageControl1.Pages[i].Enabled:=false
  else
      for I := 1 to 6 do
        PageControl1.Pages[i].Enabled:=true;
end;

function Tform1.memonumber (name:string):byte;
begin
  result:=strtoint(copy(name,2,2));
end;

procedure TForm1.Keynottab (var msg:TCMDialogKey);
//label lab;
var keypressed:char;
    activpos:shortint;
begin
  activpos:=0;
  if msg.Charcode<>VK_TAB then inherited;

  if (msg.CharCode=VK_TAB) and (getKeyState(VK_CONTROL)<0) and (getKeyState(VK_SHIFT)<0) then
  with pagecontrol1 do
  begin
    SelectNextpage(false);
    Pages[ActivePageIndex].SetFocus;
    //pagecontrol1.Focused
    //goto lab;
  end else
  if (msg.CharCode=VK_TAB) and (GetKeyState(VK_CONTROL)<0) then
  with pagecontrol1 do
  begin
    SelectNextPage(true);
    Pages[ActivePageIndex].SetFocus;
  end else
  if (msg.CharCode=VK_TAB) then
      if PageControl1.ActivePageIndex=0 then
      Grid.SetFocus;
//------------------------------------------------------
  if PageControl1.ActivePageIndex=4 then
  begin
    if msg.CharCode=VK_LEFT then
    for I := 1 to 6 do
      begin
        (FindComponent('left'+inttostr(i))as Tlabel).visible:=true;
        (FindComponent('right'+inttostr(i))as Tlabel).visible:=false;
      end;
    if msg.CharCode=VK_RIGHT then
    for I := 1 to 6 do
      begin
        (FindComponent('left'+inttostr(i))as Tlabel).visible:=false;
        (FindComponent('right'+inttostr(i))as Tlabel).visible:=true;
      end;
    if msg.CharCode=VK_DOWN then
      begin
        inc(activpos);
        KeyPressed:=chr((activpos mod 6)+ 49);
        KeyPress(KeyPressed);
        KeyPressed:=chr(VK_TAB);
        KeyPress(KeyPressed);
      end;
    if msg.CharCode=VK_UP then
      begin
        dec(activpos);
        KeyPressed:=chr((activpos mod 6)+ 49);
        KeyPress(KeyPressed);
        KeyPressed:=chr(VK_TAB);
        KeyPress(KeyPressed);
      end;
  end;
end;

procedure TForm1.LFromClButClick(Sender: TObject);
//var Cloud: Tcloud;
begin
    {Cloud:=Tcloud.Create();
    if MessageDlg('Текущий словарь будет заменен.',TMsgDlgType.mtConfirmation,mbYesNoCancel,0)=mrNo then
    begin
      if SaveDlg.Execute then Cloud.loadFromCloud(SaveDlg.FileName);
    end else
    begin
      dm2.FDConnection.Connected:=false;
      Cloud.loadFromCloud(basefolder.Caption);
    end;


    Cloud.Free;    }
end;

procedure TForm1.baseFolderClick(Sender: TObject);
begin
    if od1.Execute then
    begin
      DM2.loadDB(od1.FileName);
      Saver.startExercises;
      (sender as TLabel).Caption:=od1.FileName;
    end;
end;

procedure Tform1.ChangeColrigth(p:boolean);
begin
    if p then
         inc(kolright)
    else
        kolright:=0;
    case kolright mod 10 of
    1:    StBar.Panels[3].Text:='безошибочная серия '+inttostr(kolright)+' слово';
    2..4: StBar.Panels[3].Text:='безошибочная серия '+inttostr(kolright)+' слова';
    else StBar.Panels[3].Text:='безошибочная серия '+inttostr(kolright)+' слов';
    end;
    //seAndCor.calcProgress;
    Fill4Status;
end;

procedure Tform1.stringselect(po:boolean);
begin
if po then
  begin
    Grid.Options:=Grid.Options-[dgRowSelect];
    Grid.Options:=Grid.Options+[dgEditing];
  end
else
  begin
    Grid.Options:=Grid.Options+[dgRowSelect];
    Grid.Options:=Grid.Options-[dgEditing];
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    progressbar.StepIt;
    if progressbar.Position=ProgressBar.Max then
     begin
        timer1.Enabled:=false;
        TB.Enabled:=true;
        YesB.Enabled:=false;
        NoB.Enabled:=false;
     end;
end;

procedure TForm1.StartTimer;
begin
  dm2.FDConnection.Connected:=false;
  cloudProgr.Visible:=true;
    cloudprogr.Position:=0;
    cloudTimer.Enabled:=true;
    cloudProcBut.Visible:=true;
end;

procedure TForm1.UToClButClick(Sender: TObject);
begin
    startTimer;
    CloudThread:=TSaveThread.Create(true);
    CloudThread.DBDir:=baseFolder.Caption;
    CloudThread.Priority:=tpHighest;
    CloudThread.FreeOnTerminate:=true;
    CloudThread.Start;

end;

procedure Tform1.InitSlovoPer;
//var k:byte;
begin

  test.slovoper(o,pravotv);
  st1.Caption:=o[0].slovo;
  Rg1.ItemIndex:=-1;
  for i:=0 to 5 do
  begin
    rg1.Items[i]:=o[i+1].perevod;
  end;
end;// end;

procedure Tform1.InitPerevodSlo;
begin

  test.PerevodSlo(o,pravotv);
  st2.Caption:=o[0].perevod;
  Rg2.ItemIndex:=-1;
    for i:=0 to 5 do
    begin
     // rg2.Buttons[i].WordWrap:=true;
      Rg2.Items[i]:=o[i+1].slovo;
    end;
end; //end;

procedure TForm1.InitPobukvam;
var ii, jj: integer;
begin

  for ii := 0 to 4 do
  for jj := 0 to 4 do
    sg.Cells[ii,jj] :=poBukv.table[ii,jj];
  if not(CheckBox2.Checked) then st3.Caption:=poBukv.sl;//писать, если не стоит галочка
  //if poBukv.phrase then sg.Tag:=1 else sg.Tag:=0;
end;

procedure TForm1.rg1Click(Sender: TObject);
begin
  if pravotv-1=Rg1.ItemIndex then
  begin
    try
      Memo1.Font.Color:=clgreen;
      Memo1.Clear;
      With Memo1.Lines do
      begin
        Add('правильно:');
        Add(st1.Caption);
        Add('  →  ');
        Add(rg1.Items[rg1.ItemIndex]);
      end;
    except

    end;
    SeAndCor.searchandcor(true,'word',o[0].slovo);
    ChangeColrigth(true); //пишет в статусе
    InitSlovoPer;
  end else
  begin
    Memo1.Clear;
    Memo1.font.Color:=clred;
    With Memo1.Lines do
    begin
      Add('неправильно:');
      Add(rg1.Items[rg1.ItemIndex]);
      Add(' → ');
      Add(o[rg1.ItemIndex+1].slovo);
    end;
    //l1.Caption:='неправильно';
    SeAndCor.searchandcor(false,'word',o[0].slovo);
    ChangeColrigth(false); //пишет в статусе
  end;
  //rg1.ItemIndex:=-1;

end;
 //region bookmark PageControl
procedure TForm1.PageControl1Change(Sender: TObject);
var t,t1:byte; //parentcontrol:TWinControl;

begin

  case  PageControl1.ActivePageIndex of
  1:
  begin
      if Test.recreate then
      begin
        test.Free;
        test:=TTest.create(6);
      end;
      InitSlovoPer;
  end;
  2:
  begin
  if Test.recreate then
      begin
        test.Free;
        test:=TTest.create(6);
      end;
        InitPerevodSlo;

  end;
  3:
  begin
  if Test.recreate then
      begin
        poBukv.Free;
        poBukv:=TPoBukvam.create;
      end;
      InitPobukvam;
  end;
  4:
  begin
  if Test.recreate then
      begin
        complience.Free;
        complience:= Tcomplience.Create(6);
      end;
      complience.Init;
    for t:=1 to 6 do
    begin
        TMemo(FindComponent('m'+IntToStr(t))).lines.text:=complience.o1[t].slovo;
        TMemo(FindComponent('m'+IntToStr(t+6))).lines.text:=complience.o2[t].perevod;
    end;
    for t:=1 to 12 do
        begin
        TMemo(FindComponent('m'+IntToStr(t))).font.style:=TMemo(FindComponent('m'+IntToStr(t))).font.style-[fsstrikeout];
        TMemo(FindComponent('m'+IntToStr(t))).Color:=clWindow;
        end;
  end;
  5:
  begin
  if Test.recreate then
      begin
       yesNo.Free;
       YesNo:=TYesNo.Create(1);
      end;
        yesNo.Init;
  end;
  6:
  begin
    if DM2.selectsel.RecordCount<12 then
    begin
      t1:=9;
      Frame210.Visible:=false;
            Frame211.Visible:=false;
                  Frame212.Visible:=false;
    end
       else
    begin
       t1:=12;//12 карточек или 9
       Frame210.Visible:=true;
            Frame211.Visible:=true;
                  Frame212.Visible:=true;
    end;
      cards.Free;
      cards:=Tcards.create(t1);
      cards.Init(t1);
    for t:=1 to t1 do
    begin
        if rg3.ItemIndex=0 then
        begin
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.lines.text:=cards.o1[t].perevod;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.hide;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel1.lines.text:=cards.o1[t].slovo;

        end else
        begin
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.lines.text:=cards.o1[t].slovo;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.hide;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel1.lines.text:=cards.o1[t].perevod;
        end;


        TFrame(FindComponent('frame2'+inttostr(t))).FindChildControl('bitbtn1').Enabled:=true;
    end;
  end;
  7:
  begin
    //WebBrowser1.Navigate(ExtractFileDir(Application.ExeName)+'\словарь.htm');
  end;
  
  end;
end;

procedure TForm1.rg2Click(Sender: TObject);
  begin
  if pravotv-1=Rg2.ItemIndex then
  begin
    try
      Memo2.Font.Color:=clgreen;
      Memo2.Clear;
      With Memo2.Lines do
      begin
        Add('правильно:');
        Add(st2.Caption);
        Add('  →  ');
        Add(rg2.Items[rg2.ItemIndex]);
      end;
    except

    end;
    SeAndCor.searchandcor(true,'translation',o[0].perevod);
    ChangeColrigth(true); //пишет в статусе
    InitPerevodSlo;
  end else
  begin
    Memo2.Clear;
    Memo2.font.Color:=clred;
    With Memo2.Lines do
    begin
      Add('неправильно:');
      Add(rg2.Items[rg2.ItemIndex]);
      Add(' → ');
      Add(o[rg2.ItemIndex+1].perevod);
    end;
    //l1.Caption:='неправильно';
    SeAndCor.searchandcor(false,'translation',o[0].perevod);
    ChangeColrigth(false); //пишет в статусе
  end;
  //rg2.ItemIndex:=-1;
end;

procedure TForm1.m1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var ch:char; na:byte;
begin
   if not (fsstrikeout in (sender as Tmemo).Font.Style) then
  begin
    (sender as Tmemo).BeginDrag(false,15); //перенос после 15 пик
    na:=memonumber(Tmemo(sender).Name);

    if na>6 then
      begin
      if left1.Visible then //2nd colunm and 1st selection
        begin
          ch:=chr(9);
          formkeypress(sender,ch);
        end;
      na:=memonumber(Tmemo(sender).Name)-6;
      end else
      if not(left1.Visible) then //1st colunt and 2nd selection
        begin
          ch:=chr(9);
          formkeypress(sender,ch);
          na:=memonumber(Tmemo(sender).Name);
        end;
    ch:=inttostr(na)[1];
    formkeypress(sender,ch);

  end;
end;

procedure TForm1.m7DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     (sender as Tmemo).BeginDrag(true,-1);
end;

//-------------------------------------------------------
procedure TForm1.DragDrop(sender, source: TObject; mm7: boolean);
var komp:byte;
    usword, soword, seword:string;
begin
  komp:=strtoint(copy((sender as tmemo).Name,2,2));
  usword := complience.outword(komp, mm7);
  seword:=(sender as tmemo).Lines.Text;
  soword:=(source as tmemo).Lines.Text;
  if source<>sender then //чтобы не закидывать в себя
  if (soword=usword) then
  begin
    (sender as tmemo).Lines.Text:=usword+ ' = ' + seword;
    (source as tmemo).Lines.Text:='';
    (sender as tmemo).Color:=clMoneyGreen;
    if mm7 then
      SeAndCor.searchandcor(true,'translation',seword) //если правильно,добавить балл
    else
      SeAndCor.searchandcor(true,'word',seword); //если правильно,добавить балл
    ChangeColrigth(true);
  end else
  begin
    (sender as tmemo).Lines.Text:=seword+' = '+soword;
    (source as tmemo).Lines.Text:='';
    (sender as tmemo).Font.Style:=(source as tmemo).Font.Style+[fsstrikeout];
    (sender as tmemo).Color:=8421631;
    //determ; determ; //нужно вычесть 2 очка всем
    if mm7 then
    begin
      SeAndCor.searchandcor(false,'word',soword); //если неправильно,вычесть балл
      SeAndCor.searchandcor(false,'translation',seword);  //и у того, и у другого
    end
    else
    begin
      SeAndCor.searchandcor(false,'translation',soword); //если неправильно,вычесть балл
      SeAndCor.searchandcor(false,'word',seword);   //и у того, и у другого
    end;
    ChangeColrigth(false);
  end;
    pb.Canvas.FillRect(pb.Canvas.ClipRect);
End;

procedure TForm1.m7DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
    DragDrop(sender, source, true);
end;

//-----------------------------------------------------------

procedure TForm1.m1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
   DragDrop(sender, source, false);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   WindowState:=wsMinimized;
  //end;
  addneword.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
with DM2 do
begin
Dict.Close;
top.Close;
//topicquery.SQL.Clear;
end;
Saver.saveForm;
finishexercises;
end;

procedure TForm1.searchChange(Sender: TObject);

var s:string;
    letter:char;    // last letter
begin
  s := search.Text;
  if s <> '' then letter := s[length(s)];
  if ord(letter) = 43 then  //'+'
    begin
      delete(s,length(s),1);
      search.Text:=s;
    end else
  if ord(letter)<128 then
    DM2.Dict.Locate('Translation', s, [loPartialKey, loCaseInsensitive])
  else
    DM2.Dict.Locate('Word', s, [loPartialKey, loCaseInsensitive]);
end;

procedure TForm1.SelOperCloseUp(Sender: TObject);
begin
with DM2.topicquery do
begin
  if SQL.Count > 1
  then if selspot.Checked then SQL.Add('and')//для добавления сложных условий
  else SQL.Add('or');
  case SelOper.ItemIndex of
    0: SQL.Add('score<6');
    1: SQL.Add('score>0');
    2: dateformm.showmodal;
    3: topicform.showmodal;
    4: begin
        SQL.text:='update Dict set usersel=true where';
        DM2.dropch.Execute;
       end;
  end;

  case rg.ItemIndex of //apartly about phrases
    0: SQL.Add('and phrase = false');
    1: SQL.Add('and phrase = true');
  end;

  if SQL.Count > 1
                     then
  try
     DM2.Dict.Filter:='';
     DM2.dropch.Execute;
     ExecSQL;
  except
      sql.Delete(sql.Count-1);
      ExecSQL;
  end;
end;
//DM2.Dict.Refresh;
//DM2.Dict.active:=false; DM2.Dict.Active:=true;
baserefresh;
Action3Execute(sender);
DM2.Dict.Filter:=filtr;
Grid.SetFocus;
{if SelOper.ItemIndex <> 4 then selspot.Checked:=true else
selspot.Checked:=false;}
end;

procedure TForm1.GridCellClick(Column: TColumn);
begin
 if column.FieldName='Usersel' then
  begin
    CanEdit.Down:=false;
    edittable(true);
    with DM2.Dict do
    begin
      Edit;
      FieldByName('Usersel').AsBoolean:=not(FieldByName('Usersel').AsBoolean);
      Post;
    end;
    edittable(false);
   Action3Execute(column);
  end;
end;

procedure TForm1.caneditClick(Sender: TObject);
begin
  //stringselect(canedit.down);
  if canedit.Down then Grid.options := Grid.options +[dgediting] else
Grid.options := Grid.options -[dgediting];
  edittable(canedit.Down);
  Grid.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with poBukv do
  begin
    if per=trim(edit1.Text) then
      begin
        Label1.Caption:='правильно';
        SeAndCor.searchandcor(true,'word',sl);
        ChangeColrigth(true); //пишет в статусе
        //InitPobukvam;
        test.recreate:=true;
        PageControl1Change(sender);
        test.recreate:=false;
        Edit1.Text:='';
      end else
      begin
        Label1.Caption:='неправильно';
        SeAndCor.searchandcor(false,'word',sl);
        SeAndCor.searchandcor(false,'word',sl); //вычесть 2 балла
        edit1.Text:=per; //написать правильный ответ
        ChangeColrigth(false); //пишет в статусе
      end;
  end;
    edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  test.recreate:=true;
  PageControl1Change(sender);
  test.recreate:=false;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=13 then Button1Click(sender);
end;

procedure TForm1.Edit1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  ins;
end;

procedure TForm1.sgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sg.MouseToCell(x,y,posi.x,posi.y);
  s:=trim(sg.Cells[posi.x,posi.y]);
  koor.X:=X; koor.Y:=Y;
end;

procedure TForm1.sgMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  Edit1.SetFocus;
  Edit1.SelStart:=length(Edit1.Text);
  if (x=koor.X) and (y=koor.Y) then
   ins;
end;

procedure TForm1.Ins;
var ss:string;
begin
    ss:=edit1.Text;
    if poBukv.phrase then  //word or phrase
      insert(s+' ',ss,edit1.SelStart+1) //phrase
    else
      insert(s,ss,edit1.SelStart+1);
    edit1.Text:=ss;
    sg.Cells[posi.X,posi.Y]:='';
end;

procedure TForm1.sgMouseMove(Sender: TObject; Shift: TShiftState; X: Integer; Y: Integer);
begin
  if (ssleft in shift ) then sg.BeginDrag(false, 3);
end;

procedure TForm1.SmallTimerTimer(Sender: TObject);
begin
  ProgressBar.StepIt;
  //StBar.Parent:=ProgressBar1;
end;

procedure TForm1.Edit1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
    accept:=true;
    Edit1.SetFocus;
    Edit1.SelStart:=X div 7;
end;

procedure TForm1.FrameGeneralization(Sender:TObject; bool:boolean);
var name:string;
    digit:byte;
begin
  name:=(sender as TBitBtn).Parent.Name;
  digit:=strtoint(copy(name,7,2)) ;
  SeAndCor.searchandcor(bool,'word',cards.o1[digit].slovo);
  (FindComponent(name) as TFrame2).panel2.Visible:=true;
  (FindComponent(name) as TFrame2).BitBtn1.Enabled:=bool;
  ChangeColrigth(bool);
end;

procedure TForm1.Frame21BitBtn1Click(Sender: TObject);
begin
  FrameGeneralization(sender, true);
end;

procedure TForm1.Frame21BitBtn2Click(Sender: TObject);
begin
  FrameGeneralization(sender, false);
end;

procedure TForm1.Frame31Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SpeedButton5.Click;
end;

procedure TForm1.Frame42Edit1Change(Sender: TObject);
begin
  Grid.Font.Size:=strtoint(Frame42.Edit1.Text);
end;

procedure TForm1.rgClick(Sender: TObject);
  procedure delfilt(t:boolean);
   begin
    if t then system.Delete(filtr,pos('phrase=true',filtr),11 ) else
    system.Delete(filtr,pos('phrase=false',filtr),12 );
    system.Delete(filtr,pos('and',filtr),4);
   end;

begin
  with DM2.Dict do
  begin
    filtr:=Filter; //отдали полномочия
    //Filtered:=true;
    if rg.ItemIndex=0 then
    begin
        delfilt(true);
        if trim(filtr)<>''  then //если уже что-то есть
         filtr:=filtr+ ' and phrase=false' else
        filtr:='phrase=false'
    end else

    if rg.ItemIndex=1 then
    begin
        delfilt(false);
        if trim(filtr)<>'' then //если уже что-то есть
        filtr:=filtr+ ' and phrase=true' else
        filtr:='phrase=true'
    end else
    begin
      delfilt(true);
      delfilt(false);
    end;
    filter:=filtr; //забрали полномочия
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     form1.WindowState:=wsMaximized;
end;

procedure TForm1.selspotClick(Sender: TObject);
begin

  if selspot.Checked then
  begin
    DM2.Dict.Filter:='usersel=true';
    rgClick(sender);
    lb.Visible:=true;
    lb.Font.Color:=clblue;
    lb.Caption:='операция И';
    Image1.Visible:=true;
    Image2.Visible:=false;
  end else
  begin
    DM2.Dict.Filter:='';
    rgClick(sender);
    lb.Visible:=true;
    lb.Font.Color:=clMaroon;
    lb.Caption:='операция ИЛИ';
    Image2.Visible:=true;
    Image1.Visible:=false;

  end;
  DM2.Dict.Filter:=filtr;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Grid.Font.Size:=Grid.Font.Size+2;

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
if Grid.Font.Size>5 then Grid.Font.Size:=Grid.Font.Size-2;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  RowColors.ShowModal;
  TableGreedRow.RowBrushColor1:=RowColors.RowColor1;
  TableGreedRow.RowBrushColor2:=RowColors.RowColor2;
  Frame31.Shape1.brush.Color:=RowColors.RowColor1;
  Frame31.Shape2.brush.Color:=RowColors.RowColor2;
  Grid.Color:=RowColors.RowColor1;
end;

procedure TForm1.ChScaleColorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  n4.Click;
end;

procedure TForm1.ShCardColorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SpeedButton1.Click;
end;

procedure TForm1.ShowNumberExecute(Sender: TObject);
begin
  n6.Click;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if (canedit.Down) then canedit.Down:=false else canedit.Down:=true;
  caneditClick(sender);
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  with DM2.selectsel do
  begin
    Open;// ExecSQL;
    //Refresh;
    active:=false; active:=true; //don't know why, but works
    StBar.Panels[1].text:='Выделено слов: '+ inttostr(DM2.selectsel.RecordCount);
    seAndCor.calcprogress;
    Fill4Status;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
//var sf:string; fk:1..12;
begin

  //logoform.show;
  if loadForm=false then
  begin
    StBar.Panels[0].Text:='Ошибка в загрузке словаря';
    StBar.Tag:=1;   //error!!!
    exit;
  end;
  stBar.Tag:=0; //no error
  Dpot.Parent:=StBar;

  //startexercises;
  //-------------------------------
  //pb.canvas.Brush.color:=clwhite;
  Action3Execute(sender);
PageControl1Change(sender);
if (Screen.Width<form1.Width) or (Screen.Height<form1.Height)
then form1.BorderStyle:=bsSizeable;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
procedure rectt (col:Tcolor; var tecomp:Tmemo); //draws green bevel
begin
    with tecomp do
    begin
      pb.canvas.pen.color:=col;
      pb.canvas.Pen.Width:=9;
      pb.canvas.Rectangle(left,top,left+Width,top+height);
      tag:=col;
    end;
end;

procedure radiorect (order:byte; var tecomp:Tmemo);
var j:byte;
begin
  for j := order to order+5 do        {round(0.08*order)*6 to use 1,2,3}
  begin                           {for memo 4,5,6}
    if j-round(0.08*order)*6<>strtoint(key) then
    begin
      tecomp:=(FindComponent('m'+inttostr(j)) as tmemo);
      rectt(pb.color, tecomp);
    end;
  end;
end;
var mem:Tmemo; charr:char;
//==================================
begin
try
  begin
  case PageControl1.ActivePageIndex of
  0:
  begin
     if (ord(key)=32) and not(canedit.Down) and not(search.Focused) then
      selspot.Checked:=not(selspot.Checked);
     if ord(key)=43 then SpBut8.Click;

  end;

  1: rg1.ItemIndex:=strtoint(key)-1;
  2: rg2.ItemIndex:=strtoint(key)-1;
  4:
  begin  //==============================================
    case ord(key) of
      49..54:
      begin
        if left1.Visible then
          mem:=(FindComponent('m'+key) as tmemo) else
          mem:=(FindComponent('m'+inttostr(strtoint(key)+6)) as tmemo);
        if mem.Tag<>clmoneygreen then
        begin
          rectt(clmoneygreen,mem);
          with conteiner do
          begin
              if left1.visible then
              leftnum:=memonumber(mem.Name) else
              rightnum:=memonumber(mem.Name);
          end;
        end  else
        begin
          rectt(pb.color, mem);
          with conteiner do
          begin
            if left1.Visible then leftnum:=0 else rightnum:=0;
          end;
        end;
        if not(left1.Visible) then
        radiorect(7,mem) else
        radiorect(1,mem);
        charr:=chr(9);
        FormKeyPress(sender, charr);
      end;
      9:  //selects columns by bevel
      begin
        if not(left1.Visible) then
        begin
          for I := 1 to 6 do
            begin
            (FindComponent('left'+inttostr(i))as Tlabel).visible:=true;
            (FindComponent('right'+inttostr(i))as Tlabel).visible:=false;
            end ;
        end else
            for I := 1 to 6 do
            begin
            (FindComponent('left'+inttostr(i))as Tlabel).visible:=false;
            (FindComponent('right'+inttostr(i))as Tlabel).visible:=true;
            end;
      end;
      13:
      begin
          with conteiner do
          begin
            if left1.Visible then
                m7DragDrop(findcomponent('m'+inttostr(rightnum)),findcomponent('m'+inttostr(leftnum)),0,0)
          else  m1DragDrop(findcomponent('m'+inttostr(leftnum)),findcomponent('m'+inttostr(rightnum)),0,0);
          rightnum:=0; leftnum:=0;
          end;
      end;
  end;
  end;  //===============================================
  5:
  begin
    case ord(key) of
    49:if timer1.Enabled then YesB.OnClick(Sender);
    48:if timer1.Enabled then NoB.OnClick(Sender);
    13:TB.OnClick(Sender);
    end;
  end;
  end;
  end;
  except
end;
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 SelOper.itemindex:=-1;
end;

procedure TForm1.SelOperDropDown(Sender: TObject);
begin
SelOper.ItemIndex:=-1; //чтобы можно было закрыть без выбора
selspotClick(sender);
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
search.SetFocus;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
if ColorDialog1.Execute then
begin
  Grid.font.Color := ColorDialog1.Color;
  ShTableFontColor.brush.Color:=ColorDialog1.Color;
end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var fk:1..12;
begin
if ColorDialog1.Execute then
  begin
    for fk:=1 to 12 do
     (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel.Color:=ColorDialog1.Color; //.Panel2.Color:=ColorDialog1.Color;
    ShCardColor.Brush.Color:=ColorDialog1.Color;
  end;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var fk:1..12;
begin
 if FontDialog1.Execute then
   begin
   for fk:=1 to 12 do
     (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font:=FontDialog1.Font;
   LaUpperCard.Font:=FontDialog1.Font;
   end;


end;

procedure TForm1.deepbutClick(Sender: TObject);
begin
  with DM2.Dict do
  begin
    if (deepbut.Down) and (search.text<>'') then
    begin
      //DBNavigator1.Enabled:=false;
      deepSeek(search.Text);
      //DBNavigator1.Enabled:=true;
      Filter:='spot=true';
    end else
      if selspot.Checked then
        Filter:='usersel=true' else Filter:='';
  end;
end;

procedure TForm1.SpBut8Click(Sender: TObject);
var a:string;
begin
  a:=Grid.DataSource.DataSet.FieldByName('Number').AsString;
  Seeking(a);
  baserefresh;
end;

procedure TForm1.TB1Click(Sender: TObject);
begin
 timer1.Enabled:=true;
 TB.Enabled:=false;
 YesB.Enabled:=true;
 NoB.Enabled:=true;
 YesNo.Reset;
 StBar.Panels[2].Text:='серия '+inttostr(YesNo.serial);
 YesNo.Init;
 Memo3.Text:=YesNo.GetString;
 ProgressBar.Position:=0;

end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var fk:1..12;
begin
 if FontDialog1.Execute then
 begin
   for fk:=1 to 12 do
     (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font:=FontDialog1.Font;
   LaBottomCard.Font:=FontDialog1.Font;
 end;
end;

procedure TForm1.cardActivateClick(Sender: TObject);
begin
  if cardActivate.Checked then
  begin
    Card:=TCard.Create(Frame21.panel1.Font, Frame21.panel2.Font, Frame21.Panel.Color, nil);
    card.ShowModal;
  end
  else
    card.Destroy;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Dm2.FDConnection.Connected:=(Sender as Tcheckbox).Checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked then st3.Caption:='' else st3.Caption:=Pobukv.sl;
end;

procedure TForm1.ChShowNumberClick(Sender: TObject);
begin
     n6.Checked:=ChShowNumber.Checked;
     Grid.Repaint;
end;

procedure TForm1.ChShowScaleClick(Sender: TObject);
begin
    n5.Checked:=ChShowScale.Checked;
    Grid.Repaint;
end;

procedure TForm1.ChShowScoreClick(Sender: TObject);
begin
    n13.Checked:=ChShowScore.Checked;
    if n13.Checked then
    begin
       Label38.Caption:='Шкала оценки';
      Label31.Visible:=true;
      label33.Visible:=true;
      label34.Visible:=true;
      chscalecolor.Visible:=true;
      chshownumber.Visible:=true;
      chshowscale.Visible:=true;
      n13active;
    end else
    begin
      Label38.Caption:='Шкала релевантности';
      Label31.Visible:=false;
      label33.Visible:=false;
      label34.Visible:=false;
      chscalecolor.Visible:=false;
      chshownumber.Visible:=false;
      chshowscale.Visible:=false;
      n11.Click;
    end;
    Grid.Repaint;
end;

procedure TForm1.CloudProcButClick(Sender: TObject);
begin
  cloudProgr.Position:=cloudProgr.Max;
end;

procedure TForm1.cloudTimerTimer(Sender: TObject);
begin

  if cloudProgr.Position>=cloudProgr.Max then
  begin
    cloudTimer.Enabled:=false;
    cloudProgr.Visible:=false;
    CloudThread.Terminate;
    CloudProcBut.Visible:=false;
    with dm2 do
    begin
      FDConnection.Connected:=true;
      Dict.active:=true;
      Topic.Active:=true;
    end;
  end;
  cloudProgr.StepIt;

end;

procedure TForm1.Action5Execute(Sender: TObject);
begin
  if DM2.Dict.CanModify then
  DM2.Dict.Delete;
end;

procedure TForm1.ShTableFontColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SpeedButton4.Click;
end;

procedure TForm1.TableFontColorExecute(Sender: TObject);
begin
   SpeedButton4.Click;
end;

procedure TForm1.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=VK_TAB) then
     if (ssCtrl in Shift) then
      with pagecontrol1 do
        begin
          SelectNextpage(true);
          Pages[ActivePageIndex].SetFocus;
        end
     else
    DBMemo1.SetFocus;
end;

procedure TForm1.GridKeyPress(Sender: TObject; var Key: Char);
begin
with DM2.Dict do begin
if (key= #13) and (CanModify)
then
      if DM2.dsDict.State = dsedit then
      Post
      else Edit;
end;
end;

procedure TForm1.GridTitleClick(Column: TColumn);
begin
   with DM2.Dict do
  begin
    case column.Index of
      0:  if IndexName='WordInd' then IndexName:='WordIndD'
      else IndexName:='WordInd';
      1: if IndexName='TranslationInd' then IndexName:='TranslationIndD'
      else IndexName:='TranslationInd';
      2: if IndexName='DateRecInd' then IndexName:='DateRecD'
      else IndexName:='DateRecInd';
      3: begin
    //
          nil_menu.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
      end;
      4: if IndexName='topicind' then IndexName:='TopicIndD'
      else IndexName:='topicind';
      5: if IndexName='UserselInd' then IndexName:='UserselIndD'
      else IndexName:='UserselInd';

    end;
      First;
  end;
end;

procedure TForm1.Butt7Click(Sender: TObject);
  var //templist:Tstringlist;
      dirbase:string;
begin
    //DBGrid2.Refresh;
if od1.Execute then
  begin
    dirbase:=od1.FileName;  //открываем
      //Close;
      Dm2.synchConn.Params.Database:=dirbase;
    try
      dm2.synch.Open;
      StBar.panels[0].Text:='Найдено новых слов: '+inttostr(DM2.synch.RecordCount);
    finally
    end;
  end;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  synchtr:=synchthread.Create(true);
  synchtr.Priority:=tpHighest;
  synchtr.FreeOnTerminate:=true;
   DBGrid2.Tag:=0; //resume
  BitBtn1.Visible:=true;
  synchtr.Start;
end;

procedure TForm1.StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
  if Panel=StBar.Panels[4] then
  //with Dpot do
  begin
     Dpot.Top:=Rect.Top;
     Dpot.Left:=Rect.Left;
     Dpot.Width:=StBar.Panels[4].Width;
  end;
end;

procedure TForm1.spb4Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex=0 then
    if search.Focused then
      search.SelectAll;
    speedbutton9.Enabled:=true;

  if PageControl1.ActivePageIndex=8 then
    try
      with dbgrid2.DataSource.DataSet do
      begin
          first;
          while not EOF do
          begin
            DBGrid2.SelectedRows.CurrentRowSelected:=true;
            next;
          end;
      end;
     except ShowMessage('Выберите источник') end;
end;

procedure TForm1.spb6Click(Sender: TObject);
begin
    with dbgrid2.DataSource.DataSet do
begin
    first;
    while not EOF do
    begin
      DBGrid2.SelectedRows.CurrentRowSelected:=true;
      next;
    end;
end;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
   //logoform.Close;
   if PageControl1.ActivePageIndex=8 then
   begin
     try
     StBar.panels[0].Text:='Найдено новых слов: '+inttostr(DM2.synch.RecordCount);
     except end;
     StBar.panels[1].Text:='Выделено слов: '+inttostr(DBGrid2.SelectedRows.Count);
   end else
   begin
     StBar.Panels[1].text:='Выделено слов: '+ inttostr(DM2.selectsel.RecordCount);
     if stBar.Tag<>1 then Fill4Status;
   end;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
  toExcel;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   BitBtn1.Visible:=false;
   DBGrid2.Tag:=1; //suspend;
   synchtr.Terminate;
   BitBtn1.Visible:=false;
end;

procedure TForm1.YesNoContinue(b:boolean);
begin
    YesNo.GiveAnswer(b);
    StBar.Panels[2].Text:='серия '+inttostr(YesNo.serial);
    memo4.Font.Color:=YesNo.promptcolor;
    memo4.Text:=YesNo.prompt;
    if YesNo.prompt='вы неправы' then ProgressBar.Position:=0;

    YesNo.Init;
    Memo3.Text:=YesNo.GetString;
    ChangeColrigth(b);
end;

procedure TForm1.YesBClick(Sender: TObject);
begin
    YesNoContinue(true);
end;

procedure TForm1.NoBClick(Sender: TObject);
begin
   YesNoContinue(false);
end;

procedure TForm1.DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var posgridnew, j:word;
  posgrid:word;
begin
   posgrid:=0;
   with dbgrid2 do
   begin
   if SelectedRows.CurrentRowSelected then
   posgridnew:=DataSource.DataSet.RecNo;
   if   ssShift in shift  then
   if posgrid <= posgridnew then
   begin
   DataSource.DataSet.RecNo:=posgrid;
   for j:=posgrid to posgridnew-1 do
    begin
       SelectedRows.CurrentRowSelected:=true;
       DataSource.DataSet.Next;
    end;
   end else
   begin
       DataSource.DataSet.RecNo:=posgridnew;
       for j:=posgridnew to posgrid-1 do
        begin
          SelectedRows.CurrentRowSelected:=true;
          DataSource.DataSet.Next;
        end;
   end;
   posgrid:=posgridnew;
   SpeedButton9.Enabled:=dbgrid2.SelectedIndex > -1;
   end;
end;

procedure TForm1.DBMemo1Change(Sender: TObject);
var fontheight:byte;
begin
  fontHeight:=(Sender as TDBMemo).height div ((length((Sender as TDBMemo).Text) div 25)+1);
  if fontheight<=25 then
  (Sender as TDBMemo).font.Height:=fontheight else
  (Sender as TDBMemo).Font.Height:=25;
end;

procedure TForm1.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#9 then DBMemo2.SetFocus;

end;

procedure TForm1.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#9 then Grid.SetFocus;

end;

procedure TForm1.rg3Click(Sender: TObject);
begin
 PageControl1Change(sender);
end;

procedure TForm1.GridDrawColumnCell(Sender: TObject; const Rect2: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var style,rl,rr,rt,rb:integer; rect1:TRect;
  //IsOdd:boolean;

begin
//-------------STRIPES-------------//
//if ((DataCol=0) and not(gdselected in state)) then TableGreedRow.drawTrueBack:=not(TableGreedRow.drawTrueBack);
//if odd((rect2.Top-21) div rect2.Height) then
if odd(TDBGrid(sender).DataSource.DataSet.RecNo) then
  TDBGrid(Sender).Canvas.Brush.Color:=TableGreedRow.RowBrushColor1
else
  TDBGrid(Sender).Canvas.Brush.Color:=TableGreedRow.RowBrushColor2;
if gdselected in state then
  begin
      TDBGrid(Sender).Canvas.Brush.Color:=clBlack;
      TDBGrid(Sender).Canvas.Font.Color:=clWhite;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(rect2,datacol,column,state);
  //-------------CHECKBOXES-------------//
  if column.FieldName='Usersel' then
    begin
      rr:=rect2.Right-3; rl:=rect2.Left+3; rb:=rect2.Bottom-3; rt:=Rect2.Top+3;
      rect1:=rect(rl,rt,rr,rb);

      if column.Field.AsBoolean=true then
        style:=dfcs_checked
        else style:=dfcs_buttoncheck;
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, Rect1, DFC_BUTTON, style);
    end;
  //-------------RATES-------------//
  if (column.FieldName='Score') or (column.FieldName='Relevation') then
    begin
      TDBGrid(sender).Canvas.pen.Color:=TDBGrid(sender).Canvas.Brush.Color;
      TDBGrid(sender).Canvas.Rectangle(rect2);
      if N5.Checked then
        begin
          rl:=rect2.Left; rr:=rect2.Right;
          rt:=(rr-rl) div 6; //one part
          rr:=rl+rt*column.Field.AsInteger;
          TDBGrid(sender).Canvas.Brush.Color:=color_scale;
      //rect1:=rect(rect2.Left,rect2.Top,rr,rect2.Bottom);
          TDBGrid(sender).Canvas.Rectangle(rect2.Left,rect2.Top,rr,rect2.Bottom);
        end;
      if N6.Checked or N11.Checked then
        begin
           TDBGrid(sender).Canvas.Brush.Style:=bsClear;
           TDBGrid(sender).Canvas.TextOut(rect2.Left+20,rect2.Top+3,column.Field.AsString);
        end;
    end;
end;

procedure TForm1.Fill4Status;
//var re:TRect;
begin
  with StBar.Panels[4] do
  begin
      Dpot.Visible:=false;
      Style:=psText;
      case StBar.Tag of
        0:Text:='Потенциал: '+seAndCor.potcount;
        1:Text:='Потенциал: '+seAndCor.percent+'%';
        2:Text:='';
        3://with StBar do
        begin
          Style:=psOwnerDraw;
          Dpot.Visible:=true;
          Dpot.Max:=DM2.selectsel.RecordCount * 6;
          Dpot.Position:=strtoint(seAndCor.potcount);
        end;
      end;
   end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  seAndCor.calcprogress;
  StBar.Tag:=3;
  fill4Status;

end;

procedure TForm1.N11Click(Sender: TObject);
begin
    grid.Columns[3].Title.Caption:='Релев.';
    grid.Columns[3].FieldName:='Relevation';
    if n5.Checked then n5.Click;
    if n6.Checked=false then n6.Click;
    Grid.Repaint;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  //StBar.Panels[4].Text:='';
  StBar.tag:=2;
  fill4Status;
end;



procedure TForm1.N1Click(Sender: TObject);
var quest:PWideChar; param:string;
begin
if n13.Checked then
  begin
     quest:='Вы действительно хотите обнулить все оценки?';
     param:='score';
  end
else
  begin
     quest:='Вы действительно хотите обнулить релевантность?' ;
     param:='relevation';
  end;
DM2.droprate.CommandText.Add('UPDATE Dict SET '+param+'=0 WHERE usersel=true');

if Application.MessageBox(quest,'Внимание',MB_YESNO+MB_ICONEXCLAMATION+MB_TASKMODAL)=IDYES then
     begin
      DM2.droprate.Execute;
      //DM2.Dict.Refresh;
      baserefresh;
     end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    color_scale:=colorDialog1.color;
    ChScaleColor.brush.color:=colorDialog1.color;
    Grid.Repaint;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  ChShowScale.Checked:=n5.Checked;

  n13active;
  Grid.Repaint;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
with DM2.Dict do
begin
  if n13.Checked then
    begin
      if IndexName='ScoreInd' then IndexName:='ScoreIndD'
      else IndexName:='ScoreInd';
    end
  else
  begin
     if IndexName='RelInd' then IndexName:='RelIndD'
      else IndexName:='RelInd';
  end;
  First;
end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  seAndCor.calcprogress;
  //StBar.Panels[4].Text:='Потенциал: '+seAndCor.potcount;
  StBar.tag:=0;
  fill4Status;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  seAndCor.calcprogress;
  //StBar.Panels[4].Text:='Потенциал: '+seAndCor.percent;
  StBar.tag:=1;
  fill4Status;
end;

procedure TForm1.nexttackExecute(Sender: TObject);
begin
    PageControl1Change(sender);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  ChShowNumber.Checked:=n6.Checked;
  n13active;
  
  Grid.Repaint;
end;

procedure tform1.N13active;
begin
    if n13.Checked=false then
  begin
    n13.Checked:=true;
    grid.Columns[3].Title.Caption:='оценка';
    grid.Columns[3].FieldName:='score';
  end;
end;

end.
