object addneword: Taddneword
  Left = 438
  Top = 174
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1077' '#1089#1083#1086#1074#1072
  ClientHeight = 232
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDefaultSizeOnly
  OnClose = FormClose
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 144
    Width = 42
    Height = 20
    Caption = #1058#1077#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 184
    Top = 144
    Width = 161
    Height = 20
    Cursor = crHandPoint
    Caption = #1088#1072#1073#1086#1090#1072#1090#1100' '#1089' '#1090#1077#1084#1072#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -17
    Font.Name = 'Verdana'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object Label3: TLabel
    Left = 600
    Top = 40
    Width = 21
    Height = 16
    Caption = '255'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 600
    Top = 104
    Width = 21
    Height = 16
    Caption = '255'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabeledEdit1: TLabeledEdit
    Left = 40
    Top = 96
    Width = 545
    Height = 33
    AutoSize = False
    EditLabel.Width = 150
    EditLabel.Height = 20
    EditLabel.Caption = #1057#1083#1086#1074#1086' '#1080#1083#1080' '#1092#1088#1072#1079#1072
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -17
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    EditLabel.Transparent = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = ''
    OnChange = LabeledEdit1Change
    OnEnter = LabeledEdit1Enter
  end
  object LabeledEdit2: TLabeledEdit
    Left = 40
    Top = 32
    Width = 545
    Height = 31
    EditLabel.Width = 93
    EditLabel.Height = 20
    EditLabel.Caption = 'Translation'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -17
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = ''
    OnChange = LabeledEdit2Change
    OnEnter = LabeledEdit2Enter
  end
  object BitBtn1: TBitBtn
    Left = 504
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 40
    Top = 168
    Width = 441
    Height = 28
    DropDownRows = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'id'
    ListField = 'Name'
    ListSource = DataModule2.dsTop
    ParentFont = False
    TabOrder = 2
  end
end
