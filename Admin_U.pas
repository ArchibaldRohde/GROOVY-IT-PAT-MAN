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
  private
  yas : TButton;
    { Private declarations }
  public
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
  yas.Create(Self);
  yas.Width := 100;
  yas.Height := 100;
  yas.Left := random(Admin.Width)-100;
  yas.Top := random(Admin.Height)-100;
end;

end.
