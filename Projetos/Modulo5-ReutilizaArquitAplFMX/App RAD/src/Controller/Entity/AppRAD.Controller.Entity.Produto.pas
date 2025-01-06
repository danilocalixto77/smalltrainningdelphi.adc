unit AppRAD.Controller.Entity.Produto;

interface

uses
  System.Classes,
  AppRAD.Controller.Interfaces,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.Produto;

type
  TControllerEntityProduto = class(TInterfacedObject, iControllerProduto)
    private
      [weak]
      FParent : iController;
      FModel : iDAOGeneric<TPRODUTO>;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerProduto;
      function DAO : iDAOGeneric<TPRODUTO>;
      function ListComponent ( aComponent : TStrings ) : iControllerProduto;
      function &End : iController;
  end;

implementation

uses
  AppRAD.Model.DAO.Factory;

{ TControllerEntityProduto }

function TControllerEntityProduto.&End: iController;
begin
  Result := FParent;
end;

constructor TControllerEntityProduto.Create(Parent : iController);
begin
  FParent := Parent;
  FModel := TModelDAOFactory<TPRODUTO>.New.DAO;
end;

function TControllerEntityProduto.DAO: iDAOGeneric<TPRODUTO>;
begin
  Result := FModel;
end;

destructor TControllerEntityProduto.Destroy;
begin

  inherited;
end;

function TControllerEntityProduto.ListComponent(
  aComponent: TStrings): iControllerProduto;
begin
  aComponent.Clear;
  FModel.DataSet.First;
  while not FModel.DataSet.Eof do
  begin
    aComponent.AddObject(FModel.Current.DESCRICAO, TObject(Integer(FModel.Current.ID)));
    FModel.DataSet.Next;
  end;
end;

class function TControllerEntityProduto.New(Parent : iController) : iControllerProduto;
begin
    Result := Self.Create(Parent);
end;

end.
