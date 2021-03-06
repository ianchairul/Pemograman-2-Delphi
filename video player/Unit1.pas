unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, FileCtrl, ExtCtrls, OleCtnrs, Buttons;

type
  TForm1 = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    MediaPlayer1: TMediaPlayer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FileListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormRESIZE(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
if (FileListBox1.FileName <>'')
then
with MediaPlayer1 do
begin
MediaPlayer1.FileName:=FileListBox1.FileName;
open;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
MediaPlayer1.Display:=Panel1;
MediaPlayer1.VisibleButtons:=[btPlay,btPause,btStop,btNext,btPrev,btStep,btBack];
FileListBox1.Mask:='*.avi;*.mpg;*.mpeg;*.mp4;*.flv;*.flv';
DirectoryListBox1.FileList:=FileListBox1;
DriveComboBox1.DirList:=DirectoryListBox1;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
MediaPlayer1.Play;
Mediaplayer1.DisplayRect:=rect(0,0,panel1.Width-0,panel1.Height-0)
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
MediaPlayer1.Pause;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
MediaPlayer1.Stop;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
MediaPlayer1.Next;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
MediaPlayer1.Previous;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
MediaPlayer1.Back;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
MediaPlayer1.Step;
end;


procedure TForm1.FormRESIZE(Sender: TObject);
begin
MEDIAPLAYER1.DisplayRect:=Panel1.ClientRect;
end;

end.
