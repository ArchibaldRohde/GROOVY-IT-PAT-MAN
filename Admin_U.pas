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
    Button1: TButton;
    DataSource1: TDataSource;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Admin: TAdmin;

implementation

{$R *.dfm}

procedure TAdmin.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := memo1.Text;
  ADOQuery1.Active := true;
  ADOQuery1.Open;
  ADOQuery1.ExecSQL;
  DBGrid1.Refresh;

  showmessage(ADOQuery1.SQL.Text);
end;

end.
