object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Main'
  ClientHeight = 82
  ClientWidth = 193
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button_ConfigurateProxy: TButton
    Left = 8
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Configurate Proxy'
    TabOrder = 0
    OnClick = Button_ConfigurateProxyClick
  end
  object Button_CreateCourse: TButton
    Left = 8
    Top = 48
    Width = 177
    Height = 25
    Caption = 'Create Course'
    TabOrder = 1
    OnClick = Button_CreateCourseClick
  end
end
