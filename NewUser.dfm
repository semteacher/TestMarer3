object NewUserForm: TNewUserForm
  Left = 363
  Top = 286
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1080#1081' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095
  ClientHeight = 277
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 11
    Width = 162
    Height = 16
    Caption = #1030#1084'"'#1103' '#1076#1083#1103' '#1074#1093#1086#1076#1091' ('#1083#1086#1075#1110#1085'):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 43
    Width = 60
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 75
    Width = 185
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100' ('#1087#1110#1076#1090#1074#1077#1088#1076#1077#1078#1085#1085#1103'):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 107
    Width = 75
    Height = 16
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 139
    Width = 33
    Height = 16
    Caption = #1030#1084'"'#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 171
    Width = 94
    Height = 16
    Caption = #1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 1
    Top = 205
    Width = 200
    Height = 16
    Caption = #1056#1086#1083#1100' ('#1087#1088#1072#1074#1072') '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LoginEdit: TEdit
    Left = 200
    Top = 8
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object UserPassMaskEdit: TMaskEdit
    Left = 200
    Top = 40
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object ButtonPanel1: TButtonPanel
    Left = 0
    Top = 252
    Width = 384
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MaxHeight = 25
    Constraints.MinHeight = 25
    TabOrder = 7
    Buttons = [btOk, btCancel]
    OnButtonOkClick = ButtonPanel1ButtonOkClick
  end
  object ConfirmPassMaskEdit: TMaskEdit
    Left = 200
    Top = 72
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object LastNameEdit: TEdit
    Left = 199
    Top = 104
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = #1055#1088#1110#1079#1074#1080#1097#1077
  end
  object FirstNameEdit: TEdit
    Left = 199
    Top = 136
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = #1030#1084'"'#1103
  end
  object MiddleNameEdit: TEdit
    Left = 199
    Top = 168
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = #1055#1086'-'#1073#1072#1090#1100#1086#1082#1086#1074#1110
  end
  object UserRoleCB: TComboBox
    Left = 200
    Top = 200
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 6
  end
end
