unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, MPlayer, Menus, MMSystem, Buttons,
  FileCtrl;

const
  // Untuk set volume
  MCI_SETAUDIO = $0873;
  MCI_DGV_SETAUDIO_VOLUME = $4002;
  MCI_DGV_SETAUDIO_ITEM = $00800000;
  MCI_DGV_SETAUDIO_VALUE = $01000000;
  MCI_DGV_STATUS_VOLUME = $4019;

type
  // Untuk set volume
  MCI_DGV_SETAUDIO_PARMS = record
    dwCallback: DWORD;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PChar;
    lpstrQuality: PChar;
  end;
  MCI_STATUS_PARMS = record
    dwCallback: DWORD;
    dwReturn: DWORD;
    dwItem: DWORD;
    dwTrack: DWORD;
  end;
  // -----------------------------

  TForm1 = class(TForm)
    lvPlaylist: TListView;
    OpenDialog1: TOpenDialog;
    mplayer: TMediaPlayer;
    tmJudul: TTimer;
    tmProgress: TTimer;
    PopupMenu1: TPopupMenu;
    ambahFile1: TMenuItem;
    Hapus1: TMenuItem;
    N1: TMenuItem;
    SimpanPlaylist1: TMenuItem;
    LoadPlaylist1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    pnJudul: TPanel;
    lbJudul: TLabel;
    pnWaktu: TPanel;
    ScrollBar1: TScrollBar;
    Panel2: TPanel;
    Label1: TLabel;
    barVolume: TTrackBar;
    cekRepeat: TCheckBox;
    btPlay: TButton;
    Btstop: TButton;
    btPrev: TButton;
    btNext: TButton;
    Panel3: TPanel;
    btOpen: TButton;
    btLoadpls: TButton;
    btSimpanpls: TButton;
    Panel4: TPanel;
    DELETE: TButton;
    ListBox1: TListBox;
    ADDNEW: TButton;
    DELETEPLY: TButton;
    Panel6: TPanel;
    MainMenu1: TMainMenu;
    file1: TMenuItem;
    options1: TMenuItem;
    PopupMenu2: TPopupMenu;
    open1: TMenuItem;
    play1: TMenuItem;
    next1: TMenuItem;
    prev1: TMenuItem;
    stop1: TMenuItem;
    exit1: TMenuItem;
    ListView1: TListView;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Timer1: TTimer;
    Label2: TLabel;
    Labell: TLabel;
    MediaPlayer1: TMediaPlayer;

    // procedure/function tambahan
    function FormatWaktu(milidetik: integer): string;
    function TambahListLagu(namafile: string): boolean;
    function TambahplaylistListLagu(namafile: string): boolean;
    procedure AturIndexLagu;
    function MainkanLagu: boolean;
    procedure LaguBerikut;
    procedure LaguSebelum;
    procedure SimpanPlaylist(namafile: string);
    procedure LoadPlaylist(namafile: string);
    // ------------------------------------------------

    procedure btOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPlayClick(Sender: TObject);
    procedure lvPlaylistDblClick(Sender: TObject);
    procedure tmJudulTimer(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure tmProgressTimer(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure btNextClick(Sender: TObject);
    procedure Hapus1Click(Sender: TObject);
    procedure ambahFile1Click(Sender: TObject);
    procedure barVolumeChange(Sender: TObject);
    procedure btPrevClick(Sender: TObject);
    procedure mplayerNotify(Sender: TObject);
    procedure lvPlaylistDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvPlaylistDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SimpanPlaylist1Click(Sender: TObject);
    procedure LoadPlaylist1Click(Sender: TObject);
    procedure btSimpanplsClick(Sender: TObject);
    procedure btLoadplsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvPlaylistAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure open1Click(Sender: TObject);
    procedure play1Click(Sender: TObject);
    procedure next1Click(Sender: TObject);
    procedure prev1Click(Sender: TObject);
    procedure stop1Click(Sender: TObject);
   procedure Filelistboxchange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure exit1Click(Sender: TObject);

  protected
    // Drag & drop file from explorer
    procedure WMDROPFILES(var msg : TWMDropFiles); message WM_DROPFILES;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    // -----------------------------------------------------------------
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  idxLagu: integer;

implementation

{$R *.dfm}

uses ShellApi;

{ Set Volume, range 0 - 1000
  sumber: http://delphi.about.com/od/adptips2006/qt/mediaplayer_vol.htm }
procedure MPSetVolume(MP: TMediaPlayer; Volume: Integer) ;
var
  p: MCI_DGV_SETAUDIO_PARMS;
begin
  p.dwCallback := 0;
  p.dwItem := MCI_DGV_SETAUDIO_VOLUME;
  p.dwValue := Volume;
  p.dwOver := 0;
  p.lpstrAlgorithm := nil;
  p.lpstrQuality := nil;
  mciSendCommand(MP.DeviceID, MCI_SETAUDIO, MCI_DGV_SETAUDIO_VALUE or MCI_DGV_SETAUDIO_ITEM, Cardinal(@p)) ;
end;

function MPGetVolume(MP: TMediaPlayer): Integer;
var
  p: MCI_STATUS_PARMS;
begin
  p.dwCallback := 0;
  p.dwItem := MCI_DGV_STATUS_VOLUME;
  mciSendCommand(MP.DeviceID, MCI_STATUS, MCI_STATUS_ITEM, Cardinal(@p)) ;
  Result := p.dwReturn; end;



// -----------------------------------------------------------------------------

// Drag & drop file from explorer
procedure TForm1.WMDROPFILES(var msg: TWMDropFiles);
var
  i, fileCount: integer;
  namafile: array[0..MAX_PATH] of char;
begin
  fileCount:=DragQueryFile(msg.Drop, $FFFFFFFF, namafile, MAX_PATH);
  for i := 0 to fileCount - 1 do begin
    DragQueryFile(msg.Drop, i, namafile, MAX_PATH);
    TambahListLagu(namafile);
  end;
  DragFinish(msg.Drop);
end;

procedure TForm1.CreateWnd;
begin
  inherited;
  DragAcceptFiles(Handle, True);
end;

procedure TForm1.DestroyWnd;
begin
  DragAcceptFiles(WindowHandle, false);
  inherited;
end;
// -----------------------------------------------------------------------------

function TForm1.FormatWaktu(milidetik: integer): string;
var
  menit, detik: integer;
begin
  detik := milidetik div 1000;
  menit := detik div 60;
  detik := detik - (menit*60);
  Result := IntToStr(menit) + ':' + IntToStr(detik);
  Result := Format('%.*d:%.*d', [2, menit, 2, detik]);
end;

function TForm1.TambahListLagu(namafile: string): boolean;
var
  i: integer;
begin
  Result := True;

  // Jika extensi file bukan .mp3, jangan tambahkan
  if ExtractFileExt(namafile) <> '.mp3' then Exit;

  // Cek apakah file sudah ada di list
  for i:=0 to lvPlaylist.Items.Count-1 do begin
    if lvPlaylist.Items[i].Caption = namafile then begin
      lvPlaylist.ClearSelection;
      lvPlaylist.Items[i].Selected := True;
      Exit;
    end;
  end;

  // Jika lagu sedang aktif, stop dulu
  if (mplayer.Mode = mpPaused) or (mplayer.Mode = mpPlaying) then btStop.Click;

  mplayer.Close;
  mplayer.FileName := namafile;
  try
    mplayer.Open;
    with lvPlaylist.Items.Add do begin
      Caption := namafile;
      SubItems.Add(FormatWaktu(mplayer.Length));
      SubItems.Add( ChangeFileExt( ExtractFileName(namafile), '' ) );
    end;
  except
    Result := False;
  end;
end;

function TForm1.TambahplaylistListLagu(namafile: string): boolean;
var
  i: integer;
begin
  Result := True;

  // Jika extensi file bukan .lst, jangan tambahkan
  if ExtractFileExt(namafile) <> '.lst' then Exit;

  // Cek apakah file sudah ada di list
  for i:=0 to listview1.Items.Count-1 do begin
    if listview1.Items[i].Caption = namafile then begin
      listview1.ClearSelection;
      listview1.Items[i].Selected := True;
      Exit;
    end;
  end;

    with listview1.Items.Add do begin
      Caption := namafile;

      SubItems.Add( ChangeFileExt( ExtractFileName(namafile), '' ) );
    end;

  end;

// perbaiki index lagu saat ada item yg dihapus atau diubah urutan }
procedure TForm1.AturIndexLagu;
var
  i: integer;
begin
  if (mplayer.FileName <> '') and (lvPlaylist.Items.Count > 0) then begin
    for i:=0 to lvPlaylist.Items.Count-1 do begin
      if lvPlaylist.Items[i].Caption = mplayer.FileName then begin
        idxLagu := i;
        Exit;
      end;
    end;
    idxLagu := 0;
  end;
end;

function TForm1.MainkanLagu: boolean;
begin
  Result := False;
  if lvPlaylist.Items.Count < 1 then Exit;
  lbJudul.Caption := lvPlaylist.Items[idxLagu].SubItems[1];
  pnWaktu.Caption := lvPlaylist.Items[idxLagu].SubItems[0];
  mplayer.Close;
  mplayer.FileName := lvPlaylist.Items[idxLagu].Caption;
  lvPlaylist.ClearSelection;
  lvPlaylist.Items[idxLagu].Selected := True;
  try
    mplayer.Open;
    lvPlaylist.Refresh;
    lbJudul.Left := pnJudul.Left + pnJudul.Width;
    ScrollBar1.Max := mplayer.Length;
    tmJudul.Enabled := True;
    tmProgress.Enabled := True;
    Sleep(500);
    mplayer.Play;
    btPlay.Caption := 'Pause';
    Result := True
  except
    Sleep(1000);
    btNext.Click;
  end;
end;

procedure TForm1.LaguBerikut;
begin
  if idxLagu < lvPlaylist.Items.Count-1 then
    idxLagu := idxLagu + 1
  else
    idxLagu := 0;
  MainkanLagu;
end;

procedure TForm1.SimpanPlaylist(namafile: string);
var
  f: textfile;
  i: integer;
begin
  AssignFile(f, namafile);
  Rewrite(f);
  for i:=0 to lvPlaylist.Items.Count-1 do
    Writeln(f, lvPlaylist.Items[i].Caption);
  CloseFile(f);
end;

procedure TForm1.LoadPlaylist(namafile: string);
var
  f: textfile;
  txt: string;
begin
  if not FileExists(namafile) then Exit;
  lvPlaylist.Items.Clear;
  AssignFile(f, namafile);
  Reset(f);
  while not EOF(f) do begin
    Readln(f, txt);
    TambahListLagu(txt);
  end;
  CloseFile(f);
end;

procedure TForm1.LaguSebelum;
begin
  if idxLagu <= 0 then
    idxLagu := lvPlaylist.Items.Count-1
  else
    idxLagu := idxLagu - 1;
  MainkanLagu;
end;

procedure TForm1.btOpenClick(Sender: TObject);
var
  i: integer;
  namafile, errorMsg: string;
  jumError: integer;
begin
  OpenDialog1.Title := 'Tambahkan lagu';
  OpenDialog1.Filter := 'Mp3 Files|*.mp3';
  OpenDialog1.DefaultExt := '.mp3';
  if OpenDialog1.Execute then begin
    errorMsg := '';
    jumError := 0;
    for i:=0 to OpenDialog1.Files.Count-1 do begin
      namafile := OpenDialog1.Files[i];
      if not TambahListLagu(namafile) then begin
        Inc(jumError);
        errorMsg := errorMsg + #13 + namafile;
      end;
    end;
    if jumError > 0 then begin
      errorMsg := IntToStr(jumError)+ ' file tidak bisa ditambahkan :' +errorMsg;
      MessageDlg(errorMsg, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Set property default saat aplikasi dijalankan
  with lvPlaylist do begin
    DragMode := dmAutomatic;
    RowSelect := True;
    MultiSelect := True;
    ViewStyle := vsReport;
  end;
  with mplayer do begin
    TimeFormat := tfMilliseconds;
    Notify := True;
  end;
  with barVolume do begin
    Min := 0;
    Max := 1000;
    Position := MPGetVolume(mplayer);
  end;
  lbJudul.Caption := '';
  tmJudul.Enabled := False;
  pnWaktu.Caption := '00:00';
  tmProgress.Enabled := False;
  idxLagu := 0;

  // Load list lagu sebelumnya jika ada
  LoadPlaylist(ExtractFilePath(Application.ExeName) + 'listLagu.lst');
end;

procedure TForm1.btPlayClick(Sender: TObject);
begin
  if btPlay.Caption = 'Play' then begin
    if mplayer.Mode = mpPaused then begin
      mplayer.Pause;
    end else
      MainkanLagu;
    btPlay.Caption := 'Pause';
  end else begin
    mplayer.Pause;
    lbJudul.Font.Color := clRed;
    lbJudul.Caption := lbJudul.Caption + ' (Paused)';
    pnWaktu.Enabled := False;
    btPlay.Caption  := 'Play';
  end;
end;

procedure TForm1.lvPlaylistDblClick(Sender: TObject);
begin
  if lvPlaylist.Items.Count < 1 then Exit;
  idxLagu := lvPlaylist.Selected.Index;
  MainkanLagu;
end;

procedure TForm1.tmJudulTimer(Sender: TObject);
begin
  if (lbJudul.Left + lbJudul.Width) <= 0 then
    lbJudul.Left := pnJudul.Left + pnJudul.Width else
    lbJudul.Left := lbJudul.Left - 1;
end;

procedure TForm1.btStopClick(Sender: TObject);
begin
  mplayer.Stop;
  tmProgress.Enabled := False;
  tmJudul.Enabled := False;
  pnWaktu.Caption := FormatWaktu(mplayer.Length);
  ScrollBar1.Position := 0;
  lbJudul.Left := 8;
  btPlay.Caption := 'Play';
end;

procedure TForm1.tmProgressTimer(Sender: TObject);
begin
  if mplayer.Error <> 0 then Exit;
  if mplayer.Position < mplayer.Length then begin
    ScrollBar1.Position := mplayer.Position;
    pnWaktu.Caption := FormatWaktu(mplayer.Length - mplayer.Position);
  end else begin
    if (idxLagu = lvPlaylist.Items.Count - 1) and
    // jika sudah di list terakhir dan checkbox "kembali ke awal" tidak dipilih, stop
      (cekRepeat.Checked = False) then btStop.Click
    else
      LaguBerikut;
  end;
end;

procedure TForm1.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  mplayer.Position := ScrollBar1.Position;
  mplayer.Play;
  btPlay.Caption := 'Pause';
end;

procedure TForm1.btNextClick(Sender: TObject);
begin
  LaguBerikut;
end;

procedure TForm1.Hapus1Click(Sender: TObject);
begin
  lvPlaylist.DeleteSelected;
  AturIndexLagu;
end;

procedure TForm1.ambahFile1Click(Sender: TObject);
begin
  btOpen.Click;
end;

procedure TForm1.barVolumeChange(Sender: TObject);
begin
  MPSetVolume(mplayer, barVolume.Position) ;
end;

procedure TForm1.btPrevClick(Sender: TObject);
begin
  LaguSebelum;
end;

procedure TForm1.mplayerNotify(Sender: TObject);
begin
  if mplayer.Mode = mpPlaying then begin
    lbJudul.Caption := StringReplace(lbJudul.Caption, ' (Paused)', '', [rfIgnoreCase]);
    lbJudul.Font.Color := clLime;
  end;
  mplayer.Notify := True;
end;


procedure TForm1.lvPlaylistDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, nextItem, dragItem, dropItem : TListItem;
begin
  if Sender = Source then
  begin
    with TListView(Sender) do
    begin
      dropItem := GetItemAt(X, Y) ;
      currentItem := Selected;
      while currentItem <> nil do
      begin
        nextItem := GetNextItem(currentItem, SdAll, [IsSelected]) ;
        if Assigned(dropItem) then
          dragItem := Items.Insert(dropItem.Index)
        else
          dragItem := Items.Add;
        dragItem.Assign(currentItem) ;
        currentItem.Free;
        currentItem := nextItem;
      end;
    end;
    AturIndexLagu;
  end;
end;

procedure TForm1.lvPlaylistDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Sender = lvPlaylist;
end;
// -----------------------------------------------------------------------------

procedure TForm1.SimpanPlaylist1Click(Sender: TObject);
begin
  btSimpanpls.Click;
end;

procedure TForm1.LoadPlaylist1Click(Sender: TObject);
begin
  btLoadpls.Click;
end;

procedure TForm1.btSimpanplsClick(Sender: TObject);
begin
  if lvPlaylist.Items.Count < 1 then begin
    MessageDlg('Playlist masih kosong!', mtInformation, [mbOk], 0);
    Exit;
  end;
  SaveDialog1.Title := 'Simpan playlist';
  SaveDialog1.Filter := 'Playlist Files|*.lst';
  SaveDialog1.DefaultExt := '.lst.';
  if SaveDialog1.Execute then
    SimpanPlaylist(SaveDialog1.FileName);
end;

procedure TForm1.btLoadplsClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Load playlist';
  OpenDialog1.Filter := 'Playlist Files|*.lst';
  OpenDialog1.DefaultExt := '.lst';
  if OpenDialog1.Execute then
    LoadPlaylist(OpenDialog1.FileName);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // Simpan list lagu untuk di-load kembali saat app dijalankan
  SimpanPlaylist( ExtractFilePath(Application.ExeName) + 'listLagu.lst' );
end;

procedure TForm1.lvPlaylistAdvancedCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
  var DefaultDraw: Boolean);
begin
  // lagu yg sedang aktif, font tebal
  if Item.Index = idxLagu then
    Sender.Canvas.Font.Style := [fsBold] else
    Sender.Canvas.Font.Style := [];
end;

procedure TForm1.open1Click(Sender: TObject);
begin
btopen.Click;
end;

procedure TForm1.play1Click(Sender: TObject);
begin
btplay.Click;
end;

procedure TForm1.next1Click(Sender: TObject);
begin
btnext.Click;
end;

procedure TForm1.prev1Click(Sender: TObject);
begin
btprev.Click;
end;

procedure TForm1.stop1Click(Sender: TObject);
begin
btstop.Click;
end;
procedure TForm1.Filelistboxchange(Sender: TObject);
var
  Panjang     : longint;
begin
  if (FileListBox1.FileName <> '') then
  begin
    // Membuka file baru
    MediaPlayer1.FileName := FileListBox1.FileName;
    MediaPlayer1.Open;
    MediaPlayer1.TimeFormat := tfMilliseconds;
    Panjang := MediaPlayer1.Length div 1000;
    labell.Caption := Format ('%2.2d:%2.2d',
            [Panjang div 60, Panjang mod 60]);

end;

  end;


procedure TForm1.Timer1Timer(Sender: TObject);

var
  Posisi      : longint;
begin
  // Menuliskan posisi pada Label4
  Posisi := MPlayer.Position div 1000;
  labell.Caption := Format ('%2.2d:%2.2d',
            [Posisi div 60, Posisi mod 60]);
end;



procedure TForm1.exit1Click(Sender: TObject);
begin
form1.Close;
end;

end.



