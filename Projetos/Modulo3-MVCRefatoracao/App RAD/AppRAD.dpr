program AppRAD;

uses
  Vcl.Forms,
  AppRAD.View.Forms.Principal in 'src\View\Forms\AppRAD.View.Forms.Principal.pas' {Form1},
  AppRAD.View.Forms.Caixa.Abrir in 'src\View\Forms\Caixa\AppRAD.View.Forms.Caixa.Abrir.pas' {FormAbrirCaixa},
  udmDados in 'udmDados.pas' {dmDados: TDataModule},
  AppRAD.View.Forms.Caixa.Operador in 'src\View\Forms\Caixa\AppRAD.View.Forms.Caixa.Operador.pas' {formOperador},
  uClasses in 'uClasses.pas',
  AppRAD.View.Forms.Venda.Abrir in 'src\View\Forms\Venda\AppRAD.View.Forms.Venda.Abrir.pas' {formAbrirVenda},
  AppRAD.View.Forms.Venda.VenderItem in 'src\View\Forms\Venda\AppRAD.View.Forms.Venda.VenderItem.pas' {formVenderItens},
  AppRAD.Model.Connection.Interfaces in 'src\Model\Connection\AppRAD.Model.Connection.Interfaces.pas',
  AppRAD.Model.Connection.Firedac in 'src\Model\Connection\Firedac\AppRAD.Model.Connection.Firedac.pas',
  AppRAD.Model.Entity.CAIXA in 'src\Model\Entity\AppRAD.Model.Entity.CAIXA.pas',
  AppRAD.Model.Entity.CLIENTE in 'src\Model\Entity\AppRAD.Model.Entity.CLIENTE.pas',
  AppRAD.Model.Entity.PRODUTO in 'src\Model\Entity\AppRAD.Model.Entity.PRODUTO.pas',
  AppRAD.Model.Entity.USUARIO in 'src\Model\Entity\AppRAD.Model.Entity.USUARIO.pas',
  AppRAD.Model.Entity.VENDA in 'src\Model\Entity\AppRAD.Model.Entity.VENDA.pas',
  AppRAD.Model.Entity.VENDAITENS in 'src\Model\Entity\AppRAD.Model.Entity.VENDAITENS.pas',
  AppRAD.Model.DAO.Intefaces in 'src\Model\DAO\AppRAD.Model.DAO.Intefaces.pas',
  AppRAD.Model.DAO.SQL in 'src\Model\DAO\AppRAD.Model.DAO.SQL.pas',
  AppRAD.Controller.Interfaces in 'src\Controller\AppRAD.Controller.Interfaces.pas',
  AppRAD.Model.DAO.Factory in 'src\Model\DAO\AppRAD.Model.DAO.Factory.pas',
  AppRAD.Controller.Generic in 'src\Controller\AppRAD.Controller.Generic.pas',
  AppRAD.Controller in 'src\Controller\AppRAD.Controller.pas',
  AppRAD.Model.DAO.REST in 'src\Model\DAO\AppRAD.Model.DAO.REST.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormAbrirCaixa, FormAbrirCaixa);
  Application.CreateForm(TformOperador, formOperador);
  Application.CreateForm(TformAbrirVenda, formAbrirVenda);
  Application.CreateForm(TformVenderItens, formVenderItens);
  Application.Run;
end.
