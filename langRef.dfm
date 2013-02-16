object LangRefForm: TLangRefForm
  Left = 188
  Top = 191
  BorderStyle = bsDialog
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' "'#1052#1086#1074#1080' '#1090#1077#1089#1090#1110#1074'"'
  ClientHeight = 266
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LibLangDBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 802
    Height = 214
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColumnDefValues.Title.Alignment = taCenter
    DataSource = testeditDM.LangDS
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
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        EditButtons = <>
        FieldName = 'LANG_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PERSON_TIT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SIGN_TIT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'GROUP_TIT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SPEC_TIT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUBJ_TIT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'FACULTY_TIT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SEMESTR_TIT'
        Footers = <>
      end>
  end
  object ButtonPanel1: TButtonPanel
    Left = 0
    Top = 241
    Width = 802
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MaxHeight = 25
    Constraints.MinHeight = 25
    TabOrder = 1
    Buttons = [btOk]
    OnButtonOkClick = ButtonPanel1ButtonOkClick
  end
  object LibLangDBNavigator: TDBNavigator
    Left = 0
    Top = 216
    Width = 802
    Height = 25
    DataSource = testeditDM.LangDS
    Align = alBottom
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
    TabOrder = 2
  end
end
