unit AppRAD.Controller.Entity.Usuario;

interface

uses
  System.Classes,
  AppRAD.Controller.Interfaces,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.USUARIO;

type
  TControllerEntityUsuario = class(TInterfacedObject, iControllerUsuario)
    private
      [weak]
      FParent : iController;
      FModel : iDAOGeneric<TUSUARIO>;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerUsuario;
      function DAO : iDAOGeneric<TUSUARIO>;
      function ListComponent ( aComponent : TStrings ) : iControllerUsuario;
      function &End : iController;
  end;

implementation

uses
  AppRAD.Model.DAO.Factory;

{ TControllerEntityUsuario }

function TControllerEntityUsuario.&End: iController;
begin
  Result := FParent;
end;

constructor TControllerEntityUsuario.Create(Parent : iController);
begin
  FParent := Parent;
  FModel := TModelDAOFactory<TUSUARIO>.New.DAO;
end;

function TControllerEntityUsuario.DAO: iDAOGeneric<TUSUARIO>;
begin
  Result := FModel;
end;

destructor TControllerEntityUsuario.Destroy;
begin

  inherited;
end;

function TControllerEntityUsuario.ListComponent(
  aComponent: TStrings): iControllerUsuario;
begin
  aComponent.Clear;
  FModel.DataSet.First;
  while not FModel.DataSet.Eof do
  begin
    aComponent.AddObject(FModel.Current.NOME, TObject(Integer(FModel.Current.ID)));
    FModel.DataSet.Next;
  end;
end;

class function TControllerEntityUsuario.New(Parent : iController) : iControllerUsuario;
begin
    Result := Self.Create(Parent);
end;

end.
