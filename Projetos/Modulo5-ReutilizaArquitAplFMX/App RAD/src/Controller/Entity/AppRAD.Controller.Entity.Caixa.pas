unit AppRAD.Controller.Entity.Caixa;

interface

uses
  AppRAD.Controller.Interfaces,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CAIXA, Vcl.Forms;

type
  TControllerEntityCaixa = class(TInterfacedObject, iControllerCaixa)
    private
      [weak]
      FParent : iController;
      FModel : iDAOGeneric<TCAIXA>;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerCaixa;
      function AbrirCaixa(Owner : TForm) : iControllerCaixa;
      function CarregarVendas : iControllerCaixa;
      function DAO : iDAOGeneric<TCAIXA>;
      function &End : iController;
  end;

implementation

uses
  AppRAD.Model.DAO.Factory,
  System.SysUtils, AppRAD.View.Forms.Factory;

{ TControllerEntityCaixa }

function TControllerEntityCaixa.AbrirCaixa(Owner : TForm): iControllerCaixa;
begin
  Result := Self;
  TViewFormsFactory.New.CaixaAbrir(Owner).ShowModal;
  FModel.Find;
end;

function TControllerEntityCaixa.CarregarVendas: iControllerCaixa;
begin
  Result := Self;
  FParent.VENDA.DAO.Find('caixa', FModel.DataSet.FieldByName('ID').AsString);
end;

function TControllerEntityCaixa.&End: iController;
begin
  Result := FParent;
end;

constructor TControllerEntityCaixa.Create(Parent : iController);
begin
  FParent := Parent;
  FModel := TModelDAOFactory<TCAIXA>.New.DAO;
end;

function TControllerEntityCaixa.DAO: iDAOGeneric<TCAIXA>;
begin
  Result := FModel;
end;

destructor TControllerEntityCaixa.Destroy;
begin

  inherited;
end;

class function TControllerEntityCaixa.New(Parent : iController) : iControllerCaixa;
begin
    Result := Self.Create(Parent);
end;

end.
