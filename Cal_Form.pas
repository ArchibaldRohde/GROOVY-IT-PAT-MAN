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
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TCal.Button1Click(Sender: TObject);
begin
  User.fillerup;
end;

procedure TCal.FormActivate(Sender: TObject);
begin
  User := TUSer.create(Form1.edtName.text);
end;

end.
