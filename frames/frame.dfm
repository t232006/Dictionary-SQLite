object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 209
  Height = 150
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 150
    Align = alClient
    Alignment = taLeftJustify
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object panel1: TMemo
      Left = 1
      Top = 49
      Width = 207
      Height = 48
      TabStop = False
      BevelOuter = bvRaised
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object panel2: TMemo
      Left = 1
      Top = 1
      Width = 207
      Height = 48
      TabStop = False
      Align = alTop
      BevelOuter = bvRaised
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 104
    Width = 75
    Height = 25
    Caption = #1085#1077' '#1079#1085#1072#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = bkNo
    NumGlyphs = 2
    ParentFont = False
    Style = bsNew
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 104
    Width = 75
    Height = 25
    Caption = #1079#1085#1072#1102
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 2
  end
end
