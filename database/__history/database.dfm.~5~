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
    DataSet = Topic
    Left = 472
    Top = 96
  end
  object dsdict: TDataSource
    DataSet = Dict
    Left = 560
    Top = 96
  end
  object dssynch: TDataSource
    DataSet = synch
    Left = 99
    Top = 172
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
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=Z:\'#1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077'\repos\Dictionary-SQLite\db\dictiona' +
        'ry.db')
    Connected = True
    LoginPrompt = False
    Left = 536
    Top = 24
  end
  object Dict: TFDTable
    Active = True
    IndexFieldNames = 'Number'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Dict'
    Left = 560
    Top = 160
    object DictNumber: TFDAutoIncField
      FieldName = 'Number'
      Origin = 'Number'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object DictWord: TWideStringField
      FieldName = 'Word'
      Origin = 'Word'
      Required = True
      Size = 32767
    end
    object DictTranslation: TWideStringField
      FieldName = 'Translation'
      Origin = 'Translation'
      Required = True
      Size = 32767
    end
    object DictDateRec: TDateField
      FieldName = 'DateRec'
      Origin = 'DateRec'
      Required = True
    end
    object DictScore: TSmallintField
      FieldName = 'Score'
      Origin = 'Score'
      Required = True
    end
    object DictUsersel: TBooleanField
      FieldName = 'Usersel'
      Origin = 'Usersel'
      Required = True
      DisplayValues = ' '
    end
    object DictPhrase: TBooleanField
      FieldName = 'Phrase'
      Origin = 'Phrase'
    end
    object DictRelevation: TIntegerField
      FieldName = 'Relevation'
      Origin = 'Relevation'
      Required = True
    end
    object DictSpot: TBooleanField
      FieldName = 'Spot'
      Origin = 'Spot'
      Required = True
    end
    object DictTopic: TIntegerField
      FieldName = 'Topic'
      Origin = 'Topic'
    end
    object DictTopicName: TStringField
      FieldKind = fkLookup
      FieldName = 'TopicName'
      LookupDataSet = Top
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'Topic'
      Lookup = True
    end
  end
  object Top: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'topic'
    Left = 512
    Top = 136
  end
  object Topic: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select topic.id, topic.name, count(dict.topic)'
      'from topic left join dict'
      'on dict.topic=topic.id'
      'group by id, name')
    Left = 472
    Top = 160
  end
  object Topicquery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'update Dict set usersel=true where')
    Left = 376
    Top = 184
  end
  object potential: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select sum(Score) as sumScore from Dict where usersel=true')
    Left = 360
    Top = 80
  end
  object dropspot: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'update Dict set spot=false')
    Left = 456
    Top = 264
  end
  object addball: TFDQuery
    Connection = FDConnection
    Left = 520
    Top = 280
  end
  object selectsel: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from Dict where usersel=true')
    Left = 448
    Top = 392
  end
  object deepsearch: TFDCommand
    Connection = FDConnection
    Left = 216
    Top = 288
  end
  object dropch: TFDCommand
    Connection = FDConnection
    CommandText.Strings = (
      'UPDATE Dict'
      'SET usersel=false')
    Left = 200
    Top = 368
  end
  object droprate: TFDCommand
    Connection = FDConnection
    Left = 264
    Top = 368
  end
end
