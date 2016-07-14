program ItPat;

uses
  Forms,
  Main_Form_U in 'Main_Form_U.pas' {Form1},
  DMod in 'DMod.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
