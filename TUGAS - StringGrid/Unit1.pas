unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    enama: TEdit;
    euts: TEdit;
    euas: TEdit;
    etugas: TEdit;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Button1: TButton;
    enim: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);

    procedure etugasKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure enamaKeyPress(Sender: TObject; var Key: Char);
    procedure eutsKeyPress(Sender: TObject; var Key: Char);
    procedure euasKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure enimChange(Sender: TObject);
    procedure enamaChange(Sender: TObject);
    procedure eutsChange(Sender: TObject);
    procedure euasChange(Sender: TObject);
    procedure etugasChange(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
        procedure SortGrid(Grid : TStringGrid; SortCol:integer);
  end;

var
  Form1: TForm1;
  i,j,baris,xx,yy : integer;

implementation

{$R *.dfm}

procedure Tform1.Sortgrid(Grid : TStringGrid; SortCol:integer);
var
i,j : integer;
temp:tstringlist;
begin
temp:=tstringlist.create;
with Grid do
for i := FixedRows to RowCount - 2 do
for j:= i+1 to rowcount-1 do
if AnsiCompareText(Cells[SortCol, i], Cells[SortCol,j]) < 0 then
  begin
  temp.assign(rows[j]);
  rows[j].assign(rows[i]);
  rows[i].assign(temp);
  end;
temp.free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
form1.Color:=clskyblue;  baris:=1;
  StringGrid1.ColCount := 8;
  StringGrid1.Cells[0,0] := 'No';
  StringGrid1.Cells[1,0] := 'NIM';
  StringGrid1.Cells[2,0] := 'Nama';
  StringGrid1.Cells[3,0] := 'U T S';
  StringGrid1.Cells[4,0] := 'U A S';
  StringGrid1.Cells[5,0] := 'Tugas';
  StringGrid1.Cells[6,0] := 'Total';
  StringGrid1.Cells[7,0] := 'Nilai';
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 150;
  StringGrid1.ColWidths[3] := 80;
  StringGrid1.ColWidths[4] := 80;
  StringGrid1.ColWidths[5] := 80;
  StringGrid1.ColWidths[6] := 80;
  StringGrid1.ColWidths[7] := 65;
  i := 0;
end;
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    enama.SetFocus
  end;
end;

procedure TForm1.enamaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    euts.SetFocus
  end;
end;

procedure TForm1.eutsKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    euas.SetFocus
  end;
end;

procedure TForm1.euasKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    etugas.SetFocus
  end;
end;

procedure TForm1.etugasKeyPress(Sender: TObject; var Key: Char);
var
      tugas,uts,uas,n_akhir : real;
      grade : integer;
begin
if key = #13 then
begin
inc(i);
 baris:=baris+1;
 StringGrid1.RowCount:=baris;
  StringGrid1.Cells[0,i] := IntToStr(i);
  StringGrid1.Cells[1,i] := enim.Text;
  StringGrid1.Cells[2,i] := enama.Text;
  StringGrid1.Cells[3,i] := euts.Text;
  StringGrid1.Cells[4,i] := euas.Text;
  StringGrid1.Cells[5,i] := etugas.Text;
  tugas := StrToFloat(euts.Text);
  uts   := StrToFloat(euas.Text);
  uas   := StrToFloat(etugas.Text);
  n_akhir := (tugas*20/100) + (uts*30/100) + (uas*50/100);
  StringGrid1.Cells[6,i] := FloatToStrf(n_akhir,fffixed,8,2);
  if n_akhir > 80.51 then
  StringGrid1.Cells[7,i] := 'A'
  else if n_akhir > 65.51 then
  StringGrid1.Cells[7,i] := 'B'
  else if n_akhir > 50.51 then
  StringGrid1.Cells[7,i] := 'C'
  else if n_akhir > 40.51 then
  StringGrid1.Cells[7,i] := 'D'
  else
  StringGrid1.Cells[7,i] := 'DO';
  enim.Clear;
  enama.Clear;
  euts.Clear;
  euas.Clear;
  etugas.Clear;
  enim.SetFocus;
  end;
Panel2.Caption :='Silahkan Masukan Data Mahasiswa Berikutnya';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
VAR
c,j:integer;
rect:trect;
begin
xx:=600;
yy:=16;
with stringgrid1 do
if yy<rowheights[0] then
  begin
  for j:= 0 to colcount-1 do
    begin
    rect := cellrect(j,0);
    if (rect.Left < xx) and (rect.Right> xx) then
      begin
      c := j;
      break;
      end;
    end;
  sortgrid(stringgrid1,c);
  end;
Panel2.Caption :='Data Anda Telah Disortir';
end;

procedure TForm1.enimChange(Sender: TObject);
begin
Panel2.Caption :='Silahkan Masukan Nim Mahasiswa, Jika Sudah Tekan ENTER';
end;

procedure TForm1.enamaChange(Sender: TObject);
begin
Panel2.Caption :='Silahkan Masukan Nama Mahasiswa, Jika Sudah Tekan ENTER';
end;

procedure TForm1.eutsChange(Sender: TObject);
begin
Panel2.Caption :='Silahkan Masukan Nilai UTS Mahasiswa, Jika Sudah Tekan ENTER';
end;

procedure TForm1.euasChange(Sender: TObject);
begin
Panel2.Caption :='Silahkan Masukan Nilai UAS Mahasiswa, Jika Sudah Tekan ENTER';
end;

procedure TForm1.etugasChange(Sender: TObject);
begin
Panel2.Caption :='Silahkan Masukan Nilai Tugas Mahasiswa, Jika Sudah Tekan ENTER';
end;

end.
