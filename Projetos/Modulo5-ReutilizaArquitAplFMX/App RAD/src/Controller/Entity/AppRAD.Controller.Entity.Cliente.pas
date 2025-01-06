unit AppRAD.Controller.Entity.Cliente;

interface

uses
  System.Classes,
  AppRAD.Controller.Interfaces,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.Cliente;

type
  TControllerEntityCliente = class(TInterfacedObject, iControllerCliente)
    private
      [weak]
      FParent : iController;
      FModel : iDAOGeneric<TCliente>;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerCliente;
      function DAO : iDAOGeneric<TCliente>;
      function ListComponent ( aComponent : TStrings ) : iControllerCliente;
      function &End : iController;
  end;

implementation

uses
  AppRAD.Model.DAO.Factory;

{ TControllerEntityCliente }

function TControllerEntityCliente.&End: iController;
begin
  Result := FParent;
end;

constructor TControllerEntityCliente.Create(Parent : iController);
begin
  FParent := Parent;
  FModel := TModelDAOFactory<TCliente>.New.DAO;
end;

function TControllerEntityCliente.DAO: iDAOGeneric<TCliente>;
begin
  Result := FModel;
end;

destructor TControllerEntityCliente.Destroy;
begin

  inherited;
end;

function TControllerEntityCliente.ListComponent(
  aComponent: TStrings): iControllerCliente;
begin
  aComponent.Clear;
  FModel.DataSet.First;
  while not FModel.DataSet.Eof do
  begin
    aComponent.AddObject(FModel.Current.NOME, TObject(Integer(FModel.Current.ID)));
    FModel.DataSet.Next;
  end;
end;

class function TControllerEntityCliente.New(Parent : iController) : iControllerCliente;
begin
    Result := Self.Create(Parent);
end;

end.
