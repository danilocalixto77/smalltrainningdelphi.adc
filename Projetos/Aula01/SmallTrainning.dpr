program SmallTrainning;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {FormPrincipal},
  Produto.Interfaces in 'src\Model\Produto\Produto.Interfaces.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  Produto.Helpers in 'src\Model\Produto\Produto.Helpers.pas',
  Imposto.SimplesNacional in 'src\Model\Imposto\Imposto.SimplesNacional.pas',
  Imposto.LucroReal in 'src\Model\Imposto\Imposto.LucroReal.pas',
  Imposto.LucroPresumido in 'src\Model\Imposto\Imposto.LucroPresumido.pas',
  Model.Log.Interfaces in 'src\Model\Log\Model.Log.Interfaces.pas',
  Model.Log.Texto in 'src\Model\Log\Model.Log.Texto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
