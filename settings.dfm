object SettingsEditForm: TSettingsEditForm
  Left = 260
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1087#1088#1086#1075#1088#1072#1084#1080
  ClientHeight = 543
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel1: TButtonPanel
    Left = 0
    Top = 518
    Width = 654
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MaxHeight = 25
    Constraints.MinHeight = 25
    TabOrder = 0
    Buttons = [btOk, btCancel]
    OnButtonOkClick = ButtonPanel1ButtonOkClick
  end
  object DBSettingGB: TGroupBox
    Left = 8
    Top = 296
    Width = 640
    Height = 225
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103' '#1076#1086' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object ConnectDBSBut: TSpeedButton
      Left = 8
      Top = 172
      Width = 625
      Height = 25
      Caption = #1055#1110#1076#1082#1083#1102#1095#1080#1090#1080#1089#1103' '#1076#1086' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093'!'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = ConnectDBSButClick
    end
    object ChooseDBFileSBut: TSpeedButton
      Left = 428
      Top = 147
      Width = 205
      Height = 25
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1092#1072#1081#1083' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = ChooseDBFileSButClick
    end
    object AddServerSBut: TSpeedButton
      Left = 8
      Top = 147
      Width = 205
      Height = 25
      Caption = #1044#1086#1076#1072#1090#1080
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = AddServerSButClick
    end
    object DelServerSBut: TSpeedButton
      Left = 213
      Top = 147
      Width = 215
      Height = 25
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = DelServerSButClick
    end
    object DefaultServersSBut: TSpeedButton
      Left = 8
      Top = 197
      Width = 625
      Height = 25
      Caption = #1057#1087#1080#1089#1086#1082' '#1089#1077#1088#1074#1077#1088#1110#1074' '#1087#1086'-'#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1102
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = DefaultServersSButClick
    end
    object DatabasesListEditor: TValueListEditor
      Left = 8
      Top = 16
      Width = 625
      Height = 129
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = [keyEdit, keyAdd, keyDelete]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing, goTabs, goThumbTracking]
      ParentFont = False
      Strings.Strings = (
        #1051#1086#1082#1072#1083#1100#1085#1072' '#1073#1072#1079#1072' '#1076#1072#1085#1080#1093'=D:\DB\Java\'
        #1057#1077#1088#1074#1077#1088' '#1082#1072#1092#1077#1076#1088#1080' '#1084#1077#1076#1080#1095#1085#1086#1111' '#1110#1085#1092#1086#1088#1084#1072#1090#1080#1082#1080'=217.196.164.19:D:\DB\Java\'
        #1057#1077#1088#1074#1077#1088' '#1094#1077#1085#1090#1088#1091' '#1090#1077#1089#1090#1091#1074#1072#1085#1085#1103' '#1058#1044#1052#1059'=192.168.3.100:D:\DB\Java\'
        #1057#1077#1088#1074#1077#1088' '#1082#1072#1092'. '#1084#1077#1076#1110#1085#1092#1086#1088#1084#1072#1090#1080#1082#1080' ('#1079#1086#1074#1085'.)=10.21.0.193:D:\DB\Java\')
      TabOrder = 0
      TitleCaptions.Strings = (
        #1053#1072#1079#1074#1072' '#1089#1077#1088#1074#1077#1088#1091' ('#1092#1072#1081#1083#1091')'
        #1064#1083#1103#1093' '#1076#1086' '#1092#1072#1081#1083#1091' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1110)
      ColWidths = (
        266
        353)
    end
  end
  object AllSettingsGB: TGroupBox
    Left = 8
    Top = -1
    Width = 640
    Height = 297
    Caption = #1047#1072#1075#1072#1083#1100#1085#1110' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      640
      297)
    object DefaultSpeedButton: TSpeedButton
      Left = 8
      Top = 268
      Width = 625
      Height = 25
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1055#1086#1074#1077#1088#1085#1091#1090#1080' '#1089#1090#1072#1085#1076#1072#1088#1090#1085#1110' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = DefaultSpeedButtonClick
    end
    object EditorsSettingGB: TGroupBox
      Left = 8
      Top = 14
      Width = 305
      Height = 129
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1088#1077#1076#1072#1082#1090#1086#1088#1072' '#1090#1077#1082#1089#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 62
        Top = 100
        Width = 162
        Height = 13
        Caption = #1052#1110#1085#1110#1084#1072#1083#1100#1085#1080#1081' '#1088#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1072', '#1087#1090'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ClearAskFormatChB: TCheckBox
        Left = 8
        Top = 24
        Width = 257
        Height = 17
        Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1080#1090#1072#1085#1100' - '#1086#1095#1080#1097#1072#1090#1080' '#1092#1086#1088#1084#1072#1090' '#1072#1073#1079#1072#1094#1091
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object ClearAnswerFormatChB: TCheckBox
        Left = 8
        Top = 48
        Width = 273
        Height = 17
        Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1074#1110#1076#1087#1086#1074#1110#1076#1077#1081' - '#1086#1095#1080#1097#1072#1090#1080' '#1092#1086#1088#1084#1072#1090' '#1072#1073#1079#1072#1094#1091
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object DefFontSizeSpinEdit: TSpinEdit
        Left = 8
        Top = 96
        Width = 49
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 2
        Value = 11
      end
      object SetMinFontCheckBox: TCheckBox
        Left = 8
        Top = 72
        Width = 273
        Height = 17
        Caption = #1042#1089#1090#1072#1085#1086#1074#1083#1102#1074#1072#1090#1080' '#1084#1110#1085#1110#1084#1072#1083#1100#1085#1080#1081' '#1088#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1072
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 3
      end
    end
    object DefAskSettingGB: TGroupBox
      Left = 8
      Top = 146
      Width = 305
      Height = 57
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1085#1086#1074#1086#1075#1086' '#1087#1080#1090#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 60
        Top = 19
        Width = 200
        Height = 26
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1080#1090#1072#1085#1100' '#1087#1086' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1102' '#1076#1083#1103' '#1074#1110#1076#1082#1088#1080#1090#1080#1093' '#1087#1080#1090#1072#1085#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object DefOpenAskCountSpinEdit: TSpinEdit
        Left = 8
        Top = 24
        Width = 49
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 0
        Value = 5
      end
    end
    object WordSettingsGB: TGroupBox
      Left = 325
      Top = 14
      Width = 308
      Height = 251
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' Word:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label5: TLabel
        Left = 62
        Top = 226
        Width = 97
        Height = 13
        Caption = #1056#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1072', '#1087#1090'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ShowPersonChBox: TCheckBox
        Left = 8
        Top = 19
        Width = 257
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1088#1110#1079#1074#1080#1097#1072
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object ShowSignChBox: TCheckBox
        Left = 8
        Top = 39
        Width = 273
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1110#1076#1087#1080#1089#1091
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object wordFontsizeSpinEdit: TSpinEdit
        Left = 8
        Top = 222
        Width = 49
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 2
        Value = 11
      end
      object SetFontsizeChBox: TCheckBox
        Left = 8
        Top = 203
        Width = 273
        Height = 17
        Caption = #1042#1089#1090#1072#1085#1086#1074#1083#1102#1074#1072#1090#1080' '#1089#1090#1072#1085#1076#1072#1088#1090#1085#1080#1081' '#1088#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1072
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 3
      end
      object ShowGroupChBox: TCheckBox
        Left = 8
        Top = 59
        Width = 273
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1085#1086#1084#1077#1088#1091' '#1075#1088#1091#1087#1080
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 4
      end
      object ShowSpecChBox: TCheckBox
        Left = 8
        Top = 80
        Width = 273
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1085#1072#1079#1074#1080' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1086#1089#1090#1110
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 5
      end
      object ShowSubjChBox: TCheckBox
        Left = 8
        Top = 100
        Width = 273
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1085#1072#1079#1074#1080' '#1087#1088#1077#1076#1084#1077#1090#1091
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 6
      end
      object ShowFacultyChBox: TCheckBox
        Left = 8
        Top = 121
        Width = 273
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1085#1072#1079#1074#1080' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 7
      end
      object ShowSemesterChBox: TCheckBox
        Left = 8
        Top = 140
        Width = 273
        Height = 17
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' - '#1087#1086#1083#1077' '#1076#1083#1103' '#1085#1086#1084#1077#1088#1091' '#1089#1077#1084#1077#1089#1090#1088#1072
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 8
      end
      object ShowDateChBox: TCheckBox
        Left = 8
        Top = 161
        Width = 273
        Height = 17
        Caption = #1050#1086#1083#1086#1085#1090#1080#1090#1091#1083' - '#1076#1072#1090#1072' '#1076#1088#1091#1082#1091
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 9
      end
      object ShowPageChBox: TCheckBox
        Left = 8
        Top = 181
        Width = 273
        Height = 17
        Caption = #1050#1086#1083#1086#1085#1090#1080#1090#1091#1083' - '#1085#1086#1084#1077#1088#1072#1094#1110#1103' '#1089#1090#1086#1088#1110#1085#1086#1082
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 10
      end
    end
    object EtalonGroupBox: TGroupBox
      Left = 8
      Top = 208
      Width = 305
      Height = 57
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1077#1090#1072#1083#1086#1085#1085#1086#1111' '#1073#1072#1079#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label6: TLabel
        Left = 62
        Top = 28
        Width = 205
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1080#1090#1072#1085#1100' '#1085#1072' '#1086#1076#1085#1110#1081' '#1089#1090#1086#1088#1110#1085#1094#1110' '#1073#1110#1110#1083#1077#1090#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EtalonPageComboBox: TComboBox
        Left = 8
        Top = 24
        Width = 49
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        Text = '168'
        OnExit = EtalonPageComboBoxExit
        Items.Strings = (
          '168'
          '144')
      end
    end
  end
  object DatabaseOpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093' Interbase|*.gdb|'#1060#1072#1081#1083' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093' Firebird|*.fdb'
    Title = #1042#1080#1073#1110#1088' '#1092#1072#1081#1083#1091' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093
    Left = 624
    Top = 496
  end
end
