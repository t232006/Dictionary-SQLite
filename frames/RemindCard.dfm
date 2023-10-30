object Card: TCard
  Left = 300
  Top = 100
  BorderStyle = bsDialog
  ClientHeight = 270
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 115
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'Panel1'
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 115
    Width = 442
    Height = 115
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'Panel2'
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 1
  end
  inline Frame41: TFrame4
    Left = 264
    Top = 239
    Width = 114
    Height = 23
    TabOrder = 2
    ExplicitLeft = 264
    ExplicitTop = 239
    inherited Edit1: TEdit
      OnChange = Frame41Edit1Change
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 112
    Top = 240
  end
end
