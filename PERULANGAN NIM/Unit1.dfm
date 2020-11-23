object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 329
    Height = 281
    Caption = 'GroupBox1'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 112
      Height = 13
      Caption = 'JUMLAH MAHASISWA'
    end
    object Edit1: TEdit
      Left = 152
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object ListBox1: TListBox
      Left = 16
      Top = 80
      Width = 121
      Height = 97
      ItemHeight = 13
      TabOrder = 1
    end
    object Button1: TButton
      Left = 208
      Top = 40
      Width = 75
      Height = 25
      Caption = 'OKE'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 24
      Top = 200
      Width = 75
      Height = 25
      Caption = 'HAPUS'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 136
      Top = 200
      Width = 75
      Height = 25
      Caption = 'EXIT'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
end
