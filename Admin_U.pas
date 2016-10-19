unit Admin_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls;

type
  TAdmin = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    btnSQL: TButton;
    DataSource1: TDataSource;
    Memo1: TMemo;
    btnuseless: TButton;
    btnMorn: TButton;
    btnNight: TButton;
    procedure btnSQLClick(Sender: TObject);
    procedure btnuselessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMornClick(Sender: TObject);
    procedure btnNightClick(Sender: TObject);
  private

    { Private declarations }
  public
   arrbut : array [1..100] of TButton;
   r : integer;
    { Public declarations }
  end;

var
  Admin: TAdmin;

implementation

{$R *.dfm}

procedure TAdmin.btnSQLClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := memo1.Text;
  ADOQuery1.Active := true;
  ADOQuery1.Open;
  ADOQuery1.ExecSQL;
  DBGrid1.Refresh;
end;

procedure TAdmin.btnuselessClick(Sender: TObject);

begin
arrbut[r] := TButton.Create(Admin);
 arrbut[r].Width := 100;
  arrbut[r].Height := 100;
  arrbut[r].Left := random(300);
  arrbut[r].Top := random(300);
  arrbut[r].Visible := true;
  arrbut[r].BringToFront;
  arrbut[r].Parent := Admin;
  inc(r);
end;

procedure TAdmin.FormCreate(Sender: TObject);
begin
r := 1;
end;

procedure TAdmin.btnMornClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select Sum(Morning) From Calendar';
  ADOQuery1.Active := true;
  ADOQuery1.Open;
  ADOQuery1.ExecSQL;
  DBGrid1.Refresh;
end;

procedure TAdmin.btnNightClick(Sender: TObject);
begin
    ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select Sum(Night) From Calendar';
  ADOQuery1.Active := true;
  ADOQuery1.Open;
  ADOQuery1.ExecSQL;
  DBGrid1.Refresh;

  arrbut[r] := TButton.Create(Admin);
 arrbut[r].Width := 89;
  arrbut[r].Height := 25;
  arrbut[r].Left := 656;
  arrbut[r].Top := 64;
  arrbut[r].Visible := true;
  arrbut[r].BringToFront;
  arrbut[r].Parent := Admin;
  arrbut[r].Caption := 'you didn`t see that coming';
  inc(r);
end;

end.
