unit AppRAD.Model.DAO.Factory;

interface

uses
  AppRAD.Model.DAO.Intefaces, AppRAD.Model.DAO.REST;

type
  TModelDAOFactory<T : class, constructor> = class(TInterfacedObject, iDAOFactory<T>)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOFactory<T>;
      function DAO : iDAOGeneric<T>;
  end;

implementation

uses
  AppRAD.Model.DAO.SQL;

{ TModelDAOFactory<T> }

constructor TModelDAOFactory<T>.Create;
begin

end;

function TModelDAOFactory<T>.DAO: iDAOGeneric<T>;
begin
  Result := TModelDAOSQL<T>.New;
  //Result := TModelDAOREST<T>.New;
end;

destructor TModelDAOFactory<T>.Destroy;
begin

  inherited;
end;

class function TModelDAOFactory<T>.New: iDAOFactory<T>;
begin
    Result := Self.Create;
end;

end.
