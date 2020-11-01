object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Proxy Configuration'
  ClientHeight = 181
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit_Uri: TLabeledEdit
    Left = 8
    Top = 32
    Width = 242
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'URL'
    TabOrder = 0
  end
  object LabeledEdit_Port: TLabeledEdit
    Left = 256
    Top = 32
    Width = 51
    Height = 21
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Port'
    NumbersOnly = True
    TabOrder = 1
  end
  object LabeledEdit_User: TLabeledEdit
    Left = 8
    Top = 72
    Width = 299
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'User'
    TabOrder = 2
  end
  object LabeledEdit_Password: TLabeledEdit
    Left = 8
    Top = 112
    Width = 299
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Password'
    TabOrder = 3
  end
  object Button_Save: TButton
    Left = 232
    Top = 139
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = Button_SaveClick
  end
  object Button_Refresh: TButton
    Left = 8
    Top = 145
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 5
    OnClick = Button_RefreshClick
  end
end
