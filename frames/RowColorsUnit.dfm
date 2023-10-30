object RowColors: TRowColors
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1062#1074#1077#1090#1072' '#1089#1090#1088#1086#1082' '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 85
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 13
  inline ColoredRow1: TColoredRow
    Left = 0
    Top = 0
    Width = 462
    Height = 44
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 462
    inherited Panel1: TPanel
      OnClick = ColoredRow1Panel1Click
    end
  end
  inline ColoredRow2: TColoredRow
    Left = 0
    Top = 41
    Width = 462
    Height = 44
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 41
    ExplicitWidth = 462
  end
  object CheckBox1: TCheckBox
    Left = 13
    Top = 60
    Width = 21
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = CheckBox1Click
  end
end
