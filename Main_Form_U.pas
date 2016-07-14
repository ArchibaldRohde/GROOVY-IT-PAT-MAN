unit Main_Form_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Dmod;

type
  TForm1 = class(TForm)
    Image1: TImage;
    lblTitel: TLabel;
    btnLogin: TButton;
    RGBLang: TRadioGroup;
    btnNew: TButton;
    lblName: TLabel;
    edtName: TEdit;
    lblPassword: TLabel;
    edtPassword: TEdit;
    GBSign: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure LangChange(lang : integer);
    procedure RGBLangClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    arrCaptions : array [1..20] of string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  LangChange(RGBlang.ItemIndex);
end;

procedure TForm1.LangChange(lang: integer);
begin
 case lang of
  0 : begin arrCaptions[1] := 'Draadjie maatjie';
            arrCaptions[2] := 'Taal: ';
            arrCaptions[3] := 'Naam:' ;
            arrCaptions[4] := '<gebruikernaam>' ;
            arrCaptions[5] := 'Wagwoord:' ;
            arrCaptions[6] := '<wagwoord>' ;
            arrCaptions[7] := 'Teken in' ;
            arrCaptions[8] := 'Sluit aan(nuwe gebruiker)' ;
            arrCaptions[9] := 'Details' ;
            arrCaptions[10] := 'Alle velde is nog nie in gevul nie!' ;
            arrCaptions[11] := 'Gebruikersnaam mag slegs uit letters bestaan!' ;
            arrCaptions[12] := 'Gebruikersnaam bestaan klaar. Wees tog meer kreatief!' ;
       end;
  1 : begin arrCaptions[1] := 'Brace yourself';
            arrCaptions[2] := 'Language: ';
            arrCaptions[3] := 'Name:' ;
            arrCaptions[4] := '<username>' ;
            arrCaptions[5] := 'Password:' ;
            arrCaptions[6] := '<password>' ;
            arrCaptions[7] := 'Log in' ;
            arrCaptions[8] := 'Sign up(new user)' ;
            arrCaptions[9] := 'Details' ;
            arrCaptions[10] := 'All fields have not been filled in' ;
            arrCaptions[11] := 'Username should only contain letters' ;
            arrCaptions[12] := 'This username already exists, try something more creative!' ;
        end;
 end;
 lblTitel.Caption := arrCaptions[1];
 RGBLang.Caption := arrCaptions[2];
 lblName.Caption := arrCaptions[3];
 edtName.Text := arrCaptions[4];
 lblPassword.caption := arrCaptions[5];
 edtPassword.text := arrCaptions[6];
 btnLogin.Caption := arrCaptions[7];
 btnNew.caption := arrCaptions[8];
 GBSign.Caption := arrCaptions[9];
end;

procedure TForm1.RGBLangClick(Sender: TObject);
begin
LangChange(RGBlang.ItemIndex);
end;

procedure TForm1.btnNewClick(Sender: TObject);
var
 sNewName, sNewPassword, sletter : String;
  c, i, k : integer;
begin
//////////////////////Initializations
    sNewName := edtName.Text;
  sNewPassword := edtPassword.text;
//////////////////////Validations
  if ((sNewPassword='') OR (sNewName= '')) then
  begin
    ShowMessage(arrCaptions[10]);
    exit;
  end
  else
  begin
    for k := 0 to length(sNewname) do
  begin
  sletter := sNewName[k];
  val(sletter,c,i);
  if i = 0 then
  begin
    showmessage('arrCaptions[11]');
    exit;
  end;
  end;
//////////////////////Database validate
  Dmod.DataModule1.TableUser.First;
  while NOT Dmod.DataModule1.TableUser.EOF do
  begin
    if uppercase(Dmod.DataModule1.TableUser['Username']) = Uppercase(sNewName) then
    break;
    Dmod.DataModule1.TableUser.Next;
  end;
  if NOT Dmod.DataModule1.TableUser.Eof then
  begin
  MessageDlg(arrCaptions[12],mtError,[mbCancel],0);
  exit;
  end;
///////////////////////Database insert
  Dmod.DataModule1.TableUser.Last;
  Dmod.DataModule1.TableUser.Insert;
  Dmod.DataModule1.TableUser['Username'] := sNewName;
  Dmod.DataModule1.TableUser['Password'] := sNewPassword;
  Dmod.DataModule1.TableUser.Post;
  MessageDlg('Well done ' + sNewName + ', you are now a qualified user!',mtWarning,[mbOK],0);
end;
end;

end.




{ else
  begin
  //
   ////////////////////
  /////////////////


  //


  New_Form.Hide;
  Home_Form.Show;
  end;}
