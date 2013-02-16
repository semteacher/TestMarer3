object AdvTestModEditor: TAdvTestModEditor
  Left = 504
  Top = 121
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1082#1090#1086#1088' '#1089#1087#1080#1089#1082#1091' '#1084#1086#1076#1091#1083#1110#1074' '#1090#1077#1089#1090#1091
  ClientHeight = 533
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 3
    Width = 57
    Height = 13
    Caption = #1055#1088#1077#1076#1084#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 541
    Top = 2
    Width = 33
    Height = 13
    Caption = #1058#1077#1089#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 248
    Top = 2
    Width = 70
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 449
    Top = 2
    Width = 56
    Height = 13
    Caption = #1057#1077#1084#1077#1089#1090#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonPanel1: TButtonPanel
    Left = 0
    Top = 508
    Width = 818
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MaxHeight = 25
    Constraints.MinHeight = 25
    TabOrder = 0
    Buttons = [btApply]
    OnButtonApplyClick = ButtonPanel1ButtonApplyClick
  end
  object SubjectDBEditEh: TDBEditEh
    Left = 60
    Top = 0
    Width = 186
    Height = 19
    DataField = 'SUBJNAME'
    DataSource = testeditDM.SubjectDS
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object FacultyDBEditEh: TDBEditEh
    Left = 318
    Top = 0
    Width = 127
    Height = 19
    DataField = 'FACULTY'
    DataSource = testeditDM.SubjectDS
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Visible = True
  end
  object TestDBEditEh: TDBEditEh
    Left = 576
    Top = 0
    Width = 241
    Height = 19
    DataField = 'TESTNAME'
    DataSource = testeditDM.SubjTestDS
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Visible = True
  end
  object TestModGB: TGroupBox
    Left = 0
    Top = 305
    Width = 393
    Height = 200
    Caption = #1052#1086#1076#1091#1083#1110' '#1090#1077#1089#1090#1086#1074#1086#1075#1086' '#1073#1110#1083#1077#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      393
      200)
    object ApprendModuleSBut: TSpeedButton
      Left = 268
      Top = 173
      Width = 122
      Height = 25
      Caption = #1044#1086#1076#1072#1090#1080' '#1084#1086#1076#1091#1083#1100'!'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = ApprendModuleSButClick
    end
    object MoveTopSB: TSpeedButton
      Left = 218
      Top = 173
      Width = 25
      Height = 25
      Hint = #1055#1077#1088#1077#1084#1110#1089#1090#1080#1090#1080' '#1074#1075#1086#1088#1091
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
        3333333333777F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
        3333333777737777F333333099999990333333373F3333373333333309999903
        333333337F33337F33333333099999033333333373F333733333333330999033
        3333333337F337F3333333333099903333333333373F37333333333333090333
        33333333337F7F33333333333309033333333333337373333333333333303333
        333333333337F333333333333330333333333333333733333333}
      NumGlyphs = 2
      OnClick = MoveTopSBClick
    end
    object MoveBottomSB: TSpeedButton
      Left = 243
      Top = 173
      Width = 25
      Height = 25
      Hint = #1055#1077#1088#1077#1084#1110#1089#1090#1080#1090#1080' '#1074#1085#1080#1079
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
      OnClick = MoveBottomSBClick
    end
    object TestModDBGridEh: TDBGridEh
      Left = 3
      Top = 14
      Width = 386
      Height = 158
      AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
      Anchors = [akLeft, akTop, akBottom]
      AutoFitColWidths = True
      ColumnDefValues.Title.Alignment = taCenter
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataSource = testeditDM.TestModDS
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      FrozenCols = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight, dghDialogFind]
      ParentFont = False
      ParentShowHint = False
      RowHeight = 2
      RowLines = 2
      ShowHint = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      VertScrollBar.Tracking = True
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ORD_NUM'
          Footer.Color = clInfoBk
          Footer.FieldName = 'ORD_NUM'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 30
        end
        item
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'SECT_TITLE'
          Footer.Alignment = taCenter
          Footer.Color = clYellow
          Footer.Value = '<-'#1042#1089#1100#1086#1075#1086' '#1084#1086#1076#1091#1083#1110#1074'              '#1042#1089#1100#1086#1075#1086' '#1087#1080#1090#1072#1085#1100' '#1090#1077#1089#1090#1110'->'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Width = 279
        end
        item
          AutoFitColWidth = False
          ButtonStyle = cbsUpDown
          EditButtons = <>
          FieldName = 'ASKS_TOTAL'
          Footer.Color = clInfoBk
          Footer.FieldName = 'ASKS_TOTAL'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clRed
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 50
        end>
    end
    object TestModDBNavigator: TDBNavigator
      Left = 2
      Top = 173
      Width = 216
      Height = 25
      DataSource = testeditDM.TestModDS
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Anchors = [akLeft, akRight, akBottom]
      Flat = True
      Hints.Strings = (
        #1053#1072' '#1087#1086#1095#1072#1090#1086#1082
        #1053#1072#1079#1072#1076
        #1042#1087#1077#1088#1077#1076
        #1042' '#1082#1110#1085#1077#1094#1100
        #1042#1089#1090#1072#1074#1080#1090#1080
        #1042#1080#1076#1072#1083#1080#1090#1080
        #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
        #1047#1073#1077#1088#1077#1075#1090#1080
        #1042#1110#1076#1084#1110#1085#1080#1090#1080
        #1054#1073#1085#1086#1074#1080#1090#1080)
      TabOrder = 1
    end
  end
  object FullSciensGB: TGroupBox
    Left = 0
    Top = 20
    Width = 817
    Height = 285
    Caption = #1055#1077#1088#1077#1083#1110#1082' '#1084#1086#1076#1091#1083#1110#1074' '#1090#1077#1089#1090#1086#1074#1080#1093' '#1087#1080#1090#1072#1085#1100' ('#1090#1077#1084', '#1088#1086#1079#1076#1110#1083#1110#1074', '#1085#1072#1091#1082'. '#1085#1072#1087#1088'.):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    DesignSize = (
      817
      285)
    object AddModuleSBut: TSpeedButton
      Left = 632
      Top = 258
      Width = 183
      Height = 25
      Caption = #1044#1086#1076#1072#1090#1080' '#1084#1086#1076#1091#1083#1100' '#1074' '#1090#1077#1089#1090'!'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = AddModuleSButClick
    end
    object RepAskCountSB: TSpeedButton
      Left = 424
      Top = 258
      Width = 209
      Height = 25
      Caption = #1047#1074#1110#1090' - '#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1080#1090#1072#1085#1100' '#1087#1086' '#1090#1077#1084#1072#1093
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = RepAskCountSBClick
    end
    object SpeedButton1: TSpeedButton
      Left = 217
      Top = 258
      Width = 207
      Height = 25
      Action = MainForm.UpdateAskcountCmd
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FullSciensDBGridEh: TDBGridEh
      Left = 3
      Top = 15
      Width = 810
      Height = 242
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoFitColWidths = True
      ColumnDefValues.Title.Alignment = taCenter
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataSource = testeditDM.FullSciensDS1
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FrozenCols = 3
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      RowHeight = 2
      RowLines = 2
      ShowHint = True
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnTitleBtnClick = FullSciensDBGridEhTitleBtnClick
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'dep_search'
          Footers = <>
          HideDuplicates = True
          STFilter.DataField = 'DEP_ID'
          STFilter.KeyField = 'DEPID'
          STFilter.ListField = 'DEPNAME'
          STFilter.ListSource = testeditDM.FullDepDS
          Title.TitleButton = False
          Width = 215
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'lanng_search'
          Footers = <>
          STFilter.DataField = 'ID_LANG'
          STFilter.KeyField = 'ID_LANG'
          STFilter.ListField = 'LANG_NAME'
          STFilter.ListSource = testeditDM.LangDS
          Title.TitleButton = False
          Width = 86
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ID_SCIENS'
          Footers = <>
          Width = 42
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SC_NAME'
          Footers = <>
          STFilter.Visible = False
          Width = 264
        end
        item
          EditButtons = <>
          FieldName = 'SC_DESCR'
          Footers = <>
          STFilter.Visible = False
          Width = 107
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SEMESTR'
          Footers = <>
          Title.Hint = #1057#1077#1084#1077#1089#1090#1088
          Width = 42
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ASK_COUNT'
          Footers = <>
          Width = 56
        end>
    end
    object FullSciensDBNavigator: TDBNavigator
      Left = 2
      Top = 258
      Width = 215
      Height = 25
      DataSource = testeditDM.FullSciensDS1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Anchors = [akLeft, akRight, akBottom]
      Flat = True
      Hints.Strings = (
        #1053#1072' '#1087#1086#1095#1072#1090#1086#1082
        #1053#1072#1079#1072#1076
        #1042#1087#1077#1088#1077#1076
        #1042' '#1082#1110#1085#1077#1094#1100
        #1042#1089#1090#1072#1074#1080#1090#1080
        #1042#1080#1076#1072#1083#1080#1090#1080
        #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
        #1047#1073#1077#1088#1077#1075#1090#1080
        #1042#1110#1076#1084#1110#1085#1080#1090#1080
        #1054#1073#1085#1086#1074#1080#1090#1080)
      TabOrder = 1
    end
  end
  object SemestrDBEditEh: TDBEditEh
    Left = 508
    Top = 0
    Width = 29
    Height = 19
    DataField = 'SEMESTR'
    DataSource = testeditDM.SubjectDS
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Visible = True
  end
  object TestSect2sciensGB: TGroupBox
    Left = 396
    Top = 305
    Width = 421
    Height = 200
    Caption = #1042#1080#1073#1088#1072#1085#1110' '#1084#1086#1076#1091#1083#1110' '#1090#1077#1089#1090#1086#1074#1080#1093' '#1087#1080#1090#1072#1085#1100' '#1076#1083#1103' '#1073#1110#1083#1077#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    DesignSize = (
      421
      200)
    object Delsect2sciensSB: TSpeedButton
      Left = 303
      Top = 173
      Width = 115
      Height = 25
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080'!'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = Delsect2sciensSBClick
    end
    object Sect2SciensDBGridEh: TDBGridEh
      Left = 3
      Top = 14
      Width = 414
      Height = 158
      AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
      Anchors = [akLeft, akTop, akBottom]
      AutoFitColWidths = True
      ColumnDefValues.Title.Alignment = taCenter
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataSource = testeditDM.TSect2SCDS
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      FrozenCols = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight, dghDialogFind]
      ParentFont = False
      ParentShowHint = False
      RowHeight = 2
      RowLines = 2
      ShowHint = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      VertScrollBar.Tracking = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SCIENS_ID'
          Footer.Color = clYellow
          Footers = <>
          ReadOnly = True
          Width = 42
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'sc_semestr_search'
          Footer.Color = clYellow
          Footers = <>
          ReadOnly = True
          Width = 30
        end
        item
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'sc_name_search'
          Footer.Alignment = taRightJustify
          Footer.Color = clYellow
          Footer.Value = #1042#1089#1100#1086#1075#1086' '#1087#1080#1090#1072#1085#1100' '#1087#1086' '#1084#1086#1076#1091#1083#1102'->'
          Footer.ValueType = fvtStaticText
          Footers = <>
          ReadOnly = True
          Width = 265
        end
        item
          AutoFitColWidth = False
          ButtonStyle = cbsUpDown
          EditButtons = <>
          FieldName = 'ASKCOUNT'
          Footer.Color = clInfoBk
          Footer.FieldName = 'ASKCOUNT'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clRed
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 50
        end>
    end
    object Sect2SciensDBNav: TDBNavigator
      Left = 2
      Top = 173
      Width = 301
      Height = 25
      DataSource = testeditDM.TSect2SCDS
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbRefresh]
      Anchors = [akLeft, akRight, akBottom]
      Flat = True
      Hints.Strings = (
        #1053#1072' '#1087#1086#1095#1072#1090#1086#1082
        #1053#1072#1079#1072#1076
        #1042#1087#1077#1088#1077#1076
        #1042' '#1082#1110#1085#1077#1094#1100
        #1042#1089#1090#1072#1074#1080#1090#1080
        #1042#1080#1076#1072#1083#1080#1090#1080
        #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
        #1047#1073#1077#1088#1077#1075#1090#1080
        #1042#1110#1076#1084#1110#1085#1080#1090#1080
        #1054#1073#1085#1086#1074#1080#1090#1080)
      TabOrder = 1
    end
  end
  object ImageList1: TImageList
    Left = 524
    Top = 497
  end
end
