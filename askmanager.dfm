object MoveTestAsk: TMoveTestAsk
  Left = 241
  Top = 129
  BorderStyle = bsDialog
  Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1087#1080#1090#1072#1085#1100
  ClientHeight = 533
  ClientWidth = 752
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
  object ButtonPanel1: TButtonPanel
    Left = 0
    Top = 508
    Width = 752
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
  object FullSciensGB: TGroupBox
    Left = 0
    Top = 1
    Width = 752
    Height = 409
    Caption = #1055#1077#1088#1077#1083#1110#1082' '#1074#1089#1110#1093' '#1084#1086#1076#1091#1083#1110#1074' ('#1085#1072#1091#1082'. '#1085#1072#1087#1088'.):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      752
      409)
    object FullSciensDBGridEh1: TDBGridEh
      Left = 3
      Top = 15
      Width = 745
      Height = 366
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoFitColWidths = True
      ColumnDefValues.Title.Alignment = taCenter
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataSource = testeditDM.FullSciensDS
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
      OnTitleBtnClick = FullSciensDBGridEh1TitleBtnClick
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
          Width = 203
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
          Width = 86
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SC_NAME'
          Footers = <>
          STFilter.Visible = False
          Width = 228
        end
        item
          EditButtons = <>
          FieldName = 'SC_DESCR'
          Footers = <>
          STFilter.Visible = False
          Width = 104
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SEMESTR'
          Footers = <>
          Width = 40
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ASK_COUNT'
          Footers = <>
          Width = 55
        end>
    end
    object FullSciensDBNavigator: TDBNavigator
      Left = 2
      Top = 382
      Width = 740
      Height = 25
      DataSource = testeditDM.FullSciensDS
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
  object OptionsGB: TGroupBox
    Left = 0
    Top = 415
    Width = 753
    Height = 89
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1086#1087#1077#1088#1072#1094#1110#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 189
      Top = 46
      Width = 474
      Height = 32
      Caption = 
        '* '#1071#1082#1097#1086' '#1086#1076#1085#1077' '#1079' '#1074#1080#1076#1110#1083#1077#1085#1080#1093' '#1087#1080#1090#1072#1085#1100' '#1074#1093#1086#1076#1080#1090#1100' '#1074' '#1073#1110#1083#1077#1090' - '#1076#1083#1103' '#1085#1100#1086#1075#1086' '#1072#1074#1090#1086#1084 +
        #1072#1090#1080#1095#1085#1086' '#1074#1080#1082#1086#1085#1091#1102#1090#1100#1089#1103' '#1086#1087#1077#1088#1072#1094#1110#1111' "'#1082#1086#1087#1110#1102#1074#1072#1085#1085#1103'" + "'#1087#1086#1084#1110#1089#1090#1080#1090#1080' '#1074' '#1072#1088#1093#1110#1074'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object MoveOptionsRG: TRadioGroup
      Left = 8
      Top = 16
      Width = 177
      Height = 64
      Caption = #1052#1077#1090#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object CopyRBut: TRadioButton
      Left = 16
      Top = 32
      Width = 153
      Height = 17
      Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1087#1080#1090#1072#1085#1085#1103
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object MoveRBut: TRadioButton
      Left = 16
      Top = 56
      Width = 161
      Height = 17
      Caption = #1055#1077#1088#1077#1084#1110#1089#1090#1080#1090#1080' '#1087#1080#1090#1072#1085#1085#1103'*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
end
