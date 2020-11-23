object Form1: TForm1
  Left = 193
  Top = 117
  Width = 561
  Height = 197
  BorderIcons = []
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 112
    Top = 64
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 112
    Top = 96
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 112
    Top = 128
    Width = 193
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 320
    Top = 64
    Width = 129
    Height = 25
    Caption = 'CELCIUS'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 96
    Width = 129
    Height = 25
    Caption = 'KHELVIN'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 320
    Top = 128
    Width = 129
    Height = 25
    Caption = 'FAHRENHEIT'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 112
    Top = 8
    Width = 337
    Height = 49
    Caption = 'CLEAR'
    TabOrder = 6
    OnClick = Button4Click
  end
end
