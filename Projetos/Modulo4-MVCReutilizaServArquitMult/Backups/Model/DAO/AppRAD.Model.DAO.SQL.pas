unit AppRAD.Model.DAO.SQL;

interface

uses
  Data.DB,
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  AppRAD.Model.DAO.Intefaces, System.Generics.Collections, System.SysUtils;


type
  TModelDAOSQL<T : class,constructor> = class(TInterfacedObject, iDAOGeneric<T>)
    private
      FConn : iSimpleQuery;
      FDAO : iSimpleDAO<T>;
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
      function Find ( aParam : String; aValue : String) : iDAOGeneric<T>; overload;
      function Delete : iDAOGeneric<T>; overload;
      function Delete ( aParam : String; aValue : String) : iDAOGeneric<T>; overload;
      function DataSource ( aValue : TDataSource ) : iDAOGeneric<T>;
      function Current : T;
      function NewObject : T;
      function DataSet : TDataSet;
      function LastID : Integer;
      function DataChange( aValue : TProc<TObject, TField>) : iDAOGeneric<T>;
  end;

implementation

uses
  AppRAD.Model.Connection.Firedac;

{ TModelDAOSQL<T> }

constructor TModelDAOSQL<T>.Create;
begin
  FDataSource := TDataSource.Create(nil);
  FConn := TSimpleQueryFiredac.New(TModelConnectionFiredac.New.Connection);
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TModelDAOSQL<T>.Current: T;
begin
  Result := FDAO.Current;
end;

function TModelDAOSQL<T>.DataChange(
  aValue: TProc<TObject, TField>): iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.DataChange(aValue);
end;

function TModelDAOSQL<T>.DataSet: TDataSet;
begin
  Result := FDataSource.DataSet;
end;

function TModelDAOSQL<T>.DataSource(aValue: TDataSource): iDAOGeneric<T>;
begin
  Result := Self;
  aValue.DataSet := FDataSource.DataSet;
end;

function TModelDAOSQL<T>.Delete: iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Delete(FObject);
end;

function TModelDAOSQL<T>.Delete(aParam, aValue: String): iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Delete(aParam, aValue);
end;

destructor TModelDAOSQL<T>.Destroy;
begin
  FDataSource.Free;

  if Assigned(FObject) then
    FObject.Free;

  inherited;
end;

function TModelDAOSQL<T>.Find(aParam, aValue: String): iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.SQL.Where(aParam + ' = ' + aValue).&End.Find;
end;

function TModelDAOSQL<T>.Find(var aList: TObjectList<T>): iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Find(aList);
end;

function TModelDAOSQL<T>.Find(const aID: String): iDAOGeneric<T>;
begin
  Result := Self;
  if Assigned(FObject) then FObject.Free;
  FObject := FDAO.Find(StrToInt(aId));
end;

function TModelDAOSQL<T>.Find: iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Find;
end;

function TModelDAOSQL<T>.Insert: iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Insert(FObject);
end;

function TModelDAOSQL<T>.LastID: Integer;
begin
  FDAO.LastID;
  Result := FDataSource.DataSet.FieldByName('ID').AsInteger;
end;

class function TModelDAOSQL<T>.New: iDAOGeneric<T>;
begin
    Result := Self.Create;
end;

function TModelDAOSQL<T>.NewObject: T;
begin
  if Assigned(FObject) then
    FObject.Free;

  FObject := T.Create;
  Result := FObject;
end;

function TModelDAOSQL<T>.Update: iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Update(FObject);
end;

end.
