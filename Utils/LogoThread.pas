unit LogoThread;

interface
uses Classes, saver, forms, Windows, Logo, dialogs;
type
TLogoThread=Class(TThread)
  procedure Execute; override;

End;

implementation
uses MainForm;

{ TLogoThread }

procedure TLogoThread.Execute;
begin

  synchronize(Procedure
  begin
    Application.ProcessMessages;
    with form1 do
    begin
      if loadForm=false then
      begin
        //StBar.Panels[0].Text:='Ошибка в загрузке словаря';
        StBar.Tag:=1;   //error!!!
        MessageDlg('Ошибка в загрузке словаря',MTError,[mbOK],0);
        SendMessage(GetForegroundWindow, MSG_PROGRESS, 0, 100);
        exit;
      end;
      stBar.Tag:=0; //no error
    end;
  startexercises;
  end);

end;

end.
