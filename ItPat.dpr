program ItPat;

uses
  Forms,
  Main_Form_U in 'Main_Form_U.pas' {Form1},
  DMod in 'DMod.pas' {DataModule1: TDataModule},
  Cal_Form in 'Cal_Form.pas' {Cal},
  TUser_U in 'TUser_U.pas',
  Admin_U in 'Admin_U.pas' {Admin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TCal, Cal);
  Application.CreateForm(TAdmin, Admin);
  Application.Run;
end.
