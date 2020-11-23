unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mmSystem, ExtCtrls, StdCtrls;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    SaveDialog1: TSaveDialog;
    Label5: TLabel;
    Button5: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

    // Record
    procedure TForm1.Button1Click(Sender: TObject);
    begin
    BUTTON1.Caption:='RECORDED';
    Label2.Caption:='0';
    Timer1.Enabled:=true;
    Label1.Caption:='Rocording started';


    mciSendString('OPEN NEW TYPE WAVEAUDIO ALIAS MicSound', nil, 0, Handle);

    mciSendString('SET MicSound TIME FORMAT MS ' +

        'BITSPERSAMPLE 8 ' +
        'CHANNELS 1 ' +
        'SAMPLESPERSEC 8000 ' +
        'BYTESPERSEC 8000',
        nil, 0, Handle);

    mciSendString('RECORD MicSound', nil, 0, Handle);
    end;



    procedure TForm1.Button2Click(Sender: TObject);
    begin
BUTTON1.Caption:='RECORD';  LABEL1.Caption:='RECORDING STOPED';  Timer1.Enabled:=false;

    mciSendString('STOP MicSound', nil, 0, Handle);

    end;


procedure TForm1.Timer1Timer(Sender: TObject);
Var
p1 : integer;

begin
p1:=strtoint(label2.caption);
label2.Caption:= inttostr(p1 + 1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if SaveDialog1.Execute then

    mciSendString(PChar('SAVE MicSound ' + SaveDialog1.filename), nil, 0, Handle);

    mciSendString('CLOSE MicSound', nil, 0, Handle);

    Label1.Caption:='Wave file saved to ' + SaveDialog1.filename; //Lets you know its saved :P

end;


procedure TForm1.Button5Click(Sender: TObject);
begin
FORM1.Close;
end;

end.
