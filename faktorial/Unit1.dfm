object Form1: TForm1
  Left = 192
  Top = 124
  Width = 401
  Height = 270
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 96
    Top = 24
    Width = 13
    Height = 20
    Caption = 'N'
  end
  object Edit1: TEdit
    Left = 128
    Top = 24
    Width = 121
    Height = 28
    TabOrder = 0
  end
  object Button1: TButton
    Left = 272
    Top = 24
    Width = 81
    Height = 25
    Caption = 'HITUNG'
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 88
    Top = 80
    Width = 265
    Height = 105
    Caption = 'HASIL'
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 71
      Height = 20
      Caption = 'Faktorial'
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 58
      Height = 20
      Caption = 'Jumlah'
    end
    object Edit2: TEdit
      Left = 96
      Top = 24
      Width = 121
      Height = 28
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 96
      Top = 64
      Width = 121
      Height = 28
      TabOrder = 1
    end
  end
end
