object FormCourseCreator: TFormCourseCreator
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New Course'
  ClientHeight = 82
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit_Id: TLabeledEdit
    Left = 8
    Top = 24
    Width = 65
    Height = 21
    EditLabel.Width = 10
    EditLabel.Height = 13
    EditLabel.Caption = 'Id'
    TabOrder = 0
  end
  object LabeledEdit_Name: TLabeledEdit
    Left = 79
    Top = 24
    Width = 203
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Name'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 51
    Width = 274
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = Button1Click
  end
end
