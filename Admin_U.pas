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
    procedure btnSQLClick(Sender: TObject);
    procedure btnuselessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

  showmessage(ADOQuery1.SQL.Text);
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

end.
