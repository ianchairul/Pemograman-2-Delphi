object Form1: TForm1
  Left = 249
  Top = 177
  Width = 682
  Height = 480
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
  object Label1: TLabel
    Left = 328
    Top = 80
    Width = 210
    Height = 25
    Caption = 'Kalkulator Sederhana'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 208
    Top = 120
    Width = 76
    Height = 16
    Caption = 'Bilangan A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 208
    Top = 152
    Width = 76
    Height = 16
    Caption = 'Bilangan B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 208
    Top = 184
    Width = 37
    Height = 16
    Caption = 'Hasil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 304
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 304
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 304
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 440
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Jumlah'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Kurang'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 280
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Bagi'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 360
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Kali'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 280
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 360
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 8
    OnClick = Button6Click
  end
  object XPManifest1: TXPManifest
    Left = 600
    Top = 88
  end
end
