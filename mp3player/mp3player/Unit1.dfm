object Form1: TForm1
  Left = 476
  Top = 99
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MINAMP'
  ClientHeight = 527
  ClientWidth = 831
  Color = clNone
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object MediaPlayer1: TMediaPlayer
    Left = 488
    Top = 280
    Width = 253
    Height = 25
    TabOrder = 7
  end
  object lvPlaylist: TListView
    Left = 392
    Top = 80
    Width = 433
    Height = 441
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clWhite
    Columns = <
      item
        Width = 0
      end
      item
        Alignment = taCenter
      end
      item
        Width = 257
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = PopupMenu1
    ShowColumnHeaders = False
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawItem = lvPlaylistAdvancedCustomDrawItem
    OnDblClick = lvPlaylistDblClick
    OnDragDrop = lvPlaylistDragDrop
    OnDragOver = lvPlaylistDragOver
  end
  object mplayer: TMediaPlayer
    Left = 528
    Top = 440
    Width = 29
    Height = 30
    VisibleButtons = [btPlay]
    Visible = False
    TabOrder = 1
    OnNotify = mplayerNotify
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 385
    Height = 105
    Color = clAppWorkSpace
    TabOrder = 2
    object pnJudul: TPanel
      Left = 8
      Top = 8
      Width = 273
      Height = 33
      BevelOuter = bvNone
      Color = clTeal
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object lbJudul: TLabel
        Left = 8
        Top = 8
        Width = 68
        Height = 16
        Caption = 'Judul Lagu'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnWaktu: TPanel
      Left = 288
      Top = 8
      Width = 89
      Height = 33
      BevelOuter = bvNone
      Caption = '00:00'
      Color = clBlack
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object ScrollBar1: TScrollBar
      Left = 8
      Top = 45
      Width = 369
      Height = 20
      PageSize = 0
      TabOrder = 2
      OnScroll = ScrollBar1Scroll
    end
    object Panel2: TPanel
      Left = 200
      Top = 72
      Width = 177
      Height = 33
      BevelOuter = bvNone
      Color = 16752706
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      object Label1: TLabel
        Left = 12
        Top = 10
        Width = 42
        Height = 13
        Caption = 'Volume'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object barVolume: TTrackBar
        Left = 56
        Top = 7
        Width = 121
        Height = 17
        Hint = 'Volume'
        Max = 100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = barVolumeChange
      end
      object cekRepeat: TCheckBox
        Left = 176
        Top = 9
        Width = 17
        Height = 17
        Caption = 'Kembali ke awal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object btPlay: TButton
      Left = 8
      Top = 72
      Width = 41
      Height = 25
      Caption = 'Play'
      TabOrder = 4
      OnClick = btPlayClick
    end
    object Btstop: TButton
      Left = 56
      Top = 72
      Width = 41
      Height = 25
      Caption = 'Stop'
      TabOrder = 5
      OnClick = btStopClick
    end
    object btPrev: TButton
      Left = 104
      Top = 72
      Width = 41
      Height = 25
      Caption = 'Prev'
      TabOrder = 6
      OnClick = btPrevClick
    end
    object btNext: TButton
      Left = 152
      Top = 72
      Width = 41
      Height = 25
      Caption = 'Next'
      TabOrder = 7
      OnClick = btNextClick
    end
  end
  object Panel3: TPanel
    Left = 392
    Top = 8
    Width = 433
    Height = 73
    Color = clTeal
    TabOrder = 3
    object btOpen: TButton
      Left = 0
      Top = 48
      Width = 57
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btOpenClick
    end
    object btLoadpls: TButton
      Left = 64
      Top = 48
      Width = 81
      Height = 25
      Caption = 'Load Playlist'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btLoadplsClick
    end
    object btSimpanpls: TButton
      Left = 150
      Top = 48
      Width = 81
      Height = 25
      Caption = 'SAVE LIST'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btSimpanplsClick
    end
    object DELETE: TButton
      Left = 240
      Top = 48
      Width = 73
      Height = 25
      Caption = 'DELETE'
      TabOrder = 3
    end
    object Panel6: TPanel
      Left = 8
      Top = 0
      Width = 425
      Height = 41
      Caption = 'UNSAVED PLAYLIST'
      Color = clActiveCaption
      TabOrder = 4
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 112
    Width = 377
    Height = 409
    Color = clGray
    TabOrder = 4
    object Label2: TLabel
      Left = 216
      Top = 176
      Width = 35
      Height = 14
      Caption = 'Label2'
    end
    object Labell: TLabel
      Left = 216
      Top = 200
      Width = 30
      Height = 14
      Caption = 'Labell'
    end
    object ListBox1: TListBox
      Left = 8
      Top = 80
      Width = 361
      Height = 313
      ItemHeight = 14
      TabOrder = 0
    end
    object ADDNEW: TButton
      Left = 8
      Top = 48
      Width = 65
      Height = 33
      Caption = 'ADD NEW'
      TabOrder = 1
    end
    object DELETEPLY: TButton
      Left = 80
      Top = 48
      Width = 75
      Height = 33
      Caption = 'DELETE'
      TabOrder = 2
    end
    object ListView1: TListView
      Left = -56
      Top = 72
      Width = 433
      Height = 377
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clWhite
      Columns = <
        item
          Width = 0
        end
        item
          Alignment = taCenter
        end
        item
          Width = 257
        end>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      PopupMenu = PopupMenu1
      ShowColumnHeaders = False
      TabOrder = 3
      ViewStyle = vsReport
      OnAdvancedCustomDrawItem = lvPlaylistAdvancedCustomDrawItem
      OnDblClick = lvPlaylistDblClick
      OnDragDrop = lvPlaylistDragDrop
      OnDragOver = lvPlaylistDragOver
    end
    object FileListBox1: TFileListBox
      Left = 157
      Top = 16
      Width = 220
      Height = 393
      ItemHeight = 13
      Mask = '*.wav;*.mid;*.mp3'
      TabOrder = 4
      OnChange = Filelistboxchange
    end
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 128
    Width = 153
    Height = 20
    TabOrder = 5
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 160
    Width = 153
    Height = 361
    ItemHeight = 16
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Mp3 Files|*.Mp3'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Tambahkan lagu'
    Left = 568
    Top = 440
  end
  object tmJudul: TTimer
    Interval = 20
    OnTimer = tmJudulTimer
    Left = 696
    Top = 440
  end
  object tmProgress: TTimer
    Interval = 500
    OnTimer = tmProgressTimer
    Left = 664
    Top = 440
  end
  object PopupMenu1: TPopupMenu
    Left = 632
    Top = 440
    object ambahFile1: TMenuItem
      Caption = 'Tambah File'
      ShortCut = 16463
      OnClick = ambahFile1Click
    end
    object Hapus1: TMenuItem
      Caption = 'Hapus'
      ShortCut = 46
      OnClick = Hapus1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SimpanPlaylist1: TMenuItem
      Caption = 'Simpan Playlist'
      OnClick = SimpanPlaylist1Click
    end
    object LoadPlaylist1: TMenuItem
      Caption = 'Load Playlist'
      OnClick = LoadPlaylist1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.lst'
    FileName = 'MyPlaylist'
    Filter = 'Playlist Files|*.lst'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Simpan playlist'
    Left = 600
    Top = 440
  end
  object MainMenu1: TMainMenu
    Left = 728
    Top = 440
    object file1: TMenuItem
      Caption = 'file'
      object open1: TMenuItem
        Caption = 'open'
        OnClick = open1Click
      end
      object play1: TMenuItem
        Caption = 'play'
        OnClick = play1Click
      end
      object next1: TMenuItem
        Caption = 'next'
        OnClick = next1Click
      end
      object prev1: TMenuItem
        Caption = 'prev'
        OnClick = prev1Click
      end
      object stop1: TMenuItem
        Caption = 'stop'
        OnClick = stop1Click
      end
      object exit1: TMenuItem
        Caption = 'exit'
        OnClick = exit1Click
      end
    end
    object options1: TMenuItem
      Caption = 'options'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 488
    Top = 440
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 288
  end
end
