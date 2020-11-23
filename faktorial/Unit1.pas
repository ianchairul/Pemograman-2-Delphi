unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
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
var i,n: integer;
begin
n:=StrToInt(Edit1.Text);
for i :=1 to n-1 do
    n:=n*i;
edit2.Text:=(IntToStr(n));
n:=StrToInt(Edit1.Text);
for i :=1 to n-1 do
    n:=n+i;
edit3.Text:=(IntToStr(n));
end;

end.
