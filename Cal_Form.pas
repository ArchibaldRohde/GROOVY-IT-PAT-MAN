unit Cal_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls;

type
  TCal = class(TForm)
    Image1: TImage;
    SGCal: TStringGrid;
    lblTitel: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cal: TCal;

implementation

{$R *.dfm}

end.
