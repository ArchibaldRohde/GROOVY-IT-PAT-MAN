unit Main_Form_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DMod, TUSER_U;

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
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure LangChange(lang : integer);
    procedure RGBLangClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    arrCaptions : array [1..50] of string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Admin_U, cal_Form;



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
            arrCaptions[13] := 'Veels geluk ';
            arrCaptions[14] := ', u is nou `n gekwalifiseerde gebruiker!';
            arrCaptions[15] := 'Gebruikersnaam bestaan nie' ;
            arrCaptions[16] := 'Wagwoord verkeerd in gesleutel' ;

            arrCaptions[17] := 'Borsel in Oggend';
            arrCaptions[18] := 'Borsel in Aand';
            arrCaptions[19] := 'Vlos dagliks';
            arrCaptions[20] := 'Herlaai die kalender';
            arrCaptions[21] := 'Speel `n borselliedjie';
            arrCaptions[22] := 'Vertoon resultate';
            arrCaptions[23] := 'Hierdie is die kalender!' + #10 + 'Hierop vertoon al die kere wat jy geborsel en gevlos het!' + #10 +
                                'Druk die herlaai knoppie om nuwe data in te lees en om die kalender te herlaai!' + #10 +
                                'Daarna kan jy die resultate knoppie druk en sien hoe jy sover vorder.' + #10 +
                                'Jy kan ook met daardie knoppie die resultate na `n teksleër stoor.' +#10 + #10 + #10 +
                                 'Sleutel:' + #10 + 'M : oggend' + #10 + 'N : Aand' + #10 + 'F : Gevlos';
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
            arrCaptions[13] := 'Well done ' ;
            arrCaptions[14] := ', you are now a qualified user!' ;
            arrCaptions[15] := 'Invallid Login, Please check username' ;
            arrCaptions[16] := 'Invallid Login, Please check password' ;

            arrCaptions[17] := 'Brush in the morning';
            arrCaptions[18] := 'Brush at night';
            arrCaptions[19] := 'Floss dayly';
            arrCaptions[20] := 'Refresh Calendar';
            arrCaptions[21] := 'Play a Brush-Song';
            arrCaptions[22] := 'Display Results';
            arrCaptions[23] := 'This is the Calendar' + #10 + 'This shows every time you brushed and flossed.' + #10 +
                                'Press the refresh button to enter new data or simply to refresh the calendar!' + #10 +
                                'Afterwards you can press the results button, which will tell you how you are doing!' + #10 +
                                'From here you can also store data to a textfile' +#10 + #10 + #10 +
                                 'Key:' + #10 + 'M : Morning' + #10 + 'N : Night' + #10 + 'F : Flossed';;
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
//////////////////////////////////////////////////////////////NEW USER
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
    showmessage(arrCaptions[11]);
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
  MessageDlg(arrCaptions[13] + sNewName + arrCaptions[14],mtWarning,[mbOK],0);
end;
end;

procedure TForm1.btnLoginClick(Sender: TObject);
var
sName, sPassword : string;
i, k : integer;
mydate, mydate2 : string;
begin
 //////init//////////////////////////////////////////////////////////////////
  sName := edtName.text;
  sPassword := edtPassword.text;
  edtPassword.Text := '';
 ///////Log in Checks and all///////////////////////////////////////////////////////////////////
  Dmod.DataModule1.TableUser.First;                                                             //
  while NOT Dmod.DataModule1.TableUser.Eof  do                                                   //
    begin //while                                                                                 //
                                                                                                   //
     if Dmod.DataModule1.TableUser['Username'] = sName then                                         //
        break;                                                                                       //
                                                                                                      //
        Dmod.DataModule1.TableUser.Next;                                                               //
    end; //while                                                                                        //
      if Dmod.DataModule1.TableUser.Eof then                                                            //
      begin  //if                                                                                        //
      MessageDlg(arrCaptions[15],mtError,[mbCancel],0);                                                  //
      edtName.Color := clred;                                                                            //
      edtPassword.Color := clred;                                                                        //
      exit;                                                                                              //
      end;   //if                                                                                        //
                                                                                                        //
      if NOT (Dmod.DataModule1.TableUser['Password'] = sPassword) then                                 //
      begin  //if pass                                                                                //
      MessageDlg(arrCaptions[16],mtError,[mbCancel],0);                                              //
      edtPassword.Color := clred;                                                                   //
      edtName.Color := clteal;                                                                     //
      exit;                                                                                       //
                                                                                                 //
      end; //if pass                                                                            //
      edtName.Color := clteal;                                                                 //
      edtPassword.Color := clteal;                                                            //
                                                                                           ////
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////    DATABASE VIBES    /////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////


mydate := FormatDateTime('ddddd', now);
for i := 1 to 3 do
begin
    for k := 1 to 7 do
    begin
     mydate2 := FormatDateTime('ddddd', strtodatetime(mydate) - ((i-1)*(7) + (k-1)));
         Cal.SGCal.Cells[k,i] := mydate2;

    end;

end;
Cal.Enabled := true;

Cal.Visible := true;
Self.Visible := false;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
answer : string;
begin
answer := inputbox('password','password','password');
if answer = 'Admin' then
begin
Admin.Show;
end;

end;

end.

