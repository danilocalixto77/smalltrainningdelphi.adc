unit AppPOS.Controller.Entity.CAIXA;

interface

uses
  AppPOS.Controller.Interfaces,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CAIXA,
  FMX.Forms, FMX.Types;

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
      function ListarCaixas (Owner : TFMXObject) : iControllerCaixa;
      function &End : iController;
  end;

implementation

uses
  AppRAD.Model.DAO.Factory,
  AppPOS.View.Components.ItemCaixa, AppPOS.Controller.Observers.Title,
  AppPOS.Controller.Observers.Total;

{ TControllerEntityCaixa }

function TControllerEntityCaixa.AbrirCaixa(Owner: TForm): iControllerCaixa;
begin
  //
end;

function TControllerEntityCaixa.CarregarVendas: iControllerCaixa;
begin
  //
end;

function TControllerEntityCaixa.&End: iController;
begin
  Result := FParent;
end;

function TControllerEntityCaixa.ListarCaixas(
  Owner: TFMXObject): iControllerCaixa;
var
  FTotal : Currency;
begin
  FModel.Find;
  FTotal := 0;
  TControllerObserverTitle.New.SendMessage('LISTA DE CAIXAS');

  while not FModel.DataSet.Eof do
  begin
    Owner.AddObject(
      TComponentItemCaixa
        .Create(Owner)
        .Id(FModel.DataSet.FieldByName('ID').AsString)
        .DataAbertura(FModel.DataSet.FieldByName('DATAABERTURA').AsString)
        .DataFechamento(FModel.DataSet.FieldByName('DATAFECHAMENTO').AsString)
        .ValorAbertura(FModel.DataSet.FieldByName('VALORABERTURA').AsCurrency)
        .ValorFechamento(FModel.DataSet.FieldByName('VALORFECHAMENTO').AsCurrency)
      .Component
    );
    FTotal := FTotal + FModel.DataSet.FieldByName('VALORABERTURA').AsCurrency;
    FModel.DataSet.Next;
  end;

  TControllerObserverTotal.New.SendMessage(FTotal);

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
