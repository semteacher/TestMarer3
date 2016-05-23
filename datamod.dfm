object testeditDM: TtesteditDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 301
  Top = 92
  Height = 570
  Width = 800
  object TestDB: TpFIBDatabase
    DBName = 'D:\TEST_DB\TDMU_TEST.GDB'
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTr
    SQLDialect = 1
    Timeout = 0
    CacheSchemaOptions.AutoSaveToFile = True
    CacheSchemaOptions.AutoLoadFromFile = True
    WaitForRestoreConnect = 0
    OnLostConnect = TestDBLostConnect
    OnErrorRestoreConnect = TestDBErrorRestoreConnect
    Left = 8
    Top = 15
  end
  object ReadTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 8
    Top = 71
  end
  object SciensDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SCIENS'
      'SET '
      '    SC_NAME = ?SC_NAME,'
      '    SC_DESCR= ?SC_DESCR,'
      '    DEP_ID = ?MAS_DEPID,'
      '    LIB_SC_ID = ?LIB_SC_ID,'
      '    ID_LANG = ?ID_LANG,'
      '    SEMESTR = ?SEMESTR'
      'WHERE'
      '    ID_SCIENS = ?OLD_ID_SCIENS'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SCIENS'
      'WHERE'
      '        ID_SCIENS = ?OLD_ID_SCIENS'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SCIENS('
      '    ID_SCIENS,'
      '    SC_NAME,'
      '    SC_DESCR,'
      '    DEP_ID,'
      '    LIB_SC_ID,'
      '    ID_LANG,'
      '    SEMESTR'
      ')'
      'VALUES('
      '    ?ID_SCIENS,'
      '    ?SC_NAME,'
      '    ?SC_DESCR,'
      '    ?MAS_DEPID,'
      '    ?LIB_SC_ID,'
      '    ?ID_LANG,'
      '    ?SEMESTR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_SCIENS,'
      '    SC_NAME,'
      '    SC_DESCR,'
      '    DEP_ID,'
      '    LIB_SC_ID,'
      '    ID_LANG,'
      '    SEMESTR,'
      '    ASK_COUNT'
      'FROM'
      '    SCIENS '
      ''
      ' WHERE '
      '        SCIENS.ID_SCIENS = ?OLD_ID_SCIENS'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SCIENS,'
      '    SC_NAME,'
      '    SC_DESCR,'
      '    DEP_ID,'
      '    LIB_SC_ID,'
      '    ID_LANG,'
      '    SEMESTR,'
      '    ASK_COUNT'
      'FROM'
      '    SCIENS '
      'Where DEP_ID= ?DEPID')
    AutoUpdateOptions.UpdateTableName = 'SCIENS'
    AutoUpdateOptions.KeyFields = 'ID_SCIENS'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_SCIENS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterDelete = SciensDataSetAfterDelete
    AfterOpen = SciensDataSetAfterOpen
    AfterPost = SciensDataSetAfterPost
    AfterScroll = SciensDataSetAfterScroll
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = SciensWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = DepartDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 336
    Top = 176
    poAskRecordCount = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    oProtectedEdit = True
    oVisibleRecno = True
    object SciensDataSetID_SCIENS: TFIBIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SCIENS'
      Visible = False
    end
    object SciensDataSetSC_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1090#1077#1084#1080' ('#1084#1086#1076#1091#1083#1103')'
      FieldName = 'SC_NAME'
      Size = 200
      EmptyStrToNull = True
    end
    object SciensDataSetSC_DESCR: TFIBStringField
      DisplayLabel = #1055#1088#1080#1084#1110#1090#1082#1080
      FieldName = 'SC_DESCR'
      Visible = False
      Size = 100
      EmptyStrToNull = True
    end
    object SciensDataSetDEP_ID: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'DEP_ID'
      Visible = False
    end
    object SciensDataSetLIB_SC_ID: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'LIB_SC_ID'
      Visible = False
    end
    object SciensDataSetID_LANG: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_LANG'
      Visible = False
    end
    object SciensDataSetlanng_search: TStringField
      DefaultExpression = '1'
      DisplayLabel = #1052#1086#1074#1072
      FieldKind = fkLookup
      FieldName = 'lanng_search'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'LANG_NAME'
      KeyFields = 'ID_LANG'
      Size = 15
      Lookup = True
    end
    object SciensDataSetsc_name_search: TStringField
      DisplayLabel = #1053#1072#1091#1082'. '#1085#1072#1087#1088'.'
      FieldKind = fkLookup
      FieldName = 'sc_name_search'
      LookupDataSet = FulLIbSciendDataSet
      LookupKeyFields = 'ID_SC_LIB'
      LookupResultField = 'LIB_SC_NAME'
      KeyFields = 'LIB_SC_ID'
      Lookup = True
    end
    object SciensDataSetSEMESTR: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1057#1077#1084'.'
      FieldName = 'SEMESTR'
    end
    object SciensDataSetASK_COUNT: TFIBIntegerField
      DisplayLabel = #1055#1080#1090'.'
      FieldName = 'ASK_COUNT'
    end
  end
  object SciensDS: TDataSource
    DataSet = SciensDataSet
    Left = 336
    Top = 223
  end
  object DepartDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DEPARTMENTS'
      'SET '
      '    DEPNAME = ?DEPNAME'
      'WHERE'
      '    DEPID = ?OLD_DEPID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DEPARTMENTS'
      'WHERE'
      '        DEPID = ?OLD_DEPID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DEPARTMENTS('
      '    DEPID,'
      '    DEPNAME'
      ')'
      'VALUES('
      '    ?DEPID,'
      '    ?DEPNAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    DEPID,'
      '    DEPNAME'
      'FROM'
      '    DEPARTMENTS '
      ''
      ' WHERE '
      '        DEPARTMENTS.DEPID = ?OLD_DEPID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    DEPID,'
      '    DEPNAME'
      'FROM'
      '    DEPARTMENTS ')
    AutoUpdateOptions.UpdateTableName = 'DEPARTMENTS'
    AutoUpdateOptions.KeyFields = 'DEPID'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_DEPARTMENTS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterScroll = DepartDataSetAfterScroll
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = DepartWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 83
    Top = 175
    object DepartDataSetDEPID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'DEPID'
    end
    object DepartDataSetDEPNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1082#1072#1092#1077#1076#1088#1080' ('#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091')'
      FieldName = 'DEPNAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object LibSciensDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE LIB_SCIENS'
      'SET '
      '    LIB_SC_NAME = ?LIB_SC_NAME,'
      '    LIB_SC_DESC = ?LIB_SC_DESC,'
      '    DEPID = ?MAS_DEPID'
      'WHERE'
      '    ID_SC_LIB = ?OLD_ID_SC_LIB'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    LIB_SCIENS'
      'WHERE'
      '        ID_SC_LIB = ?OLD_ID_SC_LIB'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO LIB_SCIENS('
      '    ID_SC_LIB,'
      '    LIB_SC_NAME,'
      '    LIB_SC_DESC,'
      '    DEPID'
      ')'
      'VALUES('
      '    ?ID_SC_LIB,'
      '    ?LIB_SC_NAME,'
      '    ?LIB_SC_DESC,'
      '    ?MAS_DEPID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_SC_LIB,'
      '    LIB_SC_NAME,'
      '    LIB_SC_DESC,'
      '    DEPID'
      'FROM'
      '    LIB_SCIENS '
      ''
      ' WHERE '
      '        LIB_SCIENS.ID_SC_LIB = ?OLD_ID_SC_LIB'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SC_LIB,'
      '    LIB_SC_NAME,'
      '    LIB_SC_DESC,'
      '    DEPID'
      'FROM'
      '    LIB_SCIENS '
      'Where '
      '    DEPID= ?DEPID')
    AutoUpdateOptions.UpdateTableName = 'LIB_SCIENS'
    AutoUpdateOptions.KeyFields = 'ID_SC_LIB'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_LIB_SCIENS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterDelete = LibSciensDataSetAfterDelete
    AfterPost = LibSciensDataSetAfterPost
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = LibSciensWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = DepartDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 168
    Top = 175
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object LibSciensDataSetID_SC_LIB: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SC_LIB'
    end
    object LibSciensDataSetLIB_SC_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1085#1072#1087#1088#1103#1084#1082#1091
      FieldName = 'LIB_SC_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object LibSciensDataSetDEPID: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      FieldName = 'DEPID'
      Visible = False
    end
    object LibSciensDataSetLIB_SC_DESC: TFIBStringField
      DisplayLabel = #1054#1087#1080#1089' '#1085#1072#1087#1088#1103#1084#1082#1091' ('#1087#1088#1080#1084#1110#1090#1082#1080')'
      FieldName = 'LIB_SC_DESC'
      Size = 200
      EmptyStrToNull = True
    end
  end
  object SciensWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 336
    Top = 127
  end
  object DepartDS: TDataSource
    DataSet = DepartDataSet
    Left = 84
    Top = 223
  end
  object LibSciensDS: TDataSource
    DataSet = LibSciensDataSet
    Left = 168
    Top = 223
  end
  object TestaskWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 416
    Top = 127
  end
  object TestAskDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TESTASKS'
      'SET '
      '    SCIENS_ID = ?MAS_ID_SCIENS,'
      '    ASKTEXT = ?ASKTEXT,'
      '    ASKTEXT2 = ?ASKTEXT2,'
      '    ASKIMAGE = ?ASKIMAGE,'
      '    POINTS = ?POINTS,'
      '    FREQUENT = ?FREQUENT,'
      '    ID_ASKTYPE = ?ID_ASKTYPE,'
      '    ANSWCOUNT = ?ANSWCOUNT,'
      '    ARCHIVE = ?ARCHIVE'
      'WHERE'
      '    ID_ASK = ?OLD_ID_ASK'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TESTASKS'
      'WHERE'
      '        ID_ASK = ?OLD_ID_ASK'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TESTASKS('
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    ASKTEXT,'
      '    ASKTEXT2,'
      '    ASKIMAGE,'
      '    POINTS,'
      '    FREQUENT,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    ARCHIVE'
      ')'
      'VALUES('
      '    ?ID_ASK,'
      '    ?MAS_ID_SCIENS,'
      '    ?ASKTEXT,'
      '    ?ASKTEXT2,'
      '    ?ASKIMAGE,'
      '    ?POINTS,'
      '    ?FREQUENT,'
      '    ?ID_ASKTYPE,'
      '    ?ANSWCOUNT,'
      '    ?ARCHIVE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    ASKTEXT,'
      '    ASKTEXT2,'
      '    ASKIMAGE,'
      '    POINTS,'
      '    FREQUENT,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    ARCHIVE'
      'FROM'
      '    TESTASKS '
      'Where '
      '        TESTASKS.ID_ASK = ?OLD_ID_ASK'
      '     '
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    ASKTEXT,'
      '    ASKTEXT2,'
      '    ASKIMAGE,'
      '    POINTS,'
      '    FREQUENT,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    ARCHIVE'
      'FROM'
      '    TESTASKS '
      'Where'
      '    SCIENS_ID=?ID_SCIENS'
      'order by ID_ASK')
    AutoUpdateOptions.UpdateTableName = 'TESTASKS'
    AutoUpdateOptions.KeyFields = 'ID_ASK'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_TESTASKS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AfterDelete = TestAskDataSetAfterDelete
    AfterOpen = TestAskDataSetAfterOpen
    AfterPost = TestAskDataSetAfterPost
    BeforeScroll = TestAskDataSetBeforeScroll
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = TestaskWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = SciensDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 416
    Top = 175
    poAskRecordCount = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    oProtectedEdit = True
    oVisibleRecno = True
    object TestAskDataSetID_ASK: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'ID_ASK'
    end
    object TestAskDataSetSCIENS_ID: TFIBIntegerField
      DisplayLabel = #1053#1072#1091#1082'. '#1085#1072#1087#1088'.'
      FieldName = 'SCIENS_ID'
      Visible = False
    end
    object TestAskDataSetASKTEXT: TFIBStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1087#1080#1090#1072#1085#1085#1103
      FieldName = 'ASKTEXT'
      Visible = False
      Size = 1000
      EmptyStrToNull = True
    end
    object TestAskDataSetASKTEXT2: TFIBMemoField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1087#1080#1090#1072#1085#1085#1103
      FieldName = 'ASKTEXT2'
      Visible = False
      BlobType = ftFmtMemo
      Size = 8
    end
    object TestAskDataSetASKIMAGE: TFIBBlobField
      DisplayLabel = #1030#1083#1102#1089#1090#1088#1072#1094#1110#1103
      FieldName = 'ASKIMAGE'
      Visible = False
      Size = 8
    end
    object TestAskDataSetPOINTS: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1057#1082#1083#1072#1076#1085#1110#1089#1090#1100
      DisplayWidth = 10
      FieldName = 'POINTS'
    end
    object TestAskDataSetFREQUENT: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1063#1072#1089#1090#1086#1090#1072
      FieldName = 'FREQUENT'
      Visible = False
    end
    object TestAskDataSetID_ASKTYPE: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1058#1080#1087
      FieldName = 'ID_ASKTYPE'
      Visible = False
    end
    object TestAskDataSetANSWCOUNT: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1050#1110#1083#1100#1082'. '#1074#1110#1076#1087'.'
      DisplayWidth = 10
      FieldName = 'ANSWCOUNT'
    end
    object TestAskDataSetARCHIVE: TFIBIntegerField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1040#1088#1093#1110#1074
      DisplayWidth = 10
      FieldName = 'ARCHIVE'
    end
    object TestAskDataSetask_tepe_search: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1080#1090#1072#1085#1085#1103
      FieldKind = fkLookup
      FieldName = 'ask_tepe_search'
      LookupDataSet = LibAskTypeDataSet
      LookupKeyFields = 'ID_ASKTYPE'
      LookupResultField = 'ASKTYPENAME'
      KeyFields = 'ID_ASKTYPE'
      Visible = False
      Lookup = True
    end
  end
  object TestAskDS: TDataSource
    DataSet = TestAskDataSet
    Left = 416
    Top = 223
  end
  object LangsDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE LIB_LANGUAGE'
      'SET '
      '    LANG_NAME = ?LANG_NAME,'
      '    PERSON_TIT = ?PERSON_TIT,'
      '    SIGN_TIT = ?SIGN_TIT,'
      '    GROUP_TIT = ?GROUP_TIT,'
      '    SPEC_TIT = ?SPEC_TIT,'
      '    SUBJ_TIT = ?SUBJ_TIT,'
      '    FACULTY_TIT = ?FACULTY_TIT,'
      '    SEMESTR_TIT = ?SEMESTR_TIT'
      'WHERE'
      '    ID_LANG = ?OLD_ID_LANG'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    LIB_LANGUAGE'
      'WHERE'
      '        ID_LANG = ?OLD_ID_LANG'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO LIB_LANGUAGE('
      '    ID_LANG,'
      '    LANG_NAME,'
      '    PERSON_TIT,'
      '    SIGN_TIT,'
      '    GROUP_TIT,'
      '    SPEC_TIT,'
      '    SUBJ_TIT,'
      '    FACULTY_TIT,'
      '    SEMESTR_TIT'
      ')'
      'VALUES('
      '    ?ID_LANG,'
      '    ?LANG_NAME,'
      '    ?PERSON_TIT,'
      '    ?SIGN_TIT,'
      '    ?GROUP_TIT,'
      '    ?SPEC_TIT,'
      '    ?SUBJ_TIT,'
      '    ?FACULTY_TIT,'
      '    ?SEMESTR_TIT'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_LANG,'
      '    LANG_NAME,'
      '    PERSON_TIT,'
      '    SIGN_TIT,'
      '    GROUP_TIT,'
      '    SPEC_TIT,'
      '    SUBJ_TIT,'
      '    FACULTY_TIT,'
      '    SEMESTR_TIT'
      'FROM'
      '    LIB_LANGUAGE '
      ''
      ' WHERE '
      '        LIB_LANGUAGE.ID_LANG = ?OLD_ID_LANG'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_LANG,'
      '    LANG_NAME,'
      '    PERSON_TIT,'
      '    SIGN_TIT,'
      '    GROUP_TIT,'
      '    SPEC_TIT,'
      '    SUBJ_TIT,'
      '    FACULTY_TIT,'
      '    SEMESTR_TIT'
      'FROM'
      '    LIB_LANGUAGE ')
    AutoUpdateOptions.UpdateTableName = 'LIB_LANGUAGE'
    AutoUpdateOptions.KeyFields = 'ID_LANG'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_LIB_LANGUAGE_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = LangWtiteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 8
    Top = 175
    object LangsDataSetID_LANG: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_LANG'
      Visible = False
    end
    object LangsDataSetLANG_NAME: TFIBStringField
      DefaultExpression = #39#1084#1086#1074#1072#39
      DisplayLabel = #1052#1086#1074#1072
      FieldName = 'LANG_NAME'
      Size = 15
      EmptyStrToNull = True
    end
    object LangsDataSetPERSON_TIT: TFIBStringField
      DisplayLabel = #1040#1073#1110#1090#1091#1088#1110#1108#1085#1090' ('#1084#1110#1090#1082#1072')'
      FieldName = 'PERSON_TIT'
      Size = 100
      EmptyStrToNull = True
    end
    object LangsDataSetSIGN_TIT: TFIBStringField
      DisplayLabel = #1055#1110#1076#1087#1080#1089' ('#1084#1110#1090#1082#1072')'
      FieldName = 'SIGN_TIT'
      Size = 30
      EmptyStrToNull = True
    end
    object LangsDataSetGROUP_TIT: TFIBStringField
      DisplayLabel = #1043#1088#1091#1087#1072' ('#1084#1110#1090#1082#1072')'
      FieldName = 'GROUP_TIT'
      Size = 30
      EmptyStrToNull = True
    end
    object LangsDataSetSPEC_TIT: TFIBStringField
      DisplayLabel = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100' ('#1084#1110#1090#1082#1072')'
      FieldName = 'SPEC_TIT'
      Size = 100
      EmptyStrToNull = True
    end
    object LangsDataSetSUBJ_TIT: TFIBStringField
      DisplayLabel = #1055#1088#1077#1076#1084#1077#1090' ('#1084#1110#1090#1082#1072')'
      FieldName = 'SUBJ_TIT'
      Size = 50
      EmptyStrToNull = True
    end
    object LangsDataSetFACULTY_TIT: TFIBStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090' ('#1084#1110#1090#1082#1072')'
      FieldName = 'FACULTY_TIT'
      Size = 50
      EmptyStrToNull = True
    end
    object LangsDataSetSEMESTR_TIT: TFIBStringField
      DisplayLabel = #1057#1077#1084#1077#1089#1090#1088' ('#1084#1110#1090#1082#1072')'
      FieldName = 'SEMESTR_TIT'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object LangDS: TDataSource
    DataSet = LangsDataSet
    Left = 8
    Top = 223
  end
  object LangWtiteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 8
    Top = 127
  end
  object LibSciensWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 168
    Top = 127
  end
  object LibUserDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE USERS'
      'SET '
      '    USERNAME = ?USERNAME,'
      '    USERPASS = ?USERPASS,'
      '    LASTNAME = ?LASTNAME,'
      '    FIRSTNAME = ?FIRSTNAME,'
      '    MIDDLENAME = ?MIDDLENAME,'
      '    EMAIL = ?EMAIL,'
      '    ID_DEP = ?MAS_DEPID,'
      '    USERTYPE_ID = ?USERTYPE_ID'
      'WHERE'
      '    USERID = ?OLD_USERID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    USERS'
      'WHERE'
      '        USERID = ?OLD_USERID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO USERS('
      '    USERID,'
      '    USERNAME,'
      '    USERPASS,'
      '    LASTNAME,'
      '    FIRSTNAME,'
      '    MIDDLENAME,'
      '    EMAIL,'
      '    ID_DEP,'
      '    USERTYPE_ID'
      ')'
      'VALUES('
      '    ?USERID,'
      '    ?USERNAME,'
      '    ?USERPASS,'
      '    ?LASTNAME,'
      '    ?FIRSTNAME,'
      '    ?MIDDLENAME,'
      '    ?EMAIL,'
      '    ?MAS_DEPID,'
      '    ?USERTYPE_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    USERID,'
      '    USERNAME,'
      '    USERPASS,'
      '    LASTNAME,'
      '    FIRSTNAME,'
      '    MIDDLENAME,'
      '    EMAIL,'
      '    ID_DEP,'
      '    USERTYPE_ID'
      'FROM'
      '    USERS '
      'Where     USERS.USERID = ?OLD_USERID'
      '     '
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    USERID,'
      '    USERNAME,'
      '    USERPASS,'
      '    LASTNAME,'
      '    FIRSTNAME,'
      '    MIDDLENAME,'
      '    EMAIL,'
      '    ID_DEP,'
      '    USERTYPE_ID'
      'FROM'
      '    USERS '
      'Where ID_DEP = ?DEPID')
    AutoUpdateOptions.UpdateTableName = 'USERS'
    AutoUpdateOptions.KeyFields = 'USERID'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_USERS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterScroll = LibUserDataSetAfterScroll
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = LibUserWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = DepartDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 256
    Top = 175
    WaitEndMasterScroll = True
    dcForceOpen = True
    object LibUserDataSetUSERID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'USERID'
      Visible = False
    end
    object LibUserDataSetUSERNAME: TFIBStringField
      DisplayLabel = #1051#1086#1075#1110#1085
      FieldName = 'USERNAME'
      Size = 30
      EmptyStrToNull = True
    end
    object LibUserDataSetUSERPASS: TFIBStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'USERPASS'
      Size = 30
      EmptyStrToNull = True
    end
    object LibUserDataSetLASTNAME: TFIBStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'LASTNAME'
      Size = 50
      EmptyStrToNull = True
    end
    object LibUserDataSetFIRSTNAME: TFIBStringField
      DisplayLabel = #1030#39#1084#1103
      FieldName = 'FIRSTNAME'
      Size = 50
      EmptyStrToNull = True
    end
    object LibUserDataSetMIDDLENAME: TFIBStringField
      DisplayLabel = #1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110
      FieldName = 'MIDDLENAME'
      Size = 50
      EmptyStrToNull = True
    end
    object LibUserDataSetEMAIL: TFIBStringField
      DisplayLabel = #1045#1083#1077#1082#1090#1088#1086#1085#1085#1072' '#1087#1086#1096#1090#1072
      FieldName = 'EMAIL'
      Size = 50
      EmptyStrToNull = True
    end
    object LibUserDataSetID_DEP: TFIBIntegerField
      DisplayLabel = #1050#1072#1092#1077#1076#1088#1072
      FieldName = 'ID_DEP'
    end
    object LibUserDataSetUSERTYPE_ID: TFIBIntegerField
      DisplayLabel = #1055#1088#1072#1074#1072
      FieldName = 'USERTYPE_ID'
    end
    object LibUserDataSetusertype_search: TStringField
      DisplayLabel = #1055#1088#1072#1074#1072
      FieldKind = fkLookup
      FieldName = 'usertype_search'
      LookupDataSet = LibUserTypeDataSet
      LookupKeyFields = 'ID_USERTYPE'
      LookupResultField = 'USERTYPENAME'
      KeyFields = 'USERTYPE_ID'
      Lookup = True
    end
    object LibUserDataSetuserrole_search: TStringField
      FieldKind = fkLookup
      FieldName = 'userrole_search'
      LookupDataSet = LibUserTypeDataSet
      LookupKeyFields = 'ID_USERTYPE'
      LookupResultField = 'SQLROLE'
      KeyFields = 'USERTYPE_ID'
      Lookup = True
    end
  end
  object LibUserDS: TDataSource
    DataSet = LibUserDataSet
    Left = 256
    Top = 223
  end
  object LibUserWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 256
    Top = 127
  end
  object LibUserTypeDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE USERTYPE'
      'SET '
      '    USERTYPENAME = ?USERTYPENAME,'
      '    USERTYPEDESCR = ?USERTYPEDESCR,'
      '    SQLROLE = ?SQLROLE'
      'WHERE'
      '    ID_USERTYPE = ?OLD_ID_USERTYPE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    USERTYPE'
      'WHERE'
      '        ID_USERTYPE = ?OLD_ID_USERTYPE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO USERTYPE('
      '    ID_USERTYPE,'
      '    USERTYPENAME,'
      '    USERTYPEDESCR,'
      '    SQLROLE'
      ')'
      'VALUES('
      '    ?ID_USERTYPE,'
      '    ?USERTYPENAME,'
      '    ?USERTYPEDESCR,'
      '    ?SQLROLE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_USERTYPE,'
      '    USERTYPENAME,'
      '    USERTYPEDESCR,'
      '    SQLROLE'
      'FROM'
      '    USERTYPE '
      ''
      ' WHERE '
      '        USERTYPE.ID_USERTYPE = ?OLD_ID_USERTYPE'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_USERTYPE,'
      '    USERTYPENAME,'
      '    USERTYPEDESCR,'
      '    SQLROLE'
      'FROM'
      '    USERTYPE ')
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 464
    Top = 15
    oFetchAll = True
  end
  object LibUserTypeDS: TDataSource
    DataSet = LibUserTypeDataSet
    Left = 464
    Top = 63
  end
  object LibAskTypeDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE LIB_ASKTYPE'
      'SET '
      '    ASKTYPENAME = ?ASKTYPENAME,'
      '    ASKTYPEDESK = ?ASKTYPEDESK'
      'WHERE'
      '    ID_ASKTYPE = ?OLD_ID_ASKTYPE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    LIB_ASKTYPE'
      'WHERE'
      '        ID_ASKTYPE = ?OLD_ID_ASKTYPE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO LIB_ASKTYPE('
      '    ID_ASKTYPE,'
      '    ASKTYPENAME,'
      '    ASKTYPEDESK'
      ')'
      'VALUES('
      '    ?ID_ASKTYPE,'
      '    ?ASKTYPENAME,'
      '    ?ASKTYPEDESK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_ASKTYPE,'
      '    ASKTYPENAME,'
      '    ASKTYPEDESK'
      'FROM'
      '    LIB_ASKTYPE '
      ''
      ' WHERE '
      '        LIB_ASKTYPE.ID_ASKTYPE = ?OLD_ID_ASKTYPE'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_ASKTYPE,'
      '    ASKTYPENAME,'
      '    ASKTYPEDESK'
      'FROM'
      '    LIB_ASKTYPE ')
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 568
    Top = 15
    oFetchAll = True
  end
  object LibAskTypeDS: TDataSource
    DataSet = LibAskTypeDataSet
    Left = 568
    Top = 63
  end
  object AnswerWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 496
    Top = 127
  end
  object AnswerDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ANSWERS'
      'SET '
      '    ASK_ID = ?MAS_ID_ASK,'
      '    WEIGHT = ?WEIGHT,'
      '    EXPLANATION = ?EXPLANATION,'
      '    ANSWERTEXT1 = ?ANSWERTEXT1,'
      '    ANSWERIMAG = ?ANSWERIMAG'
      'WHERE'
      '    ID_ANSWER = ?OLD_ID_ANSWER'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ANSWERS'
      'WHERE'
      '        ID_ANSWER = ?OLD_ID_ANSWER'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ANSWERS('
      '    ID_ANSWER,'
      '    ASK_ID,'
      '    WEIGHT,'
      '    EXPLANATION,'
      '    ANSWERTEXT1,'
      '    ANSWERIMAG'
      ')'
      'VALUES('
      '    ?ID_ANSWER,'
      '    ?MAS_ID_ASK,'
      '    ?WEIGHT,'
      '    ?EXPLANATION,'
      '    ?ANSWERTEXT1,'
      '    ?ANSWERIMAG'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_ANSWER,'
      '    ASK_ID,'
      '    WEIGHT,'
      '    EXPLANATION,'
      '    ANSWERTEXT1,'
      '    ANSWERIMAG'
      'FROM'
      '    ANSWERS '
      'Where  ANSWERS.ID_ANSWER = ?OLD_ID_ANSWER'
      '     '
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_ANSWER,'
      '    ASK_ID,'
      '    WEIGHT,'
      '    EXPLANATION,'
      '    ANSWERTEXT1,'
      '    ANSWERIMAG'
      'FROM'
      '    ANSWERS '
      'Where'
      '    ASK_ID=?ID_ASK'
      'ORDER BY ID_ANSWER')
    AutoUpdateOptions.UpdateTableName = 'ANSWERS'
    AutoUpdateOptions.KeyFields = 'ID_ANSWER'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_ANSWERS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AfterDelete = AnswerDataSetAfterDelete
    AfterOpen = AnswerDataSetAfterOpen
    AfterPost = AnswerDataSetAfterPost
    BeforePost = AnswerDataSetBeforePost
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = AnswerWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = TestAskDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 496
    Top = 175
    poAskRecordCount = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    oProtectedEdit = True
    oFetchAll = True
    object AnswerDataSetID_ANSWER: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_ANSWER'
    end
    object AnswerDataSetASK_ID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1080#1090#1072#1085#1085#1103
      FieldName = 'ASK_ID'
    end
    object AnswerDataSetWEIGHT: TFIBIntegerField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1042#1072#1075#1072
      FieldName = 'WEIGHT'
      Required = True
      MaxValue = 12
    end
    object AnswerDataSetANSWERTEXT1: TFIBMemoField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1074#1110#1076#1087#1086#1074#1110#1076#1110
      FieldName = 'ANSWERTEXT1'
      Required = True
      BlobType = ftFmtMemo
      Size = 8
    end
    object AnswerDataSetANSWERIMAG: TFIBBlobField
      DisplayLabel = #1030#1083#1102#1089#1090#1088#1072#1094#1110#1103
      FieldName = 'ANSWERIMAG'
      Size = 8
    end
    object AnswerDataSetEXPLANATION: TFIBStringField
      FieldName = 'EXPLANATION'
      Size = 400
      EmptyStrToNull = True
    end
  end
  object AnswerDS: TDataSource
    DataSet = AnswerDataSet
    Left = 496
    Top = 223
  end
  object LUserpDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    USERID,'
      '    USERNAME,'
      '    USERPASS,'
      '    ID_DEP,'
      '    USERTYPE_ID'
      'FROM'
      '    USERS '
      'Where '
      '    (USERNAME=?FINDUSERNAME)')
    AllowedUpdateKinds = []
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 374
    Top = 15
    oFetchAll = True
    object LUserpDataSetUSERID: TFIBIntegerField
      FieldName = 'USERID'
    end
    object LUserpDataSetUSERNAME: TFIBStringField
      FieldName = 'USERNAME'
      Size = 30
      EmptyStrToNull = True
    end
    object LUserpDataSetUSERPASS: TFIBStringField
      FieldName = 'USERPASS'
      Size = 30
      EmptyStrToNull = True
    end
    object LUserpDataSetID_DEP: TFIBIntegerField
      FieldName = 'ID_DEP'
    end
    object LUserpDataSetUSERTYPE_ID: TFIBIntegerField
      FieldName = 'USERTYPE_ID'
    end
  end
  object LUserDS: TDataSource
    DataSet = LUserpDataSet
    Left = 374
    Top = 63
  end
  object FulLIbSciendDataSet: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_SC_LIB,'
      '    LIB_SC_NAME,'
      '    DEPID'
      'FROM'
      '    LIB_SCIENS '
      'WHERE '
      '    LIB_SCIENS.ID_SC_LIB = ?OLD_ID_SC_LIB')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SC_LIB,'
      '    LIB_SC_NAME,'
      '    DEPID'
      'FROM'
      '    LIB_SCIENS '
      '')
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 84
    Top = 15
    oFetchAll = True
  end
  object FulLibSciensDS: TDataSource
    DataSet = FulLIbSciendDataSet
    Left = 84
    Top = 63
  end
  object SubjectDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBJECTS'
      'SET '
      '    SUBJNAME = ?SUBJNAME,'
      '    FACULTY = ?FACULTY,'
      '    SEMESTR = ?SEMESTR,'
      '    EDUYEAR_ID = ?EDUYEAR_ID,'
      '    DEP_ID = ?MAS_DEPID'
      'WHERE'
      '    ID_SUBJ = ?OLD_ID_SUBJ'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBJECTS'
      'WHERE'
      '        ID_SUBJ = ?OLD_ID_SUBJ'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBJECTS('
      '    ID_SUBJ,'
      '    SUBJNAME,'
      '    FACULTY,'
      '    SEMESTR,'
      '    DEP_ID,'
      '    EDUYEAR_ID'
      ')'
      'VALUES('
      '    ?ID_SUBJ,'
      '    ?SUBJNAME,'
      '    ?FACULTY,'
      '    ?SEMESTR,'
      '    ?MAS_DEPID,'
      '    ?EDUYEAR_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_SUBJ,'
      '    SUBJNAME,'
      '    FACULTY,'
      '    SEMESTR,'
      '    DEP_ID,'
      '    EDUYEAR_ID'
      'FROM'
      '    SUBJECTS '
      'Where(  DEP_ID= ?DEPID'
      '     ) and (     SUBJECTS.ID_SUBJ = ?OLD_ID_SUBJ'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SUBJ,'
      '    SUBJNAME,'
      '    FACULTY,'
      '    SEMESTR,'
      '    DEP_ID,'
      '    EDUYEAR_ID'
      'FROM'
      '    SUBJECTS '
      'Where DEP_ID= ?DEPID')
    AutoUpdateOptions.UpdateTableName = 'SUBJECTS'
    AutoUpdateOptions.KeyFields = 'ID_SUBJ'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_SUBJECTS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterDelete = SubjectDataSetAfterDelete
    AfterPost = SubjectDataSetAfterPost
    BeforeDelete = SubjectDataSetBeforeDelete
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = SubjectWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = DepartDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 577
    Top = 177
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    object SubjectDataSetID_SUBJ: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SUBJ'
    end
    object SubjectDataSetSUBJNAME: TFIBStringField
      AutoGenerateValue = arDefault
      DefaultExpression = #39#1053#1086#1074#1080#1081' '#1087#1088#1077#1076#1084#1077#1090#39
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'SUBJNAME'
      Size = 100
      EmptyStrToNull = True
    end
    object SubjectDataSetFACULTY: TFIBStringField
      AutoGenerateValue = arDefault
      DefaultExpression = #39#1052#1077#1076#1080#1095#1085#1080#1081#39
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      FieldName = 'FACULTY'
      Size = 50
      EmptyStrToNull = True
    end
    object SubjectDataSetSEMESTR: TFIBIntegerField
      AutoGenerateValue = arDefault
      DefaultExpression = '1'
      DisplayLabel = #1057#1077#1084#1077#1089#1090#1088
      FieldName = 'SEMESTR'
      MaxValue = 20
      MinValue = 1
    end
    object SubjectDataSetDEP_ID: TFIBIntegerField
      DisplayLabel = #1050#1072#1092#1077#1076#1088#1072
      FieldName = 'DEP_ID'
      Visible = False
    end
    object SubjectDataSetEDUYEAR_ID: TFIBIntegerField
      DefaultExpression = '2005'
      DisplayLabel = #1053#1072#1074#1095'. '#1088#1110#1082'.'
      FieldName = 'EDUYEAR_ID'
      LookupDataSet = LYearsDataSet
      LookupKeyFields = 'ID_EDUYEAR'
      LookupResultField = 'EDUYEAR'
      Visible = False
    end
    object SubjectDataSeteduyear_serach: TStringField
      DisplayLabel = #1053#1072#1074#1095'. '#1088#1110#1082'.'
      FieldKind = fkLookup
      FieldName = 'eduyear_serach'
      LookupDataSet = LYearsDataSet
      LookupKeyFields = 'ID_EDUYEAR'
      LookupResultField = 'EDUYEAR'
      KeyFields = 'EDUYEAR_ID'
      Size = 10
      Lookup = True
    end
  end
  object SubjectWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 577
    Top = 129
  end
  object SubjectDS: TDataSource
    DataSet = SubjectDataSet
    Left = 577
    Top = 225
  end
  object SubjTestDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TESTONSUBJ'
      'SET '
      '    SUBJ_ID = ?MAS_ID_SUBJ,'
      '    USER_ID = ?USER_ID,'
      '    TESTNAME = ?TESTNAME,'
      '    ASKCOUNT = ?ASKCOUNT,'
      '    TESTTIME = ?TESTTIME,'
      '    TESTDESCR = ?TESTDESCR,'
      '    CREATEDATE = ?CREATEDATE,'
      '    LANG_ID = ?LANG_ID'
      'WHERE'
      '    ID_SUBJTEST = ?OLD_ID_SUBJTEST'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TESTONSUBJ'
      'WHERE'
      '        ID_SUBJTEST = ?OLD_ID_SUBJTEST'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TESTONSUBJ('
      '    ID_SUBJTEST,'
      '    SUBJ_ID,'
      '    USER_ID,'
      '    TESTNAME,'
      '    ASKCOUNT,'
      '    TESTTIME,'
      '    TESTDESCR,'
      '    CREATEDATE,'
      '    LANG_ID'
      ')'
      'VALUES('
      '    ?ID_SUBJTEST,'
      '    ?MAS_ID_SUBJ,'
      '    ?USER_ID,'
      '    ?TESTNAME,'
      '    ?ASKCOUNT,'
      '    ?TESTTIME,'
      '    ?TESTDESCR,'
      '    ?CREATEDATE,'
      '    ?LANG_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_SUBJTEST,'
      '    SUBJ_ID,'
      '    USER_ID,'
      '    TESTNAME,'
      '    ASKCOUNT,'
      '    TESTTIME,'
      '    TESTDESCR,'
      '    CREATEDATE,'
      '    LANG_ID'
      'FROM'
      '    TESTONSUBJ '
      'Where(  SUBJ_ID= ?ID_SUBJ'
      '     ) and (     TESTONSUBJ.ID_SUBJTEST = ?OLD_ID_SUBJTEST'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SUBJTEST,'
      '    SUBJ_ID,'
      '    USER_ID,'
      '    TESTNAME,'
      '    ASKCOUNT,'
      '    TESTTIME,'
      '    TESTDESCR,'
      '    CREATEDATE,'
      '    LANG_ID'
      'FROM'
      '    TESTONSUBJ '
      'Where SUBJ_ID= ?ID_SUBJ'
      'ORDER BY ID_SUBJTEST')
    AutoUpdateOptions.UpdateTableName = 'TESTONSUBJ'
    AutoUpdateOptions.KeyFields = 'ID_SUBJTEST'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_TESTONSUBJ_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterDelete = SubjTestDataSetAfterDelete
    AfterPost = SubjTestDataSetAfterPost
    BeforeDelete = SubjTestDataSetBeforeDelete
    OnNewRecord = SubjTestDataSetNewRecord
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = SubjTestWriteTr
    AutoCommit = True
    OnEndScroll = SubjTestDataSetEndScroll
    SQLScreenCursor = crSQLWait
    DataSource = SubjectDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 9
    Top = 337
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    object SubjTestDataSetID_SUBJTEST: TFIBIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SUBJTEST'
    end
    object SubjTestDataSetSUBJ_ID: TFIBIntegerField
      DisplayLabel = #1055#1077#1088#1076#1084#1077#1090
      FieldName = 'SUBJ_ID'
    end
    object SubjTestDataSetUSER_ID: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1050#1086#1076' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
      FieldName = 'USER_ID'
    end
    object SubjTestDataSetTESTNAME: TFIBStringField
      DefaultExpression = #39#1053#1086#1074#1080#1081' '#1090#1077#1089#1090#39
      DisplayLabel = #1053#1072#1079#1074#1072' '#1090#1077#1089#1090#1091
      FieldName = 'TESTNAME'
      Size = 100
      EmptyStrToNull = True
    end
    object SubjTestDataSetASKCOUNT: TFIBIntegerField
      DefaultExpression = '10'
      DisplayLabel = #1050#1110#1083#1100#1082'.'#1087#1080#1090#1072#1085#1100
      FieldName = 'ASKCOUNT'
    end
    object SubjTestDataSetTESTTIME: TFIBIntegerField
      DefaultExpression = '168'
      DisplayLabel = #1055#1080#1090'. /'#1089#1090#1088'.'
      FieldName = 'TESTTIME'
    end
    object SubjTestDataSetTESTDESCR: TFIBStringField
      DisplayLabel = #1054#1087#1080#1089
      FieldName = 'TESTDESCR'
      Size = 200
      EmptyStrToNull = True
    end
    object SubjTestDataSetCREATEDATE: TFIBDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088'.'
      FieldName = 'CREATEDATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object SubjTestDataSetLANG_ID: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1052#1086#1074#1072'('#1082#1086#1076')'
      FieldName = 'LANG_ID'
      Visible = False
    end
    object SubjTestDataSetlanng_search: TStringField
      DisplayLabel = #1052#1086#1074#1072
      FieldKind = fkLookup
      FieldName = 'lanng_search'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'LANG_NAME'
      KeyFields = 'LANG_ID'
      Size = 15
      Lookup = True
    end
    object SubjTestDataSetuser_name_search: TStringField
      DisplayLabel = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
      FieldKind = fkLookup
      FieldName = 'user_name_search'
      LookupDataSet = LibUserDataSet
      LookupKeyFields = 'USERID'
      LookupResultField = 'LASTNAME'
      KeyFields = 'USER_ID'
      Lookup = True
    end
    object SubjTestDataSetperson_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'person_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'PERSON_TIT'
      KeyFields = 'LANG_ID'
      Size = 100
      Lookup = True
    end
    object SubjTestDataSetsign_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'sign_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'SIGN_TIT'
      KeyFields = 'LANG_ID'
      Size = 30
      Lookup = True
    end
    object SubjTestDataSetgroup_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'group_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'GROUP_TIT'
      KeyFields = 'LANG_ID'
      Size = 30
      Lookup = True
    end
    object SubjTestDataSetspec_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'spec_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'SPEC_TIT'
      KeyFields = 'LANG_ID'
      Size = 100
      Lookup = True
    end
    object SubjTestDataSetsubj_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'subj_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'SUBJ_TIT'
      KeyFields = 'LANG_ID'
      Size = 50
      Lookup = True
    end
    object SubjTestDataSetfaculty_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'faculty_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'FACULTY_TIT'
      KeyFields = 'LANG_ID'
      Size = 50
      Lookup = True
    end
    object SubjTestDataSetsemestr_tit_srch: TStringField
      FieldKind = fkLookup
      FieldName = 'semestr_tit_srch'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'SEMESTR_TIT'
      KeyFields = 'LANG_ID'
      Size = 30
      Lookup = True
    end
  end
  object SubjTestWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 9
    Top = 289
  end
  object SubjTestDS: TDataSource
    DataSet = SubjTestDataSet
    Left = 9
    Top = 385
  end
  object TestModDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TESTSECTIONS'
      'SET '
      ' SUBJTEST_ID = ?MAS_ID_SUBJTEST,'
      ' SECT_TITLE = ?SECT_TITLE,'
      ' SECT_DESCR = ?SECT_DESCR,'
      ' ASKS_TOTAL = ?ASKS_TOTAL,'
      ' SHOW = ?SHOW,'
      ' ORD_NUM = ?ORD_NUM'
      'WHERE'
      ' ID_TESTSECTION = ?OLD_ID_TESTSECTION'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TESTSECTIONS'
      'WHERE'
      '  ID_TESTSECTION = ?OLD_ID_TESTSECTION'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TESTSECTIONS('
      ' ID_TESTSECTION,'
      ' SUBJTEST_ID,'
      ' SECT_TITLE,'
      ' SECT_DESCR,'
      ' ASKS_TOTAL,'
      ' SHOW,'
      ' ORD_NUM'
      ')'
      'VALUES('
      ' ?ID_TESTSECTION,'
      ' ?MAS_ID_SUBJTEST,'
      ' ?SECT_TITLE,'
      ' ?SECT_DESCR,'
      ' ?ASKS_TOTAL,'
      ' ?SHOW,'
      ' ?ORD_NUM'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID_TESTSECTION,'
      ' SUBJTEST_ID,'
      ' SECT_TITLE,'
      ' SECT_DESCR,'
      ' ASKS_TOTAL,'
      ' SHOW,'
      ' ORD_NUM'
      'FROM'
      ' TESTSECTIONS '
      'where(  SUBJTEST_ID= ?ID_SUBJTEST'
      '  ) and (  TESTSECTIONS.ID_TESTSECTION = ?OLD_ID_TESTSECTION'
      '  )'
      'order by ORD_NUM ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID_TESTSECTION,'
      ' SUBJTEST_ID,'
      ' SECT_TITLE,'
      ' SECT_DESCR,'
      ' ASKS_TOTAL,'
      ' SHOW,'
      ' ORD_NUM'
      'FROM'
      ' TESTSECTIONS '
      'where SUBJTEST_ID= ?ID_SUBJTEST'
      'order by ORD_NUM')
    AutoUpdateOptions.UpdateTableName = 'TESTSECTIONS'
    AutoUpdateOptions.KeyFields = 'ID_TESTSECTION'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_TESTSECTIONS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterDelete = TestModDataSetAfterDelete
    AfterOpen = TestModDataSetAfterOpen
    AfterPost = TestModDataSetAfterPost
    AfterScroll = TestModDataSetAfterScroll
    BeforePost = TestModDataSetBeforePost
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = TestModWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = SubjTestDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 89
    Top = 335
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    oVisibleRecno = True
    object TestModDataSetID_TESTSECTION: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_TESTSECTION'
    end
    object TestModDataSetSECT_TITLE: TFIBStringField
      DefaultExpression = #39#1053#1086#1074#1080#1081' '#1088#1086#1079#1076#1110#1083#39
      DisplayLabel = #1053#1072#1079#1074#1072' '#1088#1086#1079#1076#1110#1083#1091' '#1073#1110#1083#1077#1090#1091
      FieldName = 'SECT_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object TestModDataSetSECT_DESCR: TFIBStringField
      DisplayLabel = #1055#1088#1080#1084#1110#1090#1082#1080
      FieldName = 'SECT_DESCR'
      Size = 100
      EmptyStrToNull = True
    end
    object TestModDataSetASKS_TOTAL: TFIBIntegerField
      DefaultExpression = '24'
      DisplayLabel = #1055#1080#1090#1072#1085#1100
      FieldName = 'ASKS_TOTAL'
    end
    object TestModDataSetSHOW: TFIBSmallIntField
      DefaultExpression = '1'
      DisplayLabel = #1055#1086#1082#1072#1079'.'
      FieldName = 'SHOW'
    end
    object TestModDataSetSUBJTEST_ID: TFIBIntegerField
      FieldName = 'SUBJTEST_ID'
    end
    object TestModDataSetORD_NUM: TFIBIntegerField
      DisplayLabel = #8470
      FieldName = 'ORD_NUM'
    end
  end
  object TestModWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 89
    Top = 289
  end
  object TestModDS: TDataSource
    DataSet = TestModDataSet
    Left = 89
    Top = 385
  end
  object FullSciensDS: TDataSource
    DataSet = FullSciensDataSet
    Left = 281
    Top = 63
  end
  object FullSciensDataSet: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_SCIENS,'
      '    SC_NAME,'
      '    SC_DESCR,'
      '    DEP_ID,'
      '    LIB_SC_ID,'
      '    ID_LANG,'
      '    SEMESTR,'
      '    ASK_COUNT'
      'FROM'
      '    SCIENS '
      ''
      ' WHERE '
      '        SCIENS.ID_SCIENS = ?OLD_ID_SCIENS'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID_SCIENS,'
      ' SC_NAME,'
      ' SC_DESCR,'
      ' DEP_ID,'
      ' LIB_SC_ID,'
      ' ID_LANG,'
      ' SEMESTR,'
      ' ASK_COUNT'
      'FROM'
      ' SCIENS '
      'order by  ID_SCIENS')
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 281
    Top = 15
    poAskRecordCount = True
    oFetchAll = True
    object FullSciensDataSetID_SCIENS: TFIBIntegerField
      FieldName = 'ID_SCIENS'
      Visible = False
    end
    object FullSciensDataSetSC_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1084#1086#1076#1091#1083#1103' ('#1085#1072#1091#1082'. '#1085#1072#1087#1088'.)'
      FieldName = 'SC_NAME'
      Size = 200
      EmptyStrToNull = True
    end
    object FullSciensDataSetSC_DESCR: TFIBStringField
      DisplayLabel = #1054#1087#1080#1089
      FieldName = 'SC_DESCR'
      Size = 100
      EmptyStrToNull = True
    end
    object FullSciensDataSetDEP_ID: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'DEP_ID'
      Visible = False
    end
    object FullSciensDataSetLIB_SC_ID: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'LIB_SC_ID'
      Visible = False
    end
    object FullSciensDataSetID_LANG: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_LANG'
      Visible = False
    end
    object FullSciensDataSet_dep_search: TStringField
      DisplayLabel = #1050#1072#1092#1077#1076#1088#1072
      FieldKind = fkLookup
      FieldName = 'dep_search'
      LookupDataSet = FullDepDataSet
      LookupKeyFields = 'DEPID'
      LookupResultField = 'DEPNAME'
      KeyFields = 'DEP_ID'
      Size = 100
      Lookup = True
    end
    object FullSciensDataSetlanng_search: TStringField
      DisplayLabel = #1052#1086#1074#1072
      FieldKind = fkLookup
      FieldName = 'lanng_search'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'LANG_NAME'
      KeyFields = 'ID_LANG'
      Lookup = True
    end
    object FullSciensDataSetSEMESTR: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1057#1077#1084'.'
      FieldName = 'SEMESTR'
    end
    object FullSciensDataSetASK_COUNT: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1055#1080#1090#1072#1085#1100
      FieldName = 'ASK_COUNT'
    end
  end
  object OffPapersDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OFFLINE_EXAM'
      'SET '
      '    TESTONSUBJ_ID = ?MAS_ID_SUBJTEST,'
      '    EXAM_DATE = ?EXAM_DATE,'
      '    VAR_NAME = ?VAR_NAME'
      'WHERE'
      '    ID_OFFEXAM = ?OLD_ID_OFFEXAM'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OFFLINE_EXAM'
      'WHERE'
      '        ID_OFFEXAM = ?OLD_ID_OFFEXAM'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OFFLINE_EXAM('
      '    ID_OFFEXAM,'
      '    TESTONSUBJ_ID,'
      '    EXAM_DATE,'
      '    VAR_NAME'
      ')'
      'VALUES('
      '    ?ID_OFFEXAM,'
      '    ?MAS_ID_SUBJTEST,'
      '    ?EXAM_DATE,'
      '    ?VAR_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_OFFEXAM,'
      '    TESTONSUBJ_ID,'
      '    EXAM_DATE,'
      '    VAR_NAME'
      'FROM'
      '    OFFLINE_EXAM '
      ''
      ' WHERE '
      '        OFFLINE_EXAM.ID_OFFEXAM = ?OLD_ID_OFFEXAM'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_OFFEXAM,'
      '    TESTONSUBJ_ID,'
      '    EXAM_DATE,'
      '    VAR_NAME'
      'FROM'
      '    OFFLINE_EXAM '
      'Where TESTONSUBJ_ID= ?ID_SUBJTEST'
      'ORDER BY ID_OFFEXAM')
    AutoUpdateOptions.UpdateTableName = 'OFFLINE_EXAM'
    AutoUpdateOptions.KeyFields = 'ID_OFFEXAM'
    AutoUpdateOptions.GeneratorName = 'GEN_OFFLINE_EXAM_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    AfterDelete = OffPapersDataSetAfterDelete
    AfterOpen = OffPapersDataSetAfterOpen
    AfterPost = OffPapersDataSetAfterPost
    AfterScroll = OffPapersDataSetAfterScroll
    BeforeDelete = OffPapersDataSetBeforeDelete
    AfterRefresh = OffPapersDataSetAfterRefresh
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = OffPapersWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = SubjTestDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 273
    Top = 337
    poSetReadOnlyFields = True
    poAskRecordCount = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    object OffPapersDataSetID_OFFEXAM: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_OFFEXAM'
    end
    object OffPapersDataSetTESTONSUBJ_ID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1077#1089#1090#1091
      FieldName = 'TESTONSUBJ_ID'
    end
    object OffPapersDataSetVAR_NAME: TFIBStringField
      DefaultExpression = #39#1085#1086#1074#1080#1081' '#1074#1072#1088#1110#1072#1085#1090#39
      DisplayLabel = #1053#1072#1079#1074#1072' '#1074#1072#1088#1110#1072#1085#1090#1091
      FieldName = 'VAR_NAME'
      EmptyStrToNull = True
    end
    object OffPapersDataSetEXAM_DATE: TFIBDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103
      FieldName = 'EXAM_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
  end
  object OffPapersWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 273
    Top = 289
  end
  object OffPapersDS: TDataSource
    DataSet = OffPapersDataSet
    Left = 273
    Top = 385
  end
  object OffAsksDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OFFLINE_ASKSLIST'
      'SET '
      '    OFFEXAM_ID = ?MAS_ID_OFFEXAM,'
      '    ASK_ID = ?ASK_ID,'
      '    SCIENS_ID = ?SCIENS_ID,'
      '    RIGHTORDER = ?RIGHTORDER,'
      '    TESTSECT_ID = ?TESTSECT_ID'
      'WHERE'
      '    ID_OFFASKS = ?OLD_ID_OFFASKS'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OFFLINE_ASKSLIST'
      'WHERE'
      '        ID_OFFASKS = ?OLD_ID_OFFASKS'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OFFLINE_ASKSLIST('
      '    ID_OFFASKS,'
      '    OFFEXAM_ID,'
      '    ASK_ID,'
      '    SCIENS_ID,'
      '    RIGHTORDER,'
      '    TESTSECT_ID'
      ')'
      'VALUES('
      '    ?ID_OFFASKS,'
      '    ?MAS_ID_OFFEXAM,'
      '    ?ASK_ID,'
      '    ?SCIENS_ID,'
      '    ?RIGHTORDER,'
      '    ?TESTSECT_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_OFFASKS,'
      '    OFFEXAM_ID,'
      '    ASK_ID,'
      '    SCIENS_ID,'
      '    RIGHTORDER,'
      '    TESTSECT_ID'
      'FROM'
      '    OFFLINE_ASKSLIST '
      'Where(  OFFEXAM_ID= ?ID_OFFEXAM'
      '     ) and (     OFFLINE_ASKSLIST.ID_OFFASKS = ?OLD_ID_OFFASKS'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_OFFASKS,'
      '    OFFEXAM_ID,'
      '    ASK_ID,'
      '    SCIENS_ID,'
      '    RIGHTORDER,'
      '    TESTSECT_ID'
      'FROM'
      '    OFFLINE_ASKSLIST '
      'Where OFFEXAM_ID= ?ID_OFFEXAM'
      'order by ID_OFFASKS')
    AutoUpdateOptions.UpdateTableName = 'OFFLINE_ASKSLIST'
    AutoUpdateOptions.KeyFields = 'ID_OFFASKS'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_OFFLINE_ASKSLIST_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = OffAsksWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = OffPapersDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 361
    Top = 337
    poAskRecordCount = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    object OffAsksDataSetID_OFFASKS: TFIBIntegerField
      FieldName = 'ID_OFFASKS'
    end
    object OffAsksDataSetOFFEXAM_ID: TFIBIntegerField
      FieldName = 'OFFEXAM_ID'
    end
    object OffAsksDataSetASK_ID: TFIBIntegerField
      FieldName = 'ASK_ID'
    end
    object OffAsksDataSetSCIENS_ID: TFIBIntegerField
      FieldName = 'SCIENS_ID'
    end
    object OffAsksDataSetRIGHTORDER: TFIBStringField
      DefaultExpression = #39'0'#39
      FieldName = 'RIGHTORDER'
      Size = 100
      EmptyStrToNull = True
    end
    object OffAsksDataSetTESTSECT_ID: TFIBIntegerField
      FieldName = 'TESTSECT_ID'
    end
  end
  object OffAsksWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 361
    Top = 289
  end
  object OffAsksDS: TDataSource
    DataSet = OffAsksDataSet
    Left = 361
    Top = 385
  end
  object OffAskTextDataSet: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    ASKTEXT2,'
      '    ASKIMAGE,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    ARCHIVE'
      'FROM'
      '    TESTASKS '
      'Where(  ID_ASK=?ASK_ID'
      '     ) and (     TESTASKS.ID_ASK = ?OLD_ID_ASK'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    ASKTEXT2,'
      '    ASKIMAGE,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    ARCHIVE'
      'FROM'
      '    TESTASKS '
      'Where ID_ASK=?ASK_ID')
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    DataSource = OffAsksDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 449
    Top = 337
    dcForceMasterRefresh = True
    dcForceOpen = True
    object OffAskTextDataSetID_ASK: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1080#1090#1072#1085#1085#1103
      FieldName = 'ID_ASK'
    end
    object OffAskTextDataSetSCIENS_ID: TFIBIntegerField
      DisplayLabel = #1053#1072#1091#1082'.'#1085#1072#1087#1088'.'
      FieldName = 'SCIENS_ID'
      Visible = False
    end
    object OffAskTextDataSetASKTEXT2: TFIBMemoField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'ASKTEXT2'
      BlobType = ftMemo
      Size = 8
    end
    object OffAskTextDataSetASKIMAGE: TFIBBlobField
      DisplayLabel = #1030#1083#1102#1089#1090#1088#1072#1094#1110#1103
      FieldName = 'ASKIMAGE'
      Visible = False
      Size = 8
    end
    object OffAskTextDataSetID_ASKTYPE: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1058#1080#1087' '#1087#1080#1090#1072#1085#1085#1103
      FieldName = 'ID_ASKTYPE'
      Visible = False
    end
    object OffAskTextDataSetANSWCOUNT: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1050#1110#1083#1100#1082'. '#1074#1110#1076#1087'.'
      FieldName = 'ANSWCOUNT'
    end
    object OffAskTextDataSetARCHIVE: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1040#1088#1093#1110#1074
      FieldName = 'ARCHIVE'
    end
  end
  object OffAskTextDS: TDataSource
    DataSet = OffAskTextDataSet
    Left = 449
    Top = 385
  end
  object RedyPaperMemTable: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = 1
    FieldDefs = <
      item
        Name = 'RecPrefix'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Recprefix2'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'RecData'
        DataType = ftFmtMemo
      end
      item
        Name = 'ASK_ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_ASKLIST'
        DataType = ftInteger
      end
      item
        Name = 'SCIENS_ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_OFFEXAM'
        DataType = ftInteger
      end
      item
        Name = 'ANSWER_ID'
        DataType = ftInteger
      end
      item
        Name = 'TestModTitle'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Weight'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RedyPaperPrimary'
        Fields = 'IDRec'
        Options = [ixPrimary]
      end>
    RecalcOnIndex = True
    SortFields = 'ID_ASKLIST;IDRec'
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '3.07'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforePost = RedyPaperMemTableBeforePost
    Left = 273
    Top = 441
    object RedyPaperMemTableIDRec: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldKind = fkCalculated
      FieldName = 'IDRec'
      Visible = False
      Calculated = True
    end
    object RedyPaperMemTableRecPrefix: TStringField
      DisplayLabel = #1055#1088#1077#1092#1110#1082#1089
      DisplayWidth = 4
      FieldName = 'RecPrefix'
      Size = 4
    end
    object RedyPaperMemTableRecprefix2: TStringField
      DisplayLabel = #1055#1088#1077#1092#1110#1082#1089'2'
      FieldName = 'Recprefix2'
      Size = 4
    end
    object RedyPaperMemTableRecData: TBlobField
      DisplayLabel = #1044#1072#1085#1110
      FieldName = 'RecData'
      BlobType = ftFmtMemo
    end
    object RedyPaperMemTableASK_ID: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1080#1090'.'
      FieldName = 'ASK_ID'
    end
    object RedyPaperMemTableID_ASKLIST2: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1084#1086#1076#1091#1083#1103' '#1074' '#1090#1077#1089#1090#1110
      FieldName = 'ID_ASKLIST'
      Visible = False
    end
    object RedyPaperMemTableID_ASKLIST: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1084#1086#1076#1091#1083#1103
      FieldName = 'SCIENS_ID'
    end
    object RedyPaperMemTableID_OFFEXAM: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1088#1110#1072#1085#1090#1091
      FieldName = 'ID_OFFEXAM'
      Visible = False
    end
    object RedyPaperMemTableANSWER_ID: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1074#1110#1076#1087'.'
      FieldName = 'ANSWER_ID'
    end
    object RedyPaperMemTableTestModTitle: TStringField
      FieldName = 'TestModTitle'
      Visible = False
      Size = 200
    end
    object RedyPaperMemTableWeight: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1042#1072#1075#1072' '#1074#1110#1076#1087#1086#1074#1110#1076#1110
      FieldName = 'Weight'
      Visible = False
    end
    object RedyPaperMemTableAsk_Number_on_Paper: TStringField
      FieldName = 'Ask_Num_on_Paper'
      Size = 4
    end
  end
  object RedyPaperDS: TDataSource
    DataSet = RedyPaperMemTable
    Left = 361
    Top = 433
  end
  object OffAnswTextDataSet: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_ANSWER,'
      '    ASK_ID,'
      '    WEIGHT,'
      '    ANSWERTEXT1,'
      '    ANSWERIMAG'
      'FROM'
      '    ANSWERS '
      'Where(  ASK_ID=?ID_ASK'
      '     ) and (     ANSWERS.ID_ANSWER = ?OLD_ID_ANSWER'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_ANSWER,'
      '    ASK_ID,'
      '    WEIGHT,'
      '    ANSWERTEXT1,'
      '    ANSWERIMAG'
      'FROM'
      '    ANSWERS '
      'Where ASK_ID=?ID_ASK'
      'ORDER BY WEIGHT')
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    DataSource = OffAskTextDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 553
    Top = 337
    dcForceMasterRefresh = True
    dcForceOpen = True
    object OffAnswTextDataSetID_ANSWER: TFIBIntegerField
      FieldName = 'ID_ANSWER'
    end
    object OffAnswTextDataSetASK_ID: TFIBIntegerField
      FieldName = 'ASK_ID'
    end
    object OffAnswTextDataSetWEIGHT: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'WEIGHT'
    end
    object OffAnswTextDataSetANSWERTEXT1: TFIBMemoField
      FieldName = 'ANSWERTEXT1'
      BlobType = ftFmtMemo
      Size = 8
    end
    object OffAnswTextDataSetANSWERIMAG: TFIBBlobField
      FieldName = 'ANSWERIMAG'
      Size = 8
    end
  end
  object OffAnswDS: TDataSource
    DataSet = OffAnswTextDataSet
    Left = 553
    Top = 385
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 585
    Top = 449
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 681
    Top = 449
  end
  object AnsEtalonADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Etalon.mdb;Mode=Rea' +
      'dWrite;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 33
    Top = 441
  end
  object AnsEtalonADOTable: TADOTable
    Connection = AnsEtalonADOConnection
    CursorType = ctStatic
    TableName = 'Etalon'
    Left = 113
    Top = 433
    object AnsEtalonADOTableDSDesigner: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object AnsEtalonADOTableStorinka: TFloatField
      FieldName = 'Storinka'
    end
    object AnsEtalonADOTableVariant: TFloatField
      FieldName = 'Variant'
    end
    object AnsEtalonADOTablep1: TFloatField
      FieldName = 'p1'
    end
    object AnsEtalonADOTablep2: TFloatField
      FieldName = 'p2'
    end
    object AnsEtalonADOTablep3: TFloatField
      FieldName = 'p3'
    end
    object AnsEtalonADOTablep4: TFloatField
      FieldName = 'p4'
    end
    object AnsEtalonADOTablep5: TFloatField
      FieldName = 'p5'
    end
    object AnsEtalonADOTablep6: TFloatField
      FieldName = 'p6'
    end
    object AnsEtalonADOTablep7: TFloatField
      FieldName = 'p7'
    end
    object AnsEtalonADOTablep8: TFloatField
      FieldName = 'p8'
    end
    object AnsEtalonADOTablep9: TFloatField
      FieldName = 'p9'
    end
    object AnsEtalonADOTablep10: TFloatField
      FieldName = 'p10'
    end
    object AnsEtalonADOTablep11: TFloatField
      FieldName = 'p11'
    end
    object AnsEtalonADOTablep12: TFloatField
      FieldName = 'p12'
    end
    object AnsEtalonADOTablep13: TFloatField
      FieldName = 'p13'
    end
    object AnsEtalonADOTablep14: TFloatField
      FieldName = 'p14'
    end
    object AnsEtalonADOTablep15: TFloatField
      FieldName = 'p15'
    end
    object AnsEtalonADOTablep16: TFloatField
      FieldName = 'p16'
    end
    object AnsEtalonADOTablep17: TFloatField
      FieldName = 'p17'
    end
    object AnsEtalonADOTablep18: TFloatField
      FieldName = 'p18'
    end
    object AnsEtalonADOTablep19: TFloatField
      FieldName = 'p19'
    end
    object AnsEtalonADOTablep20: TFloatField
      FieldName = 'p20'
    end
    object AnsEtalonADOTablep21: TFloatField
      FieldName = 'p21'
    end
    object AnsEtalonADOTablep22: TFloatField
      FieldName = 'p22'
    end
    object AnsEtalonADOTablep23: TFloatField
      FieldName = 'p23'
    end
    object AnsEtalonADOTablep24: TFloatField
      FieldName = 'p24'
    end
    object AnsEtalonADOTablep25: TFloatField
      FieldName = 'p25'
    end
    object AnsEtalonADOTablep26: TFloatField
      FieldName = 'p26'
    end
    object AnsEtalonADOTablep27: TFloatField
      FieldName = 'p27'
    end
    object AnsEtalonADOTablep28: TFloatField
      FieldName = 'p28'
    end
    object AnsEtalonADOTablep29: TFloatField
      FieldName = 'p29'
    end
    object AnsEtalonADOTablep30: TFloatField
      FieldName = 'p30'
    end
    object AnsEtalonADOTablep31: TFloatField
      FieldName = 'p31'
    end
    object AnsEtalonADOTablep32: TFloatField
      FieldName = 'p32'
    end
    object AnsEtalonADOTablep33: TFloatField
      FieldName = 'p33'
    end
    object AnsEtalonADOTablep34: TFloatField
      FieldName = 'p34'
    end
    object AnsEtalonADOTablep35: TFloatField
      FieldName = 'p35'
    end
    object AnsEtalonADOTablep36: TFloatField
      FieldName = 'p36'
    end
    object AnsEtalonADOTablep37: TFloatField
      FieldName = 'p37'
    end
    object AnsEtalonADOTablep38: TFloatField
      FieldName = 'p38'
    end
    object AnsEtalonADOTablep39: TFloatField
      FieldName = 'p39'
    end
    object AnsEtalonADOTablep40: TFloatField
      FieldName = 'p40'
    end
    object AnsEtalonADOTablep41: TFloatField
      FieldName = 'p41'
    end
    object AnsEtalonADOTablep42: TFloatField
      FieldName = 'p42'
    end
    object AnsEtalonADOTablep43: TFloatField
      FieldName = 'p43'
    end
    object AnsEtalonADOTablep44: TFloatField
      FieldName = 'p44'
    end
    object AnsEtalonADOTablep45: TFloatField
      FieldName = 'p45'
    end
    object AnsEtalonADOTablep46: TFloatField
      FieldName = 'p46'
    end
    object AnsEtalonADOTablep47: TFloatField
      FieldName = 'p47'
    end
    object AnsEtalonADOTablep48: TFloatField
      FieldName = 'p48'
    end
    object AnsEtalonADOTablep49: TFloatField
      FieldName = 'p49'
    end
    object AnsEtalonADOTablep50: TFloatField
      FieldName = 'p50'
    end
    object AnsEtalonADOTablep51: TFloatField
      FieldName = 'p51'
    end
    object AnsEtalonADOTablep52: TFloatField
      FieldName = 'p52'
    end
    object AnsEtalonADOTablep53: TFloatField
      FieldName = 'p53'
    end
    object AnsEtalonADOTablep54: TFloatField
      FieldName = 'p54'
    end
    object AnsEtalonADOTablep55: TFloatField
      FieldName = 'p55'
    end
    object AnsEtalonADOTablep56: TFloatField
      FieldName = 'p56'
    end
    object AnsEtalonADOTablep57: TFloatField
      FieldName = 'p57'
    end
    object AnsEtalonADOTablep58: TFloatField
      FieldName = 'p58'
    end
    object AnsEtalonADOTablep59: TFloatField
      FieldName = 'p59'
    end
    object AnsEtalonADOTablep60: TFloatField
      FieldName = 'p60'
    end
    object AnsEtalonADOTablep61: TFloatField
      FieldName = 'p61'
    end
    object AnsEtalonADOTablep62: TFloatField
      FieldName = 'p62'
    end
    object AnsEtalonADOTablep63: TFloatField
      FieldName = 'p63'
    end
    object AnsEtalonADOTablep64: TFloatField
      FieldName = 'p64'
    end
    object AnsEtalonADOTablep65: TFloatField
      FieldName = 'p65'
    end
    object AnsEtalonADOTablep66: TFloatField
      FieldName = 'p66'
    end
    object AnsEtalonADOTablep67: TFloatField
      FieldName = 'p67'
    end
    object AnsEtalonADOTablep68: TFloatField
      FieldName = 'p68'
    end
    object AnsEtalonADOTablep69: TFloatField
      FieldName = 'p69'
    end
    object AnsEtalonADOTablep70: TFloatField
      FieldName = 'p70'
    end
    object AnsEtalonADOTablep71: TFloatField
      FieldName = 'p71'
    end
    object AnsEtalonADOTablep72: TFloatField
      FieldName = 'p72'
    end
    object AnsEtalonADOTablep73: TFloatField
      FieldName = 'p73'
    end
    object AnsEtalonADOTablep74: TFloatField
      FieldName = 'p74'
    end
    object AnsEtalonADOTablep75: TFloatField
      FieldName = 'p75'
    end
    object AnsEtalonADOTablep76: TFloatField
      FieldName = 'p76'
    end
    object AnsEtalonADOTablep77: TFloatField
      FieldName = 'p77'
    end
    object AnsEtalonADOTablep78: TFloatField
      FieldName = 'p78'
    end
    object AnsEtalonADOTablep79: TFloatField
      FieldName = 'p79'
    end
    object AnsEtalonADOTablep80: TFloatField
      FieldName = 'p80'
    end
    object AnsEtalonADOTablep81: TFloatField
      FieldName = 'p81'
    end
    object AnsEtalonADOTablep82: TFloatField
      FieldName = 'p82'
    end
    object AnsEtalonADOTablep83: TFloatField
      FieldName = 'p83'
    end
    object AnsEtalonADOTablep84: TFloatField
      FieldName = 'p84'
    end
    object AnsEtalonADOTablep85: TFloatField
      FieldName = 'p85'
    end
    object AnsEtalonADOTablep86: TFloatField
      FieldName = 'p86'
    end
    object AnsEtalonADOTablep87: TFloatField
      FieldName = 'p87'
    end
    object AnsEtalonADOTablep88: TFloatField
      FieldName = 'p88'
    end
    object AnsEtalonADOTablep89: TFloatField
      FieldName = 'p89'
    end
    object AnsEtalonADOTablep90: TFloatField
      FieldName = 'p90'
    end
    object AnsEtalonADOTablep91: TFloatField
      FieldName = 'p91'
    end
    object AnsEtalonADOTablep92: TFloatField
      FieldName = 'p92'
    end
    object AnsEtalonADOTablep93: TFloatField
      FieldName = 'p93'
    end
    object AnsEtalonADOTablep94: TFloatField
      FieldName = 'p94'
    end
    object AnsEtalonADOTablep95: TFloatField
      FieldName = 'p95'
    end
    object AnsEtalonADOTablep96: TFloatField
      FieldName = 'p96'
    end
    object AnsEtalonADOTablep97: TFloatField
      FieldName = 'p97'
    end
    object AnsEtalonADOTablep98: TFloatField
      FieldName = 'p98'
    end
    object AnsEtalonADOTablep99: TFloatField
      FieldName = 'p99'
    end
    object AnsEtalonADOTablep100: TFloatField
      FieldName = 'p100'
    end
    object AnsEtalonADOTablep101: TFloatField
      FieldName = 'p101'
    end
    object AnsEtalonADOTablep102: TFloatField
      FieldName = 'p102'
    end
    object AnsEtalonADOTablep103: TFloatField
      FieldName = 'p103'
    end
    object AnsEtalonADOTablep104: TFloatField
      FieldName = 'p104'
    end
    object AnsEtalonADOTablep105: TFloatField
      FieldName = 'p105'
    end
    object AnsEtalonADOTablep106: TFloatField
      FieldName = 'p106'
    end
    object AnsEtalonADOTablep107: TFloatField
      FieldName = 'p107'
    end
    object AnsEtalonADOTablep108: TFloatField
      FieldName = 'p108'
    end
    object AnsEtalonADOTablep109: TFloatField
      FieldName = 'p109'
    end
    object AnsEtalonADOTablep110: TFloatField
      FieldName = 'p110'
    end
    object AnsEtalonADOTablep111: TFloatField
      FieldName = 'p111'
    end
    object AnsEtalonADOTablep112: TFloatField
      FieldName = 'p112'
    end
    object AnsEtalonADOTablep113: TFloatField
      FieldName = 'p113'
    end
    object AnsEtalonADOTablep114: TFloatField
      FieldName = 'p114'
    end
    object AnsEtalonADOTablep115: TFloatField
      FieldName = 'p115'
    end
    object AnsEtalonADOTablep116: TFloatField
      FieldName = 'p116'
    end
    object AnsEtalonADOTablep117: TFloatField
      FieldName = 'p117'
    end
    object AnsEtalonADOTablep118: TFloatField
      FieldName = 'p118'
    end
    object AnsEtalonADOTablep119: TFloatField
      FieldName = 'p119'
    end
    object AnsEtalonADOTablep120: TFloatField
      FieldName = 'p120'
    end
    object AnsEtalonADOTablep121: TFloatField
      FieldName = 'p121'
    end
    object AnsEtalonADOTablep122: TFloatField
      FieldName = 'p122'
    end
    object AnsEtalonADOTablep123: TFloatField
      FieldName = 'p123'
    end
    object AnsEtalonADOTablep124: TFloatField
      FieldName = 'p124'
    end
    object AnsEtalonADOTablep125: TFloatField
      FieldName = 'p125'
    end
    object AnsEtalonADOTablep126: TFloatField
      FieldName = 'p126'
    end
    object AnsEtalonADOTablep127: TFloatField
      FieldName = 'p127'
    end
    object AnsEtalonADOTablep128: TFloatField
      FieldName = 'p128'
    end
    object AnsEtalonADOTablep129: TFloatField
      FieldName = 'p129'
    end
    object AnsEtalonADOTablep130: TFloatField
      FieldName = 'p130'
    end
    object AnsEtalonADOTablep131: TFloatField
      FieldName = 'p131'
    end
    object AnsEtalonADOTablep132: TFloatField
      FieldName = 'p132'
    end
    object AnsEtalonADOTablep133: TFloatField
      FieldName = 'p133'
    end
    object AnsEtalonADOTablep134: TFloatField
      FieldName = 'p134'
    end
    object AnsEtalonADOTablep135: TFloatField
      FieldName = 'p135'
    end
    object AnsEtalonADOTablep136: TFloatField
      FieldName = 'p136'
    end
    object AnsEtalonADOTablep137: TFloatField
      FieldName = 'p137'
    end
    object AnsEtalonADOTablep138: TFloatField
      FieldName = 'p138'
    end
    object AnsEtalonADOTablep139: TFloatField
      FieldName = 'p139'
    end
    object AnsEtalonADOTablep140: TFloatField
      FieldName = 'p140'
    end
    object AnsEtalonADOTablep141: TFloatField
      FieldName = 'p141'
    end
    object AnsEtalonADOTablep142: TFloatField
      FieldName = 'p142'
    end
    object AnsEtalonADOTablep143: TFloatField
      FieldName = 'p143'
    end
    object AnsEtalonADOTablep144: TFloatField
      FieldName = 'p144'
    end
    object AnsEtalonADOTablep145: TFloatField
      FieldName = 'p145'
    end
    object AnsEtalonADOTablep146: TFloatField
      FieldName = 'p146'
    end
    object AnsEtalonADOTablep147: TFloatField
      FieldName = 'p147'
    end
    object AnsEtalonADOTablep148: TFloatField
      FieldName = 'p148'
    end
    object AnsEtalonADOTablep149: TFloatField
      FieldName = 'p149'
    end
    object AnsEtalonADOTablep150: TFloatField
      FieldName = 'p150'
    end
    object AnsEtalonADOTablep151: TFloatField
      FieldName = 'p151'
    end
    object AnsEtalonADOTablep152: TFloatField
      FieldName = 'p152'
    end
    object AnsEtalonADOTablep153: TFloatField
      FieldName = 'p153'
    end
    object AnsEtalonADOTablep154: TFloatField
      FieldName = 'p154'
    end
    object AnsEtalonADOTablep155: TFloatField
      FieldName = 'p155'
    end
    object AnsEtalonADOTablep156: TFloatField
      FieldName = 'p156'
    end
    object AnsEtalonADOTablep157: TFloatField
      FieldName = 'p157'
    end
    object AnsEtalonADOTablep158: TFloatField
      FieldName = 'p158'
    end
    object AnsEtalonADOTablep159: TFloatField
      FieldName = 'p159'
    end
    object AnsEtalonADOTablep160: TFloatField
      FieldName = 'p160'
    end
    object AnsEtalonADOTablep161: TFloatField
      FieldName = 'p161'
    end
    object AnsEtalonADOTablep162: TFloatField
      FieldName = 'p162'
    end
    object AnsEtalonADOTablep163: TFloatField
      FieldName = 'p163'
    end
    object AnsEtalonADOTablep164: TFloatField
      FieldName = 'p164'
    end
    object AnsEtalonADOTablep165: TFloatField
      FieldName = 'p165'
    end
    object AnsEtalonADOTablep166: TFloatField
      FieldName = 'p166'
    end
    object AnsEtalonADOTablep167: TFloatField
      FieldName = 'p167'
    end
    object AnsEtalonADOTablep168: TFloatField
      FieldName = 'p168'
    end
  end
  object AnsEtalonDS: TDataSource
    DataSet = AnsEtalonADOTable
    Left = 177
    Top = 449
  end
  object TmpFIBQuery: TpFIBQuery
    Transaction = TmpQueryWriteTr
    Database = TestDB
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 416
    Top = 271
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object ChangeAsksDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TESTASKS'
      'SET '
      '    SCIENS_ID = ?SCIENS_ID,'
      '    POINTS = ?POINTS,'
      '    FREQUENT = ?FREQUENT,'
      '    ID_ASKTYPE = ?ID_ASKTYPE,'
      '    ANSWCOUNT = ?ANSWCOUNT,'
      '    DATEUSE = ?DATEUSE,'
      '    ARCHIVE = ?ARCHIVE'
      'WHERE'
      '    ID_ASK = ?OLD_ID_ASK'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TESTASKS'
      'WHERE'
      '        ID_ASK = ?OLD_ID_ASK'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TESTASKS('
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    POINTS,'
      '    FREQUENT,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    DATEUSE,'
      '    ARCHIVE'
      ')'
      'VALUES('
      '    ?ID_ASK,'
      '    ?SCIENS_ID,'
      '    ?POINTS,'
      '    ?FREQUENT,'
      '    ?ID_ASKTYPE,'
      '    ?ANSWCOUNT,'
      '    ?DATEUSE,'
      '    ?ARCHIVE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    POINTS,'
      '    FREQUENT,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    DATEUSE,'
      '    ARCHIVE'
      'FROM'
      '    TESTASKS '
      ''
      ' WHERE '
      '        TESTASKS.ID_ASK = ?OLD_ID_ASK'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID_ASK,'
      '    SCIENS_ID,'
      '    POINTS,'
      '    FREQUENT,'
      '    ID_ASKTYPE,'
      '    ANSWCOUNT,'
      '    DATEUSE,'
      '    ARCHIVE'
      'FROM'
      '    TESTASKS ')
    AutoUpdateOptions.UpdateTableName = 'TESTASKS'
    AutoUpdateOptions.KeyFields = 'ID_ASK'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_TESTASKS_ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = ChangeAsksWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 657
    Top = 337
    poAskRecordCount = True
    object ChangeAsksDataSetID_ASK: TFIBIntegerField
      FieldName = 'ID_ASK'
    end
    object ChangeAsksDataSetSCIENS_ID: TFIBIntegerField
      FieldName = 'SCIENS_ID'
    end
    object ChangeAsksDataSetPOINTS: TFIBIntegerField
      FieldName = 'POINTS'
    end
    object ChangeAsksDataSetFREQUENT: TFIBIntegerField
      FieldName = 'FREQUENT'
    end
    object ChangeAsksDataSetID_ASKTYPE: TFIBIntegerField
      FieldName = 'ID_ASKTYPE'
    end
    object ChangeAsksDataSetANSWCOUNT: TFIBIntegerField
      FieldName = 'ANSWCOUNT'
    end
    object ChangeAsksDataSetDATEUSE: TFIBDateTimeField
      FieldName = 'DATEUSE'
    end
    object ChangeAsksDataSetARCHIVE: TFIBIntegerField
      FieldName = 'ARCHIVE'
    end
  end
  object ChangeAsksWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    TPBMode = tpbRepeatableRead
    Left = 657
    Top = 289
  end
  object ChangeAsksDS: TDataSource
    DataSet = ChangeAsksDataSet
    Left = 657
    Top = 385
  end
  object FullDepDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DEPARTMENTS'
      'SET '
      '    DEPNAME = ?DEPNAME'
      'WHERE'
      '    DEPID = ?OLD_DEPID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DEPARTMENTS'
      'WHERE'
      '        DEPID = ?OLD_DEPID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DEPARTMENTS('
      '    DEPID,'
      '    DEPNAME'
      ')'
      'VALUES('
      '    ?DEPID,'
      '    ?DEPNAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    DEPID,'
      '    DEPNAME'
      'FROM'
      '    DEPARTMENTS '
      ''
      ' WHERE '
      '        DEPARTMENTS.DEPID = ?OLD_DEPID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    DEPID,'
      '    DEPNAME'
      'FROM'
      '    DEPARTMENTS ')
    AfterScroll = DepartDataSetAfterScroll
    Transaction = ReadTr
    Database = TestDB
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 658
    Top = 15
    oFetchAll = True
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'DEPID'
    end
    object FIBStringField1: TFIBStringField
      FieldName = 'DEPNAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object FullDepDS: TDataSource
    DataSet = FullDepDataSet
    Left = 658
    Top = 63
  end
  object FullSciensDataSet1: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      ' ID_SCIENS,'
      ' SC_NAME,'
      ' SC_DESCR,'
      ' DEP_ID,'
      ' LIB_SC_ID,'
      ' ID_LANG,'
      ' SEMESTR,'
      ' ASK_COUNT'
      'FROM'
      ' SCIENS '
      ''
      ' WHERE '
      '  SCIENS.ID_SCIENS = ?OLD_ID_SCIENS'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID_SCIENS,'
      ' SC_NAME,'
      ' SC_DESCR,'
      ' DEP_ID,'
      ' LIB_SC_ID,'
      ' ID_LANG,'
      ' SEMESTR,'
      ' ASK_COUNT'
      'FROM'
      ' SCIENS ')
    AfterOpen = FullSciensDataSet1AfterOpen
    AfterScroll = FullSciensDataSet1AfterScroll
    Transaction = ReadTr
    Database = TestDB
    AfterFetchRecord = FullSciensDataSet1AfterFetchRecord
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 185
    Top = 15
    poAskRecordCount = True
    oFetchAll = True
    object FIBIntegerField2: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SCIENS'
      Visible = False
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1084#1086#1076#1091#1083#1103' ('#1085#1072#1091#1082'. '#1085#1072#1087#1088'.)'
      FieldName = 'SC_NAME'
      Size = 200
      EmptyStrToNull = True
    end
    object FIBStringField3: TFIBStringField
      DisplayLabel = #1054#1087#1080#1089
      FieldName = 'SC_DESCR'
      Size = 100
      EmptyStrToNull = True
    end
    object FIBIntegerField3: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'DEP_ID'
      Visible = False
    end
    object FIBIntegerField4: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'LIB_SC_ID'
      Visible = False
    end
    object FIBIntegerField5: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_LANG'
      Visible = False
    end
    object StringField1: TStringField
      DisplayLabel = #1050#1072#1092#1077#1076#1088#1072
      FieldKind = fkLookup
      FieldName = 'dep_search'
      LookupDataSet = FullDepDataSet
      LookupKeyFields = 'DEPID'
      LookupResultField = 'DEPNAME'
      KeyFields = 'DEP_ID'
      Size = 100
      Lookup = True
    end
    object StringField2: TStringField
      DisplayLabel = #1052#1086#1074#1072
      FieldKind = fkLookup
      FieldName = 'lanng_search'
      LookupDataSet = LangsDataSet
      LookupKeyFields = 'ID_LANG'
      LookupResultField = 'LANG_NAME'
      KeyFields = 'ID_LANG'
      Lookup = True
    end
    object FullSciensDataSet1SEMESTR: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1057#1077#1084'.'
      DisplayWidth = 5
      FieldName = 'SEMESTR'
    end
    object FullSciensDataSet1ASK_COUNT: TFIBIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1055#1080#1090#1072#1085#1100
      FieldName = 'ASK_COUNT'
    end
  end
  object FullSciensDS1: TDataSource
    DataSet = FullSciensDataSet1
    Left = 185
    Top = 63
  end
  object DepartWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 84
    Top = 127
  end
  object AskListReport: TfrxReport
    Version = '4.10.5'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 9
    ReportOptions.CreateDate = 40125.744610821800000000
    ReportOptions.LastChange = 40887.764892210600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if CheckBox1.state = cbChecked then GroupHeader2.startNewPage ' +
        ':= true'
      '  else GroupHeader2.startNewPage := false;'
      '  if ShowVarNumCheckBox.state = cbChecked then'
      '  begin'
      '    memo4.visible := true;'
      '    memo5.visible := true;                  '
      '  end'
      '  else'
      '  begin'
      '    memo4.visible := false;'
      '    memo5.visible := false;      '
      '  end;            '
      'end;'
      ''
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if (AddEmptyPage.state = cbChecked)and((get('#39'Page'#39') mod 2) =1)' +
        ' then ReportSummary1.startNewPage := true'
      '  else ReportSummary1.startNewPage := false;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 230
    Top = 550
    Datasets = <
      item
        DataSet = R_OffAsksDS
        DataSetName = 'R_OffAsksDS'
      end
      item
        DataSet = R_OffPaperDS
        DataSetName = 'R_OffPaperDS'
      end
      item
        DataSet = R_SubjDS
        DataSetName = 'R_SubjDS'
      end
      item
        DataSet = R_SubjTestDS
        DataSetName = 'R_SubjTestDS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      MirrorMargins = True
      Duplex = dmVertical
      object ReportTitle1: TfrxReportTitle
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 190.866265000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 699.213050000000000000
        Stretched = True
        object R_SubjDSFACULTY: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Left = 340.157700000000000000
          Top = 129.165430000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'FACULTY'
          DataSet = R_SubjDS
          DataSetName = 'R_SubjDS'
          GapX = 4.000000000000000000
          Memo.UTF8 = (
            '[R_SubjDS."FACULTY"]')
        end
        object R_SubjDSSEMESTR: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 345.826995000000000000
          Top = 148.063080000000000000
          Width = 111.118182000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'SEMESTR'
          DataSet = R_SubjDS
          DataSetName = 'R_SubjDS'
          Memo.UTF8 = (
            '[R_SubjDS."SEMESTR"]')
        end
        object R_OffPaperDSID_OFFEXAM: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 345.071089000000000000
          Top = 166.960730000000000000
          Width = 112.252041000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ID_OFFEXAM'
          DataSet = R_OffPaperDS
          DataSetName = 'R_OffPaperDS'
          Memo.UTF8 = (
            '[R_OffPaperDS."ID_OFFEXAM"]')
        end
        object R_SubjTestDSperson_tit_srch: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Top = 22.677180000000000000
          Width = 699.213050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'person_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[R_SubjTestDS."person_tit_srch"]')
          ParentFont = False
        end
        object R_SubjTestDSsign_tit_srch: TfrxMemoView
          Align = baCenter
          ShiftMode = smWhenOverlapped
          Left = 230.551330000000000000
          Top = 45.574830000000010000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'sign_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          HAlign = haCenter
          Memo.UTF8 = (
            '[R_SubjTestDS."sign_tit_srch"]')
        end
        object R_SubjTestDSgroup_tit_srch: TfrxMemoView
          Align = baCenter
          ShiftMode = smWhenOverlapped
          Left = 230.551330000000000000
          Top = 68.472480000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'group_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          HAlign = haCenter
          Memo.UTF8 = (
            '[R_SubjTestDS."group_tit_srch"]')
        end
        object R_SubjTestDSspec_tit_srch: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Top = 91.370130000000000000
          Width = 699.213050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'spec_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          HAlign = haCenter
          Memo.UTF8 = (
            '[R_SubjTestDS."spec_tit_srch"]')
        end
        object R_SubjTestDSsubj_tit_srch: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 110.267780000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'subj_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          HAlign = haRight
          Memo.UTF8 = (
            '[R_SubjTestDS."subj_tit_srch"]')
        end
        object R_SubjDSSUBJNAME: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Left = 340.157700000000000000
          Top = 110.267780000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'SUBJNAME'
          DataSet = R_SubjDS
          DataSetName = 'R_SubjDS'
          GapX = 4.000000000000000000
          Memo.UTF8 = (
            '[R_SubjDS."SUBJNAME"]')
        end
        object R_SubjTestDSfaculty_tit_srch: TfrxMemoView
          Align = baLeft
          ShiftMode = smWhenOverlapped
          Top = 129.165430000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'faculty_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          HAlign = haRight
          Memo.UTF8 = (
            '[R_SubjTestDS."faculty_tit_srch"]')
        end
        object R_SubjTestDSsemestr_tit_srch: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 102.047310000000000000
          Top = 148.063080000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'semestr_tit_srch'
          DataSet = R_SubjTestDS
          DataSetName = 'R_SubjTestDS'
          HAlign = haRight
          Memo.UTF8 = (
            '[R_SubjTestDS."semestr_tit_srch"]')
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Width = 699.213050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object VariantTitle: TfrxMemoView
          Left = 188.976500000000000000
          Top = 167.189085000000000000
          Width = 151.181200000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 381.732530000000000000
        Width = 699.213050000000000000
        DataSet = R_OffAsksDS
        DataSetName = 'R_OffAsksDS'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Left = 62.362204720000000000
          Width = 636.850845279999900000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smActualHeight
          AllowExpressions = False
          DataField = 'RecData'
          DataSet = R_OffAsksDS
          DataSetName = 'R_OffAsksDS'
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313035387B5C666F6E7474626C7B5C66305C666E696C5C66636861
            72736574302054696D6573204E657720526F6D616E3B7D7B5C66315C666E696C
            204D532053616E732053657269663B7D7D0D0A7B5C2A5C67656E657261746F72
            204D7366746564697420352E34312E31352E313531353B7D5C766965776B696E
            64345C7563315C706172645C6C616E67313033335C66305C6673323420205C6C
            616E67313035385C66315C667331365C7061720D0A7D0D0A00}
        end
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 34.015748030000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'RecPrefix'
          DataSet = R_OffAsksDS
          DataSetName = 'R_OffAsksDS'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          GapX = 1.000000000000000000
          LineSpacing = 1.000000000000000000
          Memo.UTF8 = (
            '[R_OffAsksDS."RecPrefix"]')
          ParentFont = False
        end
        object R_OffAsksDSRecprefix2: TfrxMemoView
          Align = baLeft
          Left = 34.015748030000000000
          Width = 28.346456690000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Recprefix2'
          DataSet = R_OffAsksDS
          DataSetName = 'R_OffAsksDS'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          GapX = 1.000000000000000000
          HAlign = haCenter
          LineSpacing = 1.000000000000000000
          Memo.UTF8 = (
            '[R_OffAsksDS."Recprefix2"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 359.055350000000000000
        Width = 699.213050000000000000
        Condition = 'R_OffAsksDS."RecPrefix"'
        Stretched = True
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 317.480520000000000000
        Width = 699.213050000000000000
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = 'R_OffAsksDS."ID_ASKLIST"'
        Stretched = True
        object R_OffAsksDSTestModTitle: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Left = 34.236240000000000000
          Width = 664.976810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'TestModTitle'
          DataSet = R_OffAsksDS
          DataSetName = 'R_OffAsksDS'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapX = 1.000000000000000000
          Memo.UTF8 = (
            '[R_OffAsksDS."TestModTitle"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baBottom
          Left = 0.220470000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapX = 1.000000000000000000
          Memo.UTF8 = (
            '[Line#].')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Width = 699.213050000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 498.897960000000000000
        Width = 699.213050000000000000
        object SysMemo1: TfrxSysMemoView
          Align = baCenter
          Left = 302.362400000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[PAGE#]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 20.787415000000000000
        Top = 234.330860000000000000
        Width = 699.213050000000000000
        PrintOnFirstPage = False
        object Memo4: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 565.039735000000000000
          Width = 133.039456000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ID_OFFEXAM'
          DataSet = R_OffPaperDS
          DataSetName = 'R_OffPaperDS'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[R_OffPaperDS."ID_OFFEXAM"]')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baWidth
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 340.157700000000000000
          Width = 224.882035000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'VAR_NAME'
          DataSet = R_OffPaperDS
          DataSetName = 'R_OffPaperDS'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[R_OffPaperDS."VAR_NAME"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 18.897650000000000000
          Width = 699.213050000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 15.118120000000000000
        Top = 461.102660000000000000
        Width = 699.213050000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        object Memo6: TfrxMemoView
          Align = baLeft
          Width = 94.488250000000000000
          Height = 13.228355000000000000
          ShowHint = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '-')
          ParentFont = False
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1079#1074#1110#1090#1091
      Height = 158.000000000000000000
      ClientHeight = 131.000000000000000000
      Left = 320.000000000000000000
      Top = 150.000000000000000000
      Width = 300.000000000000000000
      ClientWidth = 292.000000000000000000
      object CheckBox1: TfrxCheckBoxControl
        Left = 8.000000000000000000
        Top = 12.000000000000000000
        Width = 253.000000000000000000
        Height = 17.000000000000000000
        ShowHint = True
        Caption = #1056#1086#1079#1087#1086#1095#1080#1085#1072#1090#1080' '#1082#1086#1078#1077#1085' '#1088#1086#1079#1076#1110#1083' '#1079' '#1085#1086#1074#1086#1111' '#1089#1090#1086#1088#1110#1085#1082#1080
        Color = clBtnFace
      end
      object Button1: TfrxButtonControl
        Left = 112.000000000000000000
        Top = 88.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'OK'
        ModalResult = 1
      end
      object ShowVarNumCheckBox: TfrxCheckBoxControl
        Left = 8.000000000000000000
        Top = 36.000000000000000000
        Width = 269.000000000000000000
        Height = 17.000000000000000000
        ShowHint = True
        Caption = #1053#1086#1084#1077#1088' '#1074#1072#1088#1110#1072#1085#1090#1091' '#1074' '#1082#1086#1083#1086#1085#1090#1080#1090#1091#1083#1110' '#1082#1086#1078#1085#1086#1111' '#1089#1090#1086#1088#1110#1085#1082#1080
        Color = clBtnFace
      end
      object AddEmptyPage: TfrxCheckBoxControl
        Left = 8.000000000000000000
        Top = 60.000000000000000000
        Width = 277.000000000000000000
        Height = 17.000000000000000000
        ShowHint = True
        Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1080' '#1087#1086#1088#1086#1078#1085#1102' '#1089#1090#1086#1088#1110#1085#1082#1091' '#1076#1083#1103' '#1087#1072#1088#1085#1086#1111' '#1082#1110#1083#1100#1082#1086#1089#1090#1110
        Checked = True
        State = cbChecked
        Color = clBtnFace
      end
    end
  end
  object AskRepDesigner: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = RUSSIAN_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -15
    DefaultFont.Name = 'Times New Roman'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 312
    Top = 551
  end
  object Rep_AskDS: TfrxDBDataset
    UserName = 'Rep_AskDS'
    CloseDataSource = False
    DataSet = TestAskDataSet
    BCDToCurrency = False
    Left = 80
    Top = 551
  end
  object RepFIBComponents: TfrxFIBComponents
    DefaultDatabase = TestDB
    Left = 599
    Top = 551
  end
  object AskListRTFExport: TfrxRTFExport
    FileName = 'Export\AskList.rtf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = True
    ExportEMF = True
    ExportPageBreaks = False
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = True
    HeaderFooterMode = hfNone
    AutoSize = False
    Left = 192
    Top = 496
  end
  object Rep_AnswerDS: TfrxDBDataset
    UserName = 'Rep_AnswerDS'
    CloseDataSource = False
    DataSet = AnswerDataSet
    BCDToCurrency = False
    Left = 152
    Top = 550
  end
  object Rep_SciensDS: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'Rep_SciensDS'
    CloseDataSource = False
    DataSet = SciensDataSet
    BCDToCurrency = False
    Left = 8
    Top = 551
  end
  object AskListHTMLExport: TfrxHTMLExport
    FileName = 'Export\AskList.html'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OpenAfterExport = True
    FixedWidth = True
    Navigator = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    Left = 288
    Top = 496
  end
  object Rep_RichObject: TfrxRichObject
    Left = 694
    Top = 543
  end
  object TmpQueryWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 464
    Top = 287
  end
  object SmartWordStream1: TSmartWordStream
    Left = 704
    Top = 252
  end
  object WordReport1: TWordReport
    OnEndReport = WordReport1EndReport
    OnReportError = WordReport1ReportError
    OnMoveTop = WordReport1MoveTop
    OnMoveNext = WordReport1MoveNext
    OnSectionComplit = WordReport1SectionComplit
    OnDataRequest = WordReport1DataRequest
    OnRequestByNum = WordReport1RequestByNum
    OnSectionPrepare = WordReport1SectionPrepare
    Left = 704
    Top = 196
  end
  object SysLogDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SYS_LOGS'
      'SET '
      ' LOG_ACTION = :LOG_ACTION,'
      ' LOG_SUBJECT = :LOG_SUBJECT,'
      ' LOG_USERID = :LOG_USERID,'
      ' LOG_DATE = :LOG_DATE,'
      ' LOG_USERDEPID = :LOG_USERDEPID,'
      ' LOG_SUBJECTID = :LOG_SUBJECTID'
      'WHERE'
      ' ID_LOG = :OLD_ID_LOG'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' SYS_LOGS'
      'WHERE'
      '  ID_LOG = :OLD_ID_LOG'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_LOGS('
      ' ID_LOG,'
      ' LOG_ACTION,'
      ' LOG_SUBJECT,'
      ' LOG_USERID,'
      ' LOG_DATE,'
      ' LOG_USERDEPID,'
      ' LOG_SUBJECTID'
      ')'
      'VALUES('
      ' :ID_LOG,'
      ' :LOG_ACTION,'
      ' :LOG_SUBJECT,'
      ' :LOG_USERID,'
      ' :LOG_DATE,'
      ' :LOG_USERDEPID,'
      ' :LOG_SUBJECTID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID_LOG,'
      ' LOG_ACTION,'
      ' LOG_SUBJECT,'
      ' LOG_USERID,'
      ' LOG_DATE,'
      ' LOG_USERDEPID,'
      ' LOG_SUBJECTID'
      'FROM'
      ' SYS_LOGS '
      ''
      ' WHERE '
      '  SYS_LOGS.ID_LOG = :OLD_ID_LOG'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID_LOG,'
      ' LOG_ACTION,'
      ' LOG_SUBJECT,'
      ' LOG_USERID,'
      ' LOG_DATE,'
      ' LOG_USERDEPID,'
      ' LOG_SUBJECTID'
      'FROM'
      ' SYS_LOGS ')
    AutoUpdateOptions.UpdateTableName = 'SYS_LOGS'
    AutoUpdateOptions.KeyFields = 'ID_LOG'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_SYS_LOGS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = SysLogpWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 648
    Top = 175
    object SysLogDataSetID_LOG: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_LOG'
    end
    object SysLogDataSetLOG_ACTION: TFIBStringField
      DisplayLabel = #1055#1086#1076#1110#1103
      FieldName = 'LOG_ACTION'
      Size = 200
      EmptyStrToNull = True
    end
    object SysLogDataSetLOG_SUBJECT: TFIBStringField
      DisplayLabel = #1054#1073#1108#1082#1090
      FieldName = 'LOG_SUBJECT'
      Size = 200
      EmptyStrToNull = True
    end
    object SysLogDataSetLOG_USERID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
      FieldName = 'LOG_USERID'
    end
    object SysLogDataSetLOG_DATE: TFIBDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'LOG_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object SysLogDataSetuser_name_search: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'user_name_search'
      LookupDataSet = LibUserDataSet
      LookupKeyFields = 'USERID'
      LookupResultField = 'USERNAME'
      KeyFields = 'LOG_USERID'
      Lookup = True
    end
    object SysLogDataSetLOG_USERDEPID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
      FieldName = 'LOG_USERDEPID'
    end
    object SysLogDataSetLOG_SUBJECTID2: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1086#1073#1108#1082#1090#1091
      FieldName = 'LOG_SUBJECTID'
    end
  end
  object SysLogpWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 648
    Top = 127
  end
  object SysLogDS: TDataSource
    DataSet = SysLogDataSet
    Left = 648
    Top = 223
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 24
    Top = 495
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 112
    Top = 495
  end
  object TSect2ScDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TESTSECT2SCIENS'
      'SET '
      ' TESTSECTION_ID = ?MAS_ID_TESTSECTION,'
      ' SCIENS_ID = ?SCIENS_ID,'
      ' ASKCOUNT = ?ASKCOUNT,'
      ' RIGHTORDER = ?RIGHTORDER'
      'WHERE'
      ' ID_TESTSECT2SCIENS = ?OLD_ID_TESTSECT2SCIENS'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TESTSECT2SCIENS'
      'WHERE'
      '  ID_TESTSECT2SCIENS = ?OLD_ID_TESTSECT2SCIENS'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TESTSECT2SCIENS('
      ' ID_TESTSECT2SCIENS,'
      ' TESTSECTION_ID,'
      ' SCIENS_ID,'
      ' ASKCOUNT,'
      ' RIGHTORDER'
      ')'
      'VALUES('
      ' ?ID_TESTSECT2SCIENS,'
      ' ?MAS_ID_TESTSECTION,'
      ' ?SCIENS_ID,'
      ' ?ASKCOUNT,'
      ' ?RIGHTORDER'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID_TESTSECT2SCIENS,'
      ' TESTSECTION_ID,'
      ' SCIENS_ID,'
      ' ASKCOUNT,'
      ' RIGHTORDER'
      'FROM'
      ' TESTSECT2SCIENS '
      'where(  TESTSECTION_ID= ?ID_TESTSECTION'
      
        '  ) and (  TESTSECT2SCIENS.ID_TESTSECT2SCIENS = ?OLD_ID_TESTSECT' +
        '2SCIENS'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID_TESTSECT2SCIENS,'
      ' TESTSECTION_ID,'
      ' SCIENS_ID,'
      ' ASKCOUNT,'
      ' RIGHTORDER'
      'FROM'
      ' TESTSECT2SCIENS '
      'where TESTSECTION_ID= ?ID_TESTSECTION'
      'order by ID_TESTSECT2SCIENS')
    AutoUpdateOptions.UpdateTableName = 'TESTSECT2SCIENS'
    AutoUpdateOptions.KeyFields = 'ID_TESTSECT2SCIENS'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_TESTSECT2SCIENS_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = TSect2ScWriteTr
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DataSource = TestModDS
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 176
    Top = 335
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    object TSect2ScDataSetsc_semestr_search: TIntegerField
      Alignment = taCenter
      DefaultExpression = '1'
      DisplayLabel = #1057#1077#1084'.'
      FieldKind = fkLookup
      FieldName = 'sc_semestr_search'
      LookupDataSet = FullSciensDataSet
      LookupKeyFields = 'ID_SCIENS'
      LookupResultField = 'SEMESTR'
      KeyFields = 'SCIENS_ID'
      Lookup = True
    end
    object TSect2ScDataSetsc_name_search: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1084#1086#1076#1091#1083#1103' '#1090#1077#1089#1090#1086#1074#1080#1093' '#1087#1080#1090#1072#1085#1100
      DisplayWidth = 200
      FieldKind = fkLookup
      FieldName = 'sc_name_search'
      LookupDataSet = FullSciensDataSet
      LookupKeyFields = 'ID_SCIENS'
      LookupResultField = 'SC_NAME'
      KeyFields = 'SCIENS_ID'
      Size = 200
      Lookup = True
    end
    object TSect2ScDataSetID_TESTSECT2SCIENS: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_TESTSECT2SCIENS'
    end
    object TSect2ScDataSetTESTSECTION_ID: TFIBIntegerField
      FieldName = 'TESTSECTION_ID'
    end
    object TSect2ScDataSetSCIENS_ID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SCIENS_ID'
    end
    object TSect2ScDataSetASKCOUNT: TFIBIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1055#1080#1090'.'
      FieldName = 'ASKCOUNT'
    end
    object TSect2ScDataSetRIGHTORDER: TFIBStringField
      FieldName = 'RIGHTORDER'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object TSect2ScWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 176
    Top = 287
  end
  object TSect2SCDS: TDataSource
    DataSet = TSect2ScDataSet
    Left = 176
    Top = 383
  end
  object R_SubjDS: TfrxDBDataset
    UserName = 'R_SubjDS'
    CloseDataSource = False
    DataSet = SubjectDataSet
    BCDToCurrency = False
    Left = 432
    Top = 455
  end
  object R_SubjTestDS: TfrxDBDataset
    UserName = 'R_SubjTestDS'
    CloseDataSource = False
    DataSet = SubjTestDataSet
    BCDToCurrency = False
    Left = 496
    Top = 455
  end
  object R_OffPaperDS: TfrxDBDataset
    UserName = 'R_OffPaperDS'
    CloseDataSource = False
    DataSet = OffPapersDataSet
    BCDToCurrency = False
    Left = 568
    Top = 503
  end
  object R_OffAsksDS: TfrxDBDataset
    UserName = 'R_OffAsksDS'
    CloseDataSource = False
    DataSource = RedyPaperDS
    BCDToCurrency = False
    Left = 648
    Top = 503
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = TestModDataSet
    BCDToCurrency = False
    Left = 472
    Top = 511
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 384
    Top = 535
  end
  object Rep_FullSciensDS: TfrxDBDataset
    UserName = 'Rep_FullSciensDS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_SCIENS=ID_SCIENS'
      'SC_NAME=SC_NAME'
      'SC_DESCR=SC_DESCR'
      'DEP_ID=DEP_ID'
      'LIB_SC_ID=LIB_SC_ID'
      'ID_LANG=ID_LANG'
      'dep_search=dep_search'
      'lanng_search=lanng_search'
      'SEMESTR=SEMESTR'
      'ASK_COUNT=ASK_COUNT')
    DataSet = FullSciensDataSet1
    BCDToCurrency = False
    Left = 456
    Top = 559
  end
  object XMLDocument1: TXMLDocument
    Left = 712
    Top = 399
    DOMVendorDesc = 'MSXML'
  end
  object tmpFIBDataSet: TpFIBDataSet
    AutoUpdateOptions.CanChangeSQLs = True
    Transaction = ReadTr
    Database = TestDB
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 520
    Top = 271
  end
  object tmpDS: TDataSource
    DataSet = tmpFIBDataSet
    Left = 576
    Top = 287
  end
  object LYearsDataSet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE LIB_EDUYEAR'
      'SET '
      ' EDUYEAR = ?EDUYEAR'
      'WHERE'
      ' ID_EDUYEAR = ?OLD_ID_EDUYEAR'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' LIB_EDUYEAR'
      'WHERE'
      '  ID_EDUYEAR = ?OLD_ID_EDUYEAR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO LIB_EDUYEAR('
      ' ID_EDUYEAR,'
      ' EDUYEAR'
      ')'
      'VALUES('
      ' ?ID_EDUYEAR,'
      ' ?EDUYEAR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID_EDUYEAR,'
      ' EDUYEAR'
      'FROM'
      ' LIB_EDUYEAR '
      ''
      ' WHERE '
      '  LIB_EDUYEAR.ID_EDUYEAR = ?OLD_ID_EDUYEAR'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID_EDUYEAR,'
      ' EDUYEAR'
      'FROM'
      ' LIB_EDUYEAR '
      'order by ID_EDUYEAR')
    AutoUpdateOptions.UpdateTableName = 'LIB_EDUYEAR'
    AutoUpdateOptions.KeyFields = 'ID_EDUYEAR'
    AutoUpdateOptions.GeneratorName = 'GEN_LIB_EDUYEAR_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = ReadTr
    Database = TestDB
    UpdateTransaction = LYearsWriteTr
    AutoCommit = True
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 728
    Top = 15
    oFetchAll = True
    object LYearsDataSetID_EDUYEAR: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_EDUYEAR'
    end
    object LYearsDataSetEDUYEAR: TFIBStringField
      DisplayLabel = #1053#1072#1074#1095'. '#1088#1110#1082'.'
      FieldName = 'EDUYEAR'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object LYearsWriteTr: TpFIBTransaction
    DefaultDatabase = TestDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 728
    Top = 127
  end
  object LYearsDS: TDataSource
    DataSet = LYearsDataSet
    Left = 728
    Top = 63
  end
end
