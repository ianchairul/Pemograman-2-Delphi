unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
VAR
INPUTNIM: STRING;
INPUTNAMA : STRING;
INPUTJURUSAN : STRING;
I,J : INTEGER;
begin
J := STRTOINT(Edit1.TEXT);
FOR I := 1 TO J DO
BEGIN
INPUTNIM :=InputBox('NIM MAHASISWA','MASUKKAN NIM MAHASISWA','');
ListBox1.Items.Add(INPUTNIM);
INPUTNAMA := InputBox('NAMA','MASUKKAN NAMA MAHASISWA','');
ListBox1.Items.Add(INPUTNAMA);
INPUTJURUSAN :=InputBox('JURUSAN','MASUKKAN JURUSAN MAHASISWA','');
ListBox1.Items.Add(INPUTJURUSAN);

END;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
ListBox1.Items.Clear;
Edit1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
CLOSE;
end;

end.
