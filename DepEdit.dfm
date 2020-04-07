object DepEditForm: TDepEditForm
  Left = 248
  Top = 127
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1089#1087#1080#1089#1082#1091' '#1082#1072#1092#1077#1076#1088' ('#1087#1110#1076#1088#1086#1079#1076#1110#1083#1110#1074')'
  ClientHeight = 333
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    592
    333)
  PixelsPerInch = 96
  TextHeight = 13
  object NewPaoerSpeedButton: TSpeedButton
    Left = 0
    Top = 10
    Width = 198
    Height = 25
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object DelPaperSpeedButton: TSpeedButton
    Left = 0
    Top = 10
    Width = 198
    Height = 25
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object AddDepSpeedButton: TSpeedButton
    Left = 0
    Top = 280
    Width = 296
    Height = 25
    Anchors = [akLeft, akTop, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1080' '#1082#1072#1092#1077#1076#1088#1091' ('#1087#1110#1076#1088#1086#1079#1076#1110#1083')!'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    OnClick = AddDepSpeedButtonClick
  end
  object DelDepSpeedButton: TSpeedButton
    Left = 296
    Top = 280
    Width = 296
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1082#1072#1092#1077#1076#1088#1091' ('#1087#1110#1076#1088#1086#1079#1076#1110#1083')!'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    OnClick = DelDepSpeedButtonClick
  end
  object LibDepDBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 593
    Height = 254
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    ColumnDefValues.Title.Alignment = taCenter
    DataSource = testeditDM.DepartDS
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FrozenCols = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    VertScrollBar.Tracking = True
    Columns = <
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'DEPID'
        Footers = <>
        ReadOnly = True
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'DEPNAME'
        Footers = <>
      end>
  end
  object LibDepDBNavigator: TDBNavigator
    Left = 0
    Top = 255
    Width = 592
    Height = 25
    DataSource = testeditDM.DepartDS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
  object ButtonPanel1: TButtonPanel
    Left = 0
    Top = 308
    Width = 592
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MaxHeight = 25
    Constraints.MinHeight = 25
    TabOrder = 2
    Buttons = [btOk]
    OnButtonOkClick = ButtonPanel1ButtonOkClick
  end
end
