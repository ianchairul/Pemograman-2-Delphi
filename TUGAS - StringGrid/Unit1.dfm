object Form1: TForm1
  Left = 325
  Top = 34
  Width = 793
  Height = 672
  Caption = 'NILAI MAHASISWA'
  Color = clAqua
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'News706 BT'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 48
    Top = 72
    Width = 20
    Height = 14
    Caption = 'NIM'
  end
  object Label2: TLabel
    Left = 48
    Top = 112
    Width = 30
    Height = 14
    Caption = 'Nama'
  end
  object Label3: TLabel
    Left = 48
    Top = 152
    Width = 27
    Height = 14
    Caption = 'U T S'
  end
  object Label4: TLabel
    Left = 48
    Top = 192
    Width = 28
    Height = 14
    Caption = 'U A S'
  end
  object Label5: TLabel
    Left = 48
    Top = 232
    Width = 37
    Height = 14
    Caption = 'TUGAS'
  end
  object enim: TEdit
    Left = 112
    Top = 72
    Width = 153
    Height = 22
    TabOrder = 0
    OnChange = enimChange
    OnClick = enimChange
    OnEnter = enimChange
    OnKeyPress = Edit1KeyPress
  end
  object enama: TEdit
    Left = 112
    Top = 112
    Width = 241
    Height = 22
    TabOrder = 1
    OnChange = enamaChange
    OnClick = enamaChange
    OnEnter = enamaChange
    OnKeyPress = enamaKeyPress
  end
  object euts: TEdit
    Left = 112
    Top = 152
    Width = 73
    Height = 22
    TabOrder = 2
    OnChange = eutsChange
    OnClick = eutsChange
    OnEnter = eutsChange
    OnKeyPress = eutsKeyPress
  end
  object euas: TEdit
    Left = 112
    Top = 192
    Width = 73
    Height = 22
    TabOrder = 3
    OnChange = euasChange
    OnClick = euasChange
    OnEnter = euasChange
    OnKeyPress = euasKeyPress
  end
  object etugas: TEdit
    Left = 112
    Top = 232
    Width = 73
    Height = 22
    TabOrder = 4
    OnChange = etugasChange
    OnClick = etugasChange
    OnEnter = etugasChange
    OnKeyPress = etugasKeyPress
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 264
    Width = 713
    Height = 273
    Color = clMoneyGreen
    TabOrder = 5
  end
  object Button2: TButton
    Left = 584
    Top = 552
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 135
    Top = 551
    Width = 75
    Height = 25
    Caption = 'Sortir'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 49
    BorderStyle = bsSingle
    Caption = 'Program Data Nilai Mahasiwa'
    Color = clSilver
    TabOrder = 8
  end
  object Panel2: TPanel
    Left = 0
    Top = 592
    Width = 777
    Height = 41
    BorderStyle = bsSingle
    Caption = 'Selamat Datang'
    Color = clSilver
    TabOrder = 9
  end
end
