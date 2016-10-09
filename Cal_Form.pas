unit Cal_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, TUser_U;

type
  TCal = class(TForm)
    Image1: TImage;
    SGCal: TStringGrid;
    lblTitel: TLabel;
    cbOggend: TCheckBox;
    cbAand: TCheckBox;
    cbFloss: TCheckBox;
    btnRefresh: TButton;
    btnGame: TButton;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    User : Tuser;
    { Public declarations }
  end;

var
  Cal: TCal;

implementation

uses Main_Form_U ;

{$R *.dfm}

procedure TCal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Self.Enabled := false;
Form1.Visible := true;
end;

procedure TCal.FormActivate(Sender: TObject);
begin
  User := TUSer.create(Form1.edtName.text);
end;

procedure TCal.btnRefreshClick(Sender: TObject);
begin
  //sit hier die code vir soek deur database en dan skep dit die record... jas...


  ////////////////////////////////////////////////////////////////////////////////
  User.fillerup;
end;

procedure TCal.Button1Click(Sender: TObject);
var
answer : integer;
tfile : textfile;
slyn : string;
k, time : integer;
begin
///sit hier die code vir kyk hoe goed die leerder presteer.///
Showmessage('Active since: ' + User.getSomeDate);
ShowMessage('Since ' + User.getSomeDate + ' you have brushed: ' + inttostr(User.getBrushed) +
            ' times. You have also flossed ' + inttostr(User.getFlossed) + ' times!');


////////////////////////////////////////////////////////
end;

end.
