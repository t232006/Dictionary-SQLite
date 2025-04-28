object datamodule2: Tdatamodule2
  Height = 683
  Width = 956
  PixelsPerInch = 144
  object dspotential: TDataSource
    DataSet = potential
    Left = 540
    Top = 36
  end
  object dsselectsel: TDataSource
    DataSet = selectsel
    Left = 660
    Top = 516
  end
  object dstopic: TDataSource
    DataSet = Topic
    Left = 708
    Top = 144
  end
  object dsdict: TDataSource
    DataSet = Dict
    Left = 840
    Top = 144
  end
  object dssynch: TDataSource
    DataSet = synch
    Left = 149
    Top = 258
  end
  object synchConn: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    FormatOptions.AssignedValues = [fvADOCompatibility]
    FormatOptions.ADOCompatibility = True
    Connected = True
    LoginPrompt = False
    Left = 60
    Top = 36
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
    Left = 60
    Top = 168
  end
  object synchAttachDetach: TFDCommand
    Connection = synchConn
    Left = 84
    Top = 396
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=G:\some folder\indDictionary\Dictionary-SQLite\db\dicti' +
        'onary.db')
    Connected = True
    LoginPrompt = False
    Left = 804
    Top = 36
  end
  object Top: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    TableName = 'topic'
    Left = 768
    Top = 240
  end
  object Topic: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select topic.id, topic.name, count(dict.topic)'
      'from topic left join dict'
      'on dict.topic=topic.id'
      'group by id, name')
    Left = 708
    Top = 240
  end
  object Topicquery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'update Dict set usersel=true where')
    Left = 564
    Top = 276
  end
  object potential: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select sum(Score) as sumScore from Dict where usersel=true')
    Left = 540
    Top = 120
  end
  object dropspot: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'update Dict set spot=false')
    Left = 684
    Top = 396
  end
  object addball: TFDQuery
    Connection = FDConnection
    Left = 780
    Top = 420
  end
  object selectsel: TFDQuery
    AfterOpen = selectselAfterOpen
    Connection = FDConnection
    SQL.Strings = (
      'select * from Dict where usersel=true')
    Left = 672
    Top = 588
  end
  object deepsearch: TFDCommand
    Connection = FDConnection
    Left = 324
    Top = 432
  end
  object dropch: TFDCommand
    Connection = FDConnection
    CommandText.Strings = (
      'UPDATE Dict'
      'SET usersel=false')
    Left = 300
    Top = 552
  end
  object droprate: TFDCommand
    Connection = FDConnection
    Left = 396
    Top = 552
  end
  object dsTop: TDataSource
    DataSet = Top
    Left = 780
    Top = 156
  end
  object Dict: TFDQuery
    Active = True
    AfterInsert = Dict1AfterInsert
    AfterDelete = Dict1AfterInsert
    Filtered = True
    Indexes = <
      item
        Active = True
        Name = 'WordInd'
        Fields = 'Word'
      end
      item
        Active = True
        Name = 'WordIndD'
        Fields = 'Word'
        DescFields = 'Word'
      end
      item
        Active = True
        Name = 'TranslationInd'
        Fields = 'Translation'
      end
      item
        Active = True
        Name = 'TranslationIndD'
        Fields = 'Translation'
        DescFields = 'Translation'
      end
      item
        Active = True
        Name = 'DateRecInd'
        Fields = 'DateRec'
      end
      item
        Active = True
        Name = 'DateRecD'
        Fields = 'DateRec'
        DescFields = 'DateRec'
      end
      item
        Active = True
        Name = 'topicind'
        Fields = 'TopicName'
      end
      item
        Active = True
        Name = 'TopicIndD'
        Fields = 'TopicName'
        DescFields = 'TopicName'
      end
      item
        Active = True
        Name = 'UserselInd'
        Fields = 'Usersel'
      end
      item
        Active = True
        Name = 'UserselIndD'
        Fields = 'Usersel'
        DescFields = 'Usersel'
      end
      item
        Active = True
        Name = 'ScoreInd'
        Fields = 'Score'
      end
      item
        Active = True
        Name = 'ScoreIndD'
        Fields = 'Score'
        DescFields = 'Score'
      end
      item
        Active = True
        Name = 'RelInd'
        Fields = 'Relevation'
      end
      item
        Active = True
        Name = 'RelIndD'
        Fields = 'Relevation'
        DescFields = 'Relevation'
      end
      item
        Active = True
        Name = 'PhraseInd'
        Fields = 'Phrase'
      end>
    DetailFields = 
      'Number;Word;Translation;Topic;Usersel;DateRec;Phrase;Relevation;' +
      'Score;Spot;TopicName'
    Connection = FDConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      
        'Select Number, Word, Translation, Topic, DateRec, Relevation, Sc' +
        'ore, Usersel, Spot, Phrase, Name as TopicName'
      'from Dict inner join Topic on Dict.Topic=Topic.ID')
    Left = 840
    Top = 252
    object DictNumber: TFDAutoIncField
      FieldName = 'Number'
      Origin = 'Number'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object DictTopic: TIntegerField
      FieldName = 'Topic'
      Origin = 'Topic'
    end
    object DictDateRec: TDateField
      FieldName = 'DateRec'
      Origin = 'DateRec'
    end
    object DictRelevation: TIntegerField
      FieldName = 'Relevation'
      Origin = 'Relevation'
    end
    object DictScore: TSmallintField
      FieldName = 'Score'
      Origin = 'Score'
    end
    object DictUsersel: TBooleanField
      FieldName = 'Usersel'
      Origin = 'Usersel'
      DisplayValues = ' '
    end
    object DictSpot: TBooleanField
      FieldName = 'Spot'
      Origin = 'Spot'
    end
    object DictPhrase: TBooleanField
      FieldName = 'Phrase'
      Origin = 'Phrase'
    end
    object DictTopicName: TWideStringField
      FieldKind = fkLookup
      FieldName = 'TopicName'
      LookupDataSet = Top
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'Topic'
      Size = 60
      Lookup = True
    end
  end
end
