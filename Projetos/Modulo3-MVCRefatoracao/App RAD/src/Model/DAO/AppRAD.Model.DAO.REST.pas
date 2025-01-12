unit AppRAD.Model.DAO.REST;

interface

uses
  Data.DB,
  System.Generics.Collections,
  AppRAD.Model.DAO.Intefaces, SimpleInterface, System.SysUtils;


type
  TModelDAOREST<T : class, constructor> = class(TInterfacedObject, iDAOGeneric<T>)
    private
      FDataSource : TDataSource;
      FObject : T;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOGeneric<T>;
      function Insert : iDAOGeneric<T>;
      function Update : iDAOGeneric<T>;
      function Find : iDAOGeneric<T>; overload;
      function Find (const aID : String ) : iDAOGeneric<T>; overload;
      function Find (var aList : TObjectList<T>) : iDAOGeneric<T> ; overload;
      function Delete : iDAOGeneric<T>;
      function DataSource ( aValue : TDataSource ) : iDAOGeneric<T>;
      function Current : T;
      function NewObject : T;
      function Query : ISimpleDAO<T>;
      function DataSet : TDataSet;
      function LastID : Integer;
      function DataChange( aValue : TProc<TObject, TField>) : iDAOGeneric<T>;
  end;

implementation

{ TModelDAOREST<T> }

constructor TModelDAOREST<T>.Create;
begin

end;

function TModelDAOREST<T>.Current: T;
begin

end;

function TModelDAOREST<T>.DataChange(
  aValue: TProc<TObject, TField>): iDAOGeneric<T>;
begin

end;

function TModelDAOREST<T>.DataSet: TDataSet;
begin

end;

function TModelDAOREST<T>.DataSource(aValue: TDataSource): iDAOGeneric<T>;
begin

end;

function TModelDAOREST<T>.Delete: iDAOGeneric<T>;
begin

end;

destructor TModelDAOREST<T>.Destroy;
begin

  inherited;
end;

function TModelDAOREST<T>.Find(var aList: TObjectList<T>): iDAOGeneric<T>;
begin

end;

function TModelDAOREST<T>.Find(const aID: String): iDAOGeneric<T>;
begin

end;

function TModelDAOREST<T>.Find: iDAOGeneric<T>;
begin

end;

function TModelDAOREST<T>.Insert: iDAOGeneric<T>;
begin
  {
    aJson := ClasseToJson(FObject);
    Rest.Body := aJson;
    Rest.BaseURL := SERVIDORURL + GetBaseURL();
    Rest.Post;
  }
end;

function TModelDAOREST<T>.LastID: Integer;
begin

end;

class function TModelDAOREST<T>.New: iDAOGeneric<T>;
begin
    Result := Self.Create;
end;

function TModelDAOREST<T>.NewObject: T;
begin

end;

function TModelDAOREST<T>.Query: ISimpleDAO<T>;
begin

end;

function TModelDAOREST<T>.Update: iDAOGeneric<T>;
begin

end;

end.
