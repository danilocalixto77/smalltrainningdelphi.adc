program AppRAD;

uses
  Vcl.Forms,
  AppRAD.View.Forms.Principal in 'src\View\Forms\AppRAD.View.Forms.Principal.pas' {Form1},
  AppRAD.View.Forms.Caixa.Abrir in 'src\View\Forms\Caixa\AppRAD.View.Forms.Caixa.Abrir.pas' {FormAbrirCaixa},
  AppRAD.View.Forms.Caixa.Operador in 'src\View\Forms\Caixa\AppRAD.View.Forms.Caixa.Operador.pas' {formOperador},
  AppRAD.View.Forms.Venda.VenderItem in 'src\View\Forms\Venda\AppRAD.View.Forms.Venda.VenderItem.pas' {formVenderItens},
  AppRAD.Controller.Interfaces in 'src\Controller\AppRAD.Controller.Interfaces.pas',
  AppRAD.Controller.Generic in 'src\Controller\AppRAD.Controller.Generic.pas',
  AppRAD.Controller in 'src\Controller\AppRAD.Controller.pas',
  AppRAD.Controller.Entity.Caixa in 'src\Controller\Entity\AppRAD.Controller.Entity.Caixa.pas',
  AppRAD.View.Forms.Interfaces in 'src\View\Forms\AppRAD.View.Forms.Interfaces.pas',
  AppRAD.View.Forms.Factory in 'src\View\Forms\AppRAD.View.Forms.Factory.pas',
  AppRAD.Controller.Entity.Usuario in 'src\Controller\Entity\AppRAD.Controller.Entity.Usuario.pas',
  AppRAD.View.Forms.Cliente.Selecionar in 'src\View\Forms\Cliente\AppRAD.View.Forms.Cliente.Selecionar.pas' {SelecionarCliente},
  AppRAD.Controller.Entity.Cliente in 'src\Controller\Entity\AppRAD.Controller.Entity.Cliente.pas',
  AppRAD.Controller.Entity.Venda in 'src\Controller\Entity\AppRAD.Controller.Entity.Venda.pas',
  AppRAD.Controller.Entity.Produto in 'src\Controller\Entity\AppRAD.Controller.Entity.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
