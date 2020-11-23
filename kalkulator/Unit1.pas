unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    XPManifest1: TXPManifest;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button5Click(Sender: TObject);
begin
Edit1.Clear;
edit2.Clear;
edit3.Clear;
edit1.setfocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
a,b,hasil:integer;
begin
a:=strtoint(edit1.Text);
b:=strtoint(edit2.Text);
hasil:=a+b;
edit3.Text:=inttostr(hasil);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
a,b,hasil:integer;
begin
a:=strtoint(edit1.Text);
b:=strtoint(edit2.Text);
hasil:=a-b;
edit3.Text:=inttostr(hasil);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
a,b,hasil:real;
begin
a:=strtoint(edit1.Text);
b:=strtoint(edit2.Text);
hasil:=a/b;
edit3.Text:=floattostr(hasil);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
a,b,hasil:integer;
begin
a:=strtoint(edit1.Text);
b:=strtoint(edit2.Text);
hasil:=a*b;
edit3.Text:=inttostr(hasil);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
if application.MessageBox('Apakah anda ingin keluar ?','perhatian',MB_YesNO)=ID_Yes then form1.close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
form1.Color := clskyblue;
end;

end.
