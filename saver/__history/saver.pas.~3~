unit saver;

interface
uses VCL.Graphics, Classes, Sysutils, System.IniFiles, Frame ;


   procedure saveForm;
   procedure loadForm;

implementation
uses MainForm;

procedure loadForm;
  var //f:textfile;
    fk:byte;
    f:TIniFile;
begin
    f:=TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'saver\init.ini');
    try
    with form1 do
      begin

      Grid.Font.Size:=f.ReadInteger('Table','GridFontSize',10);
      Frame42.Edit1.Text:=inttostr(Grid.Font.Size);
      Grid.Font.Color:=f.ReadInteger('Table','GridFontColor',0);
      ShTableFontColor.Brush.Color:=Grid.Font.Color;
      TableGreedRow.RowBrushColor1:=f.ReadInteger('Table','Row1Color',-16777208);
      Frame31.Shape1.Brush.Color:=TableGreedRow.RowBrushColor1;
      TableGreedRow.RowBrushColor2:=f.ReadInteger('Table','Row2Color',-16777208);
      Frame31.Shape2.Brush.Color:=TableGreedRow.RowBrushColor2;

      color_scale:=f.ReadInteger('Scale','color_scale',0);
      ShScaleColor.Brush.Color:=color_scale;
      n5.Checked:=f.ReadBool('Scale','ShowDigit',false);
      ChShowScale.Checked:=n5.Checked;
      n6.Checked:=f.ReadBool('Scale','ShowScale',false);
      ChShowNumber.Checked:=n6.Checked;

      ShCardColor.Brush.Color:=f.ReadInteger('Scale','CardColor',-16777206);
      LaUpperCard.Font.Color:=f.ReadInteger('Card','FontColor1',65280);
      LaBottomCard.Font.Color:=f.ReadInteger('Card','FontColor2',65280);
      LaUpperCard.Font.Size:=f.ReadInteger('Card','FontSize1',14);
      LaBottomCard.Font.Size:=f.ReadInteger('Card','FontSize2',14);
      LaUpperCard.Font.Name:=f.ReadString('Card','FontName1','MS Sans Serif');
      LaBottomCard.Font.Name:=f.ReadString('Card','FontName2','MS Sans Serif');
       for fk:=1 to 12 do
       begin
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).panel.color:=ShCardColor.Brush.Color;
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.Color:=LaUpperCard.Font.Color;
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.Color:=LaBottomCard.Font.Color;
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.Size:=LaUpperCard.Font.Size;
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.Size:=LaBottomCard.Font.Size;
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.Name:=LaUpperCard.Font.Name;
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.Name:=LaBottomCard.Font.Name;
       end;
          fk:=f.ReadInteger('Bar','Radio',3);
          case fk of
             0:Form1.N8Click(Form1);
             1:Form1.N9Click(Form1);//n9.Checked:=true;
             2:Form1.N10Click(Form1);//n10.checked:=true;
             3:Form1.N12Click(Form1);//n12.checked:=true;
           end;
       basefolder.Caption:=f.ReadString('database','database',ExtractFileDir(paramstr(0)+'\db\dictionary.db'));
      end;
    finally
    f.Free;
    end;
end;

procedure saveForm;
var f:TIniFile; //s:string;
begin
    f:=TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'saver\init.ini');
    try
    with form1 do
    begin
      f.WriteInteger('Table','GridFontSize',Grid.Font.Size);
      f.WriteInteger('Table','GridFontColor',Grid.font.Color);
      f.WriteInteger('Table','Row1Color',tablegreedrow.RowBrushColor1);
      f.WriteInteger('Table','Row2Color',tablegreedrow.RowBrushColor2);

      f.WriteInteger('Scale','ColorScale',color_scale);
      f.WriteBool('Scale','ShowDigit',n5.Checked);
      f.WriteBool('Scale','ShowScale',n6.Checked);

      f.WriteInteger('Card','CardColor',Frame21.Panel1.Color);
      f.WriteInteger('Card','FontColor1',Frame21.panel1.Font.Color);
      f.WriteInteger('Card','FontColor2',Frame21.panel2.Font.Color);
      f.WriteInteger('Card','FontSize1',Frame21.panel1.Font.Size);
      f.WriteInteger('Card','FontSize2',Frame21.panel2.Font.Size);
      f.WriteString('Card','FontName1',Frame21.panel1.Font.Name);
      f.WriteString('Card','FontName2',Frame21.panel2.Font.Name);

      if n8.checked then f.WriteInteger('Bar','Radio',0) else
      if n9.checked then f.WriteInteger('Bar','Radio',1) else
      if n10.checked then f.WriteInteger('Bar','Radio',2) else
      if n12.checked then f.WriteInteger('Bar','Radio',3);

      f.WriteString('database','database',form1.baseFolder.Caption);
    end;
    finally

    end;
    //f.UpdateFile;
    f.Free;
end;
end.
