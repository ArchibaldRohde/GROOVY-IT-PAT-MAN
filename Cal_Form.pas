unit Cal_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, TUser_U, DMOD, MPlayer,
  ComCtrls;

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
    RichEdit1: TRichEdit;
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
cbOggend.Caption := Form1.arrCaptions[17];
cbAand.Caption := Form1.arrCaptions[18];
cbFloss.Caption := Form1.arrCaptions[19];
btnRefresh.Caption := Form1.arrCaptions[20];
btnSong.Caption := Form1.arrCaptions[21];
btnResults.Caption := Form1.arrCaptions[22];
lblTitel.Caption := Form1.arrCaptions[1];
RichEdit1.Text := Form1.arrCaptions[23];
end;

procedure TCal.btnRefreshClick(Sender: TObject);
VAR
i : integer;
begin
i := 0;
  //sit hier die code vir soek deur database en dan skep dit die record... jas...
  Dmod.Datamodule1.TableCalendar.Open;
  DMOD.Datamodule1.TableCalendar.First;
  while NOT Dmod.DataModule1.TableCalendar.Eof do
  begin
  ///ddddd
      if ((Dmod.DataModule1.TableCalendar['Day'] = FormatDateTime('ddddd', now)) AND (Dmod.DataModule1.TableCalendar['User'] = User.getNaam)) then
      begin
       i := 1;
       break;
      end;
      DMOD.Datamodule1.Tablecalendar.next;
  end;
  DMOD.DataModule1.TableCalendar.Active := true;
  if i = 1 then
  begin
  User.changeEntry(FormatDateTime('ddddd', now),cbFloss.Checked,cbOggend.Checked,cbAand.Checked);
   DMOD.DataModule1.TableCalendar.Edit;
   DMod.DataModule1.TableCalendar['Morning'] := cbOggend.Checked;
   DMod.DataModule1.TableCalendar['Night'] := cbAand.Checked;
   DMod.DataModule1.TableCalendar['Flossed'] := cbFloss.Checked;
       DMOD.DataModule1.TableCalendar['User'] := User.Getnaam;
       DMOD.DataModule1.TableCalendar['Day'] := FormatDateTime('ddddd', now);
       DMOD.DataModule1.TableCalendar['Activity'] := false;
   DMOD.DataModule1.TableCalendar.Post;
   User.fillerup;
  end
  else
  begin
  User.newEntry(FormatDateTime('ddddd', now),cbFloss.Checked,cbOggend.Checked,cbAand.Checked);

  DMOD.DataModule1.TableCalendar.Append;
   DMod.DataModule1.TableCalendar['Morning'] := cbOggend.Checked;
   DMod.DataModule1.TableCalendar['Night'] := cbAand.Checked;
   DMod.DataModule1.TableCalendar['Flossed'] := cbFloss.Checked;
       DMOD.DataModule1.TableCalendar['User'] := User.Getnaam;
       DMOD.DataModule1.TableCalendar['Day'] := FormatDateTime('ddddd', now);
       DMOD.DataModule1.TableCalendar['UserDay'] := User.Getnaam + FormatDateTime('ddddd', now);
       DMOD.DataModule1.TableCalendar['Activity'] := false;
   DMOD.DataModule1.TableCalendar.Post;


    //(FormatDateTime('m/d/y', now), cbOggend.Checked, cbAand.Checked, cbFloss.Checked, NULL, User.Getnaam, User.Getnaam + FormatDateTime('m/d/y', now));
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
Showmessage('Aktief sedert: ' + User.getSomeDate);
ShowMessage('Sedert ' + User.getSomeDate + ' het U ' + inttostr(User.getBrushed) +
            ' keer U tande geborsel en ' + inttostr(User.getFlossed) + ' keer gevlos');
answer := messagedlg('Wil U die data na `n teksleër skryf?',mtInformation,mbYesNoCancel,0);
if answer = 6 then
begin
  assignfile(tfile, 'results.txt');

    rewrite(tfile);


    writeln(tfile, 'Hier volg die resultate van ' + User.getNaam + ' se borsel rekords.' + #13#10 + #13#10 +
                   User.getNaam + ' het ' + inttostr(User.getBrushed) + ' keer geborsel en het ' + inttostr(User.getFlossed) +
                   ' keer gevlos!' + #13#10 + #13#10 + 'Created by Archie`s awesome PAT');

  closefile(tfile);
  Showmessage('Data geskryf na "results.txt"');
  
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
