program SmallTrainning;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Produto.Interfaces in 'Produto.Interfaces.pas',
  Produto in 'Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
