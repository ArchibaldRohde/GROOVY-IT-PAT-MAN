unit Main_Form_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    lblTitel: TLabel;
    btnLogin: TButton;
    RGBLang: TRadioGroup;
    btnNew: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure RGBLangClick(Sender: TObject);
  private
    { Private declarations }
  public
    arrCaptions : array [1..10] of string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  arrCaptions[1] := 'Draadjie maatjie';

  lblTitel.Caption := arrCaptions[1];
end;

procedure TForm1.RGBLangClick(Sender: TObject);
begin
 case RGBlang.ItemIndex of
  0 : begin arrCaptions[1] := 'Draadjie maatjie';
            arrCaptions[2] := 'Taal: '; end;
  1 : begin arrCaptions[1] := 'Brace yourself';
            arrCaptions[2] := 'Language: '; end;
 end;
 lblTitel.Caption := arrCaptions[1];
 RGBLang.Caption := arrCaptions[2];
end;

end.
