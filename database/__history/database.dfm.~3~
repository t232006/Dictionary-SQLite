object DataModule2: TDataModule2
  Height = 455
  Width = 637
  object dspotential: TDataSource
    DataSet = potential
    Left = 360
    Top = 24
  end
  object dsselectsel: TDataSource
    DataSet = selectsel
    Left = 440
    Top = 344
  end
  object dstopic: TDataSource
    DataSet = topic
    Left = 456
    Top = 128
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=dicti' +
      'onary'
    LoginPrompt = False
    Left = 528
    Top = 24
  end
  object top: TADOTable
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Topic'
    Left = 504
    Top = 152
    object topid: TIntegerField
      FieldName = 'id'
    end
    object topName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object Dict: TADOTable
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterInsert = vokabAfterRefresh
    AfterDelete = vokabAfterRefresh
    TableName = 'Dict'
    Left = 552
    Top = 152
    object DictNumber: TAutoIncField
      FieldName = 'Number'
      ReadOnly = True
    end
    object DictWord: TWideStringField
      FieldName = 'Word'
      Size = 255
    end
    object DictTranslation: TWideStringField
      FieldName = 'Translation'
      Size = 255
    end
    object DictTopic: TIntegerField
      FieldName = 'Topic'
    end
    object DictDateRec: TDateField
      FieldName = 'DateRec'
    end
    object DictRelevation: TIntegerField
      FieldName = 'Relevation'
    end
    object DictScore: TSmallintField
      FieldName = 'Score'
    end
    object DictUsersel: TBooleanField
      FieldName = 'Usersel'
      DisplayValues = ' '
    end
    object DictSpot: TBooleanField
      FieldName = 'Spot'
    end
    object DictPhrase: TBooleanField
      FieldName = 'Phrase'
    end
    object DictTopicName: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'TopicName'
      LookupDataSet = top
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'Topic'
      Size = 60
      Lookup = True
    end
  end
  object dsdict: TDataSource
    DataSet = Dict
    Left = 552
    Top = 96
  end
  object topic: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select topic.id, topic.name, count(dict.topic)'
      'from topic left join dict'
      'on dict.topic=topic.id'
      'group by id, name')
    Left = 456
    Top = 184
    object topicid: TIntegerField
      FieldName = 'id'
    end
    object topiccountdicttopic: TIntegerField
      FieldName = 'count(dict.topic)'
    end
    object topicName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object topicquery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'update Dict set usersel=true where')
    Left = 400
    Top = 168
  end
  object dropch: TADOCommand
    CommandText = 'UPDATE Dict'#13#10'SET usersel=false'#13#10#13#10
    Connection = ADOConnection
    Parameters = <>
    Left = 216
    Top = 368
  end
  object selectsel: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Dict where usersel=true')
    Left = 440
    Top = 392
  end
  object potential: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select sum(Score) as sumScore from Dict where usersel=true'
    Parameters = <>
    Left = 360
    Top = 88
  end
  object addball: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 496
    Top = 344
  end
  object droprate: TADOCommand
    Connection = ADOConnection
    Parameters = <>
    Left = 264
    Top = 368
  end
  object dropspot: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'update Dict set spot=false')
    Left = 392
    Top = 272
  end
  object dssynch: TDataSource
    DataSet = synch
    Left = 99
    Top = 172
  end
  object deepsearch: TADOCommand
    Connection = ADOConnection
    Parameters = <>
    Left = 240
    Top = 288
  end
  object synchConn: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FormatOptions.AssignedValues = [fvADOCompatibility]
    FormatOptions.ADOCompatibility = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object synch: TFDQuery
    BeforeOpen = synchBeforeOpen
    AfterOpen = synchAfterOpen
    BeforeClose = synchBeforeClose
    Connection = synchConn
    SQL.Strings = (
      
        'select a.Word,a.Translation,b.Name,a.DateRec, a.relevation from ' +
        'Dict a inner JOIN topic b'
      'on a.topic=b.id'
      
        'where a.Word not in (select Word from TempDB.Dict) and a.Transla' +
        'tion not in (select Translation from TempDB.Dict)'
      '')
    Left = 40
    Top = 112
  end
  object synchAttachDetach: TFDCommand
    Connection = synchConn
    Left = 56
    Top = 264
  end
end
