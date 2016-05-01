program ItPat;

uses
  Forms,
  Main_Form_U in 'Main_Form_U.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
