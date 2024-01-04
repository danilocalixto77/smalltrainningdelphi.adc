program SmallTrainning;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {FormPrincipal},
  Produto.Interfaces in 'Produto.Interfaces.pas',
  Produto in 'Produto.pas',
  Produto.Helpers in 'Produto.Helpers.pas',
  Imposto.SimplesNacional in 'Imposto.SimplesNacional.pas',
  Imposto.LucroReal in 'Imposto.LucroReal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
