program AppServer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  AppServer.Controller.Caixa in 'src\Controller\AppServer.Controller.Caixa.pas',
  AppServer.Controller.Venda in 'src\Controller\AppServer.Controller.Venda.pas',
  AppServer.Controller.Cliente in 'src\Controller\AppServer.Controller.Cliente.pas',
  AppServer.Controller.Produto in 'src\Controller\AppServer.Controller.Produto.pas',
  AppServer.Controller.Usuario in 'src\Controller\AppServer.Controller.Usuario.pas',
  AppServer.Controller.VendaItens in 'src\Controller\AppServer.Controller.VendaItens.pas';

begin
  AppServer.Controller.Caixa.Registry;
  AppServer.Controller.Venda.Registry;
  AppServer.Controller.Cliente.Registry;
  AppServer.Controller.Produto.Registry;
  AppServer.Controller.Usuario.Registry;
  AppServer.Controller.VendaItens.Registry;

  THorse.Listen(9000);
end.
