unit AppRAD.Controller;

interface

uses
  AppRAD.Controller.Interfaces,
  AppRAD.Model.Entity.CAIXA,
  AppRAD.Model.Entity.VENDA, AppRAD.Model.Entity.VENDAITENS;

type
  TController = class(TInterfacedObject, iController)
    private
      FCAIXA : iControllerCaixa;
      FVENDA : iControllerVenda;
      FUSUARIO : iControllerUsuario;
      FCLIENTE : iControllerCliente;
      FPRODUTO : iControllerProduto;
      FVENDAITENS :  iControllerEntity<TVENDAITENS>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function CAIXA : iControllerCaixa;
      function VENDA : iControllerVenda;
      function USUARIO : iControllerUsuario;
      function CLIENTE : iControllerCliente;
      function PRODUTO : iControllerProduto;
      function VENDAITENS : iControllerEntity<TVENDAITENS>;
  end;

implementation

uses
  AppRAD.Controller.Generic,
  AppRAD.Controller.Entity.Caixa, AppRAD.Controller.Entity.Usuario,
  AppRAD.Controller.Entity.Cliente, AppRAD.Controller.Entity.Venda,
  AppRAD.Controller.Entity.Produto;

{ TController }

function TController.CAIXA: iControllerCaixa;
begin
  if not Assigned(FCAIXA) then
    FCAIXA := TControllerEntityCaixa.New(Self);

  Result := FCAIXA;
end;

function TController.CLIENTE: iControllerCliente;
begin
  if not Assigned(FCLIENTE) then
    FCLIENTE := TControllerEntityCliente.New(Self);

  Result := FCLIENTE;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
    Result := Self.Create;
end;

function TController.PRODUTO: iControllerProduto;
begin
  if not Assigned(FPRODUTO) then
    FPRODUTO := TControllerEntityProduto.New(Self);

  Result := FPRODUTO;
end;

function TController.USUARIO: iControllerUsuario;
begin
  if not Assigned(FUSUARIO) then
    FUSUARIO := TControllerEntityUsuario.New(Self);

  Result := FUSUARIO;
end;

function TController.VENDA: iControllerVenda;
begin
  if not Assigned(FVENDA) then
    FVENDA := TControllerEntityVenda.New(Self);

  Result := FVENDA;
end;

function TController.VENDAITENS: iControllerEntity<TVENDAITENS>;
begin
   if not Assigned(FVENDAITENS) then
    FVENDAITENS := TControllerGeneric<TVENDAITENS>.New(Self);

   Result := FVENDAITENS;
end;

end.
