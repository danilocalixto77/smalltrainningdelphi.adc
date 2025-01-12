program AppPOS;

uses
  System.StartUpCopy,
  FMX.Forms,
  AppPOS.View.Principal in 'src\View\AppPOS.View.Principal.pas' {Form3},
  AppRAD.Model.Connection.Interfaces in '..\AppModel\src\Connection\AppRAD.Model.Connection.Interfaces.pas',
  AppRAD.Model.Connection.Firedac in '..\AppModel\src\Connection\Firedac\AppRAD.Model.Connection.Firedac.pas',
  AppRAD.Model.Entity.CAIXA in '..\AppModel\src\Entity\AppRAD.Model.Entity.CAIXA.pas',
  AppRAD.Model.Entity.CLIENTE in '..\AppModel\src\Entity\AppRAD.Model.Entity.CLIENTE.pas',
  AppRAD.Model.Entity.PRODUTO in '..\AppModel\src\Entity\AppRAD.Model.Entity.PRODUTO.pas',
  AppRAD.Model.Entity.USUARIO in '..\AppModel\src\Entity\AppRAD.Model.Entity.USUARIO.pas',
  AppRAD.Model.Entity.VENDA in '..\AppModel\src\Entity\AppRAD.Model.Entity.VENDA.pas',
  AppRAD.Model.Entity.VENDAITENS in '..\AppModel\src\Entity\AppRAD.Model.Entity.VENDAITENS.pas',
  AppModel.RTTI.CustomAttributes in '..\AppModel\src\RTTI\AppModel.RTTI.CustomAttributes.pas',
  AppModel.RTTI.Utils in '..\AppModel\src\RTTI\AppModel.RTTI.Utils.pas',
  AppRAD.Model.DAO.Factory in '..\AppModel\src\DAO\AppRAD.Model.DAO.Factory.pas',
  AppRAD.Model.DAO.Intefaces in '..\AppModel\src\DAO\AppRAD.Model.DAO.Intefaces.pas',
  AppRAD.Model.DAO.REST in '..\AppModel\src\DAO\AppRAD.Model.DAO.REST.pas',
  AppRAD.Model.DAO.SQL in '..\AppModel\src\DAO\AppRAD.Model.DAO.SQL.pas',
  AppRAD.Model.DAO.Types in '..\AppModel\src\DAO\AppRAD.Model.DAO.Types.pas',
  AppPOS.Controller.Interfaces in 'src\Controller\AppPOS.Controller.Interfaces.pas',
  AppPOS.Controller.Entity.CAIXA in 'src\Controller\Entity\AppPOS.Controller.Entity.CAIXA.pas',
  AppPOS.Controller in 'src\Controller\AppPOS.Controller.pas',
  AppPOS.View.Components.ItemCaixa in 'src\View\Components\AppPOS.View.Components.ItemCaixa.pas' {ComponentItemCaixa},
  AppPOS.Controller.Observers.Interfaces in 'src\Controller\Oberservers\AppPOS.Controller.Observers.Interfaces.pas',
  AppPOS.Controller.Observers.Title in 'src\Controller\Oberservers\AppPOS.Controller.Observers.Title.pas',
  AppPOS.View.Form2Teste in 'src\View\AppPOS.View.Form2Teste.pas' {Form2},
  AppPOS.Controller.Observers.Total in 'src\Controller\Oberservers\AppPOS.Controller.Observers.Total.pas';

{$R *.res}

begin
  Application.Initialize;
  if ParamStr(1) = 'REST' then
    TDAOTypes.New.&Type(dtREST);
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TComponentItemCaixa, ComponentItemCaixa);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
