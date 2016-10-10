unit Cal_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, TUser_U, DMOD, MPlayer;

type
  TCal = class(TForm)
    Image1: TImage;
    SGCal: TStringGrid;
    lblTitel: TLabel;
    cbOggend: TCheckBox;
    cbAand: TCheckBox;
    cbFloss: TCheckBox;
    btnRefresh: TButton;
    btnSong: TButton;
    btnResults: TButton;
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnResultsClick(Sender: TObject);
    procedure btnSongClick(Sender: TObject);
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

  btnResults.Enabled := false;
end;

procedure TCal.btnRefreshClick(Sender: TObject);
VAR
i : integer;
begin
i := 0;
  //sit hier die code vir soek deur database en dan skep dit die record... jas...
  DMOD.Datamodule1.TableCalendar.First;
  while NOT Dmod.DataModule1.TableCalendar.Eof do
  begin
      if ((Dmod.DataModule1.TableCalendar['Day'] = FormatDateTime('m/d/y', now)) AND (Dmod.DataModule1.TableCalendar['User'] = User.getNaam)) then
      begin
       i := 1;
       break;
      end;

  end;
  if i = 1 then
  begin
   //hier is die verander
  end
  else
  begin
   //hier is die new record
  end;


  ////////////////////////////////////////////////////////////////////////////////
  User.fillerup;
  btnResults.Enabled := true;
end;

procedure TCal.btnResultsClick(Sender: TObject);
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
answer := messagedlg('Would you like to save this data to a textfile?',mtInformation,mbYesNoCancel,0);
if answer = 6 then
begin
  assignfile(tfile, 'results.txt');

    rewrite(tfile);


    writeln(tfile, 'Here follows the results of ' + User.getNaam + '`s brushing record:' + #13#10 + #13#10 +
                   User.getNaam + ' Brushed ' + inttostr(User.getBrushed) + ' times and flossed ' + inttostr(User.getFlossed) +
                   ' times!' + #13#10 + #13#10 + 'Created by Archie`s awesome PAT');

  closefile(tfile);
end;

////////////////////////////////////////////////////////
end;

procedure TCal.btnSongClick(Sender: TObject);
begin
MediaPlayer1.Close;
randomize;
MediaPlayer1.FileName := inttostr(random(4)+1) + '.wmv';
MediaPlayer1.Open;
MediaPlayer1.Play;
end;

end.
