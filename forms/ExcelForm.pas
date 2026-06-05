unit ExcelForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtnrs, winapi.ActiveX;
const
FILENAME='Inserter/InsertForm.xlsx';
type
  IOleMessageFilter = class(TInterfacedObject, IMessageFilter)
  public
    function HandleInComingCall(dwCallType: Longint; htaskCaller: HTask;
      dwTickCount: Longint; lpInterfaceInfo: PInterfaceInfo): Longint;stdcall;
    function RetryRejectedCall(htaskCallee: HTask; dwTickCount: Longint;
      dwRejectType: Longint): Longint;stdcall;
    function MessagePending(htaskCallee: HTask; dwTickCount: Longint;
      dwPendingType: Longint): Longint;stdcall;
    procedure RegisterFilter();
    procedure RevokeFilter();
  end;

  TInsertForm = class(TForm)
    Container: TOleContainer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsertForm: TInsertForm;
implementation
uses MainForm;

{$R *.dfm}

function IOleMessageFilter.HandleInComingCall(dwCallType: Longint;
  htaskCaller: HTask; dwTickCount: Longint;
  lpInterfaceInfo: PInterfaceInfo): Longint;
begin

end;

function IOleMessageFilter.MessagePending(htaskCallee: HTask; dwTickCount, dwPendingType: Integer): Longint;
begin
  Result := 2 //PENDINGMSG_WAITDEFPROCESS
end;

procedure IOleMessageFilter.RegisterFilter;
var
  OldFilter: IMessageFilter;
  NewFilter: IMessageFilter;
begin
  OldFilter := nil;
  NewFilter := IOleMessageFilter.Create;
  CoRegisterMessageFilter(NewFilter,OldFilter);
end;

function IOleMessageFilter.RetryRejectedCall(htaskCallee: HTask; dwTickCount, dwRejectType: Integer): Longint;
begin
  Result := -1;
  if dwRejectType = 2 then
    Result := 99;
end;

procedure IOleMessageFilter.RevokeFilter;
var
  OldFilter: IMessageFilter;
  NewFilter: IMessageFilter;
begin
  OldFilter := nil;
  NewFilter := nil;
  CoRegisterMessageFilter(NewFilter,OldFilter);
end;



procedure TInsertForm.FormClose(Sender: TObject; var Action: TCloseAction);
 var Workbook: OleVariant;
 OLEMessageFilter: IOleMessageFilter;
begin
  //if container.OleObject = nil then Exit;
  //Container.DoVerb(ovShow);
  OLEMessageFilter :=IOLeMessageFilter.Create;
  OLEMessageFilter.RegisterFilter;
  Container.DoVerb(ovShow);
  try
   workbook:=container.OleObject;
   workbook.saveAs('Inserter/InsertForm1.xlsx',51);
  finally
    OLEMessageFilter.RevokeFilter;
    FreeAndNil(OLEMessageFilter);
  end;

  if form1.ef<>nil then form1.ef.FromExcel;
  form1.ef.free;
end;

end.
