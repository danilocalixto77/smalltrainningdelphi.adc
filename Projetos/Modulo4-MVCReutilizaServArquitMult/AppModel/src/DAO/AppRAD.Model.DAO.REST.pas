unit AppRAD.Model.DAO.REST;

interface

uses
  Data.DB,
  System.Generics.Collections,
  AppRAD.Model.DAO.Intefaces,
  SimpleInterface,
  System.SysUtils,
  RESTRequest4D.Request,
  GBJSON.Helper,
  SimpleRTTI,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, AppModel.RTTI.Utils;


type
  TModelDAOREST<T : class, constructor> = class(TInterfacedObject, iDAOGeneric<T>)
    private
      //FDataSource : TDataSource;
      //FObject : T;
      FBaseURL : String;
      FDMemTable : TFDMemTable;
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
      function Query : ISimpleDAO<T>;
      function DataSet : TDataSet;
      function LastID : Integer;
      function DataChange( aValue : TProc<TObject, TField>) : iDAOGeneric<T>;
  end;

implementation

{ TModelDAOREST<T> }

constructor TModelDAOREST<T>.Create;
begin
  FBaseURL := 'http://localhost:9000';
  FDMemTable := TFDMemTable.Create(nil);
end;

function TModelDAOREST<T>.Current: T;
begin
  if not Assined(FObject) then
    FObject := T.Create;

  TSimpleRTTI<T>.New(nil).DataSetToEntity(FDMemTable, FObject);

  Result := FObject;
end;

function TModelDAOREST<T>.DataChange(
  aValue: TProc<TObject, TField>): iDAOGeneric<T>;
begin
  Result := Self;
end;

function TModelDAOREST<T>.DataSet: TDataSet;
begin
  Result := FDMemTable;
end;

function TModelDAOREST<T>.DataSource(aValue: TDataSource): iDAOGeneric<T>;
begin
  Result := Self;
  aValue.DataSet := FDMemTable;
end;

function TModelDAOREST<T>.Delete: iDAOGeneric<T>;
begin
  Result := Self;
end;

function TModelDAOREST<T>.Delete(aParam, aValue: String): iDAOGeneric<T>;
begin
  Result := Self;

  TRequest
    .New
      .BaseURL(FBaseURL + TRTTIUtils<T>.GetBaseURL + '/' + aValue)
      .Accept('application/json')
    .Delete;
end;

destructor TModelDAOREST<T>.Destroy;
begin
  FDMemTable.Free;

  if Assigned(FObject) then
    FObject.Free;

  inherited;
end;

function TModelDAOREST<T>.Find(aParam, aValue: String): iDAOGeneric<T>;
var
  aBaseURL: string;
begin
  Result := Self;
  aBaseURL := FBaseURL + TRTTIUtils<T>.GetBaseURL + '/' + aParam + '/' + aValue;
  FDMemTable.DisableControls;
  TRequest
    .New
      .BaseURL(aBaseURL)
      .Accept('application/json')
      .DataSetAdapter(FDMemTable)
    .Get;
  FDMemTable.EnableControls;
end;

function TModelDAOREST<T>.Find(var aList: TObjectList<T>): iDAOGeneric<T>;
begin
  Result := Self;
end;

function TModelDAOREST<T>.Find(const aID: String): iDAOGeneric<T>;
var
  aBaseURL: string;
begin
  Result := Self;
  aBaseURL := FBaseURL + TRTTIUtils<T>.GetBaseURL + '/' + aID;
  FDMemTable.DisableControls;
  TRequest
    .New
      .BaseURL(aBaseURL)
      .Accept('application/json')
      .DataSetAdapter(FDMemTable)
    .Get;
  FDMemTable.EnableControls;
end;

function TModelDAOREST<T>.Find: iDAOGeneric<T>;
begin
  Result := Self;

  FDMemTable.DisableControls;

  TRequest
  .New
    .BaseURL(FBaseURL + TRTTIUtils<T>.GetBaseURL)
    .Accept('application/json')
    .DataSetAdapter(FDMemTable)
  .Get;

  FDMemTable.EnableControls;
end;

function TModelDAOREST<T>.Insert: iDAOGeneric<T>;
begin
  Result := Self;
  TRequest
    .New
      .BaseURL(FBaseURL + TRTTIUtils<T>.GetBaseURL)
      .Accept('application/json')
      .AddBody(FObject.ToJsonString)
   .Post;
end;

function TModelDAOREST<T>.LastID: Integer;
begin
  TRequest.New.BaseURL(FBaseURL + TRTTIUtils<T>.GetBaseURL + '/lastid')
    .Accept('application/json')
    .DataSetAdapter(FDMemTable)
  .Get;

  Result := FDMemTable.FieldByName('id').AsInteger;
end;

class function TModelDAOREST<T>.New: iDAOGeneric<T>;
begin
    Result := Self.Create;
end;

function TModelDAOREST<T>.NewObject: T;
begin
  if Assigned(FObject) then
    FObject.Free;

  FObject := T.Create;
  Result := FObject;
end;

function TModelDAOREST<T>.Query: ISimpleDAO<T>;
begin

end;

function TModelDAOREST<T>.Update: iDAOGeneric<T>;
begin
  Result := Self;
  TRequest
    .New
      .BaseURL(FBaseURL + TRTTIUtils<T>.GetBaseURL)
      .Accept('application/json')
      .AddBody(FObject.ToJsonString)
   .Put;
end;

end.
