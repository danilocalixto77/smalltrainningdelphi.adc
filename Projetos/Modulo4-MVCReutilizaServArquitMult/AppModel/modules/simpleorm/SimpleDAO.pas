unit SimpleDAO;

interface

uses
  SimpleInterface,
  System.RTTI,
  System.Generics.Collections,
  System.Classes,
  Data.DB,
  {$IFNDEF CONSOLE}
  VCL.Forms,
  {$ENDIF}
  SimpleDAOSQLAttribute,
  System.Threading, System.SysUtils;

Type
  TSimpleDAO<T: class, constructor> = class(TInterfacedObject, iSimpleDAO<T>)
    private
      FQuery : iSimpleQuery;
      FDataSource : TDataSource;
      FSQLAttribute : iSimpleDAOSQLAttribute<T>;
      FDataChange : TProc<TObject, TField>;
      {$IFNDEF CONSOLE}
      FForm : TForm;
      {$ENDIF}
      FList : TObjectList<T>;
      FCurrentObject : T;
      function FillParameter(aInstance : T) : iSimpleDAO<T>; overload;
      function FillParameter(aInstance : T; aId : Variant) : iSimpleDAO<T>; overload;
      procedure OnDataChange(Sender : TObject; Field : TField);
    public
      constructor Create(aQuery : iSimpleQuery);
      destructor Destroy; override;
      class function New(aQuery : iSimpleQuery) : iSimpleDAO<T>; overload;
      function DataSource( aDataSource : TDataSource) : iSimpleDAO<T>;
      function DataChange(aValue : TProc<TObject, TField>) : iSimpleDAO<T>;
      function Insert(aValue : T) : iSimpleDAO<T>; overload;
      function Update(aValue : T) : iSimpleDAO<T>; overload;
      function Delete(aValue : T) : iSimpleDAO<T>; overload;
      function Delete(aField : String; aValue : String) : iSimpleDAO<T>; overload;
      function LastID : iSimpleDAO<T>;
      function Current : T;
      {$IFNDEF CONSOLE}
      function Insert: iSimpleDAO<T>; overload;
      function Update : iSimpleDAO<T>; overload;
      function Delete : iSimpleDAO<T>; overload;
      {$ENDIF}
      function Find : iSimpleDAO<T>; overload;
      function Find(var aList : TObjectList<T>) : iSimpleDAO<T> ; overload;
      function Find( aId : Integer) : T; overload;
      function SQL : iSimpleDAOSQLAttribute<T>;
      {$IFNDEF CONSOLE}
      function BindForm(aForm : TForm)  : iSimpleDAO<T>;
      {$ENDIF}
  end;

implementation

uses
  SimpleAttributes, System.TypInfo, SimpleRTTI, SimpleSQL;

{ TGenericDAO }

{$IFNDEF CONSOLE}
function TSimpleDAO<T>.BindForm(aForm : TForm)  : iSimpleDAO<T>;
begin
  Result := Self;
  FForm := aForm;
end;
{$ENDIF}

constructor TSimpleDAO<T>.Create(aQuery : iSimpleQuery);
begin
  FQuery := aQuery;
  FSQLAttribute := TSimpleDAOSQLAttribute<T>.New(Self);
  FList := TObjectList<T>.Create;
end;

function TSimpleDAO<T>.Current: T;
begin
  if Assigned(FCurrentObject) then
    FCurrentObject.Free;

  FCurrentObject := T.Create;
  TSimpleRTTI<T>.New(nil).DataSetToEntity(FQuery.DataSet, FCurrentObject);
  Result := FCurrentObject;
end;

function TSimpleDAO<T>.DataChange(
  aValue: TProc<TObject, TField>): iSimpleDAO<T>;
begin
  Result := Self;
  FDataChange := aValue;
end;

function TSimpleDAO<T>.DataSource(aDataSource: TDataSource): iSimpleDAO<T>;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FQuery.DataSet;
  FDataSource.OnDataChange := OnDataChange;
end;

function TSimpleDAO<T>.Delete(aValue: T): iSimpleDAO<T>;
var
  aSQL : String;
begin
  Result := Self;
  TSimpleSQL<T>.New(aValue).Delete(aSQL);
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  Self.FillParameter(aValue);
  FQuery.ExecSQL;
end;

{$IFNDEF CONSOLE}
function TSimpleDAO<T>.Delete: iSimpleDAO<T>;
var
  aSQL : String;
  Entity : T;
begin
  Result := Self;
  Entity := T.Create;
  try
    TSimpleSQL<T>.New(Entity).Delete(aSQL);
    FQuery.SQL.Clear;
    FQuery.SQL.Add(aSQL);
    TSimpleRTTI<T>.New(nil).BindFormToClass(FForm, Entity);
    Self.FillParameter(Entity);
    FQuery.ExecSQL;
  finally
    FreeAndNil(Entity);
  end;
end;
{$ENDIF}

function TSimpleDAO<T>.Delete(aField,
  aValue: String): iSimpleDAO<T>;
var
  aSQL : String;
  Entity : T;
  aTableName: string;
begin
  Result := Self;
  Entity := T.Create;
  try
    TSimpleSQL<T>.New(Entity).Delete(aSQL);

    TSimpleRTTI<T>
      .New(Entity)
      .TableName(aTableName);

    aSQL := 'DELETE FROM ' + aTableName + ' WHERE ' + aField + ' = ' + aValue;

    FQuery.SQL.Clear;
    FQuery.SQL.Add(aSQL);
    FQuery.ExecSQL;
  finally
    FreeAndNil(Entity);
  end;
end;

destructor TSimpleDAO<T>.Destroy;
begin
  FreeAndNil(FList);

  if Assigned(FCurrentObject) then
    FCurrentObject.Free;

  inherited;
end;

function TSimpleDAO<T>.Find : iSimpleDAO<T>;
var
  aSQL : String;
begin
  Result := Self;

  TSimpleSQL<T>
    .New(nil)
    .Fields(FSQLAttribute.Fields)
    .Join(FSQLAttribute.Join)
    .Where(FSQLAttribute.Where)
    .OrderBy(FSQLAttribute.OrderBy)
    .Select(aSQL);

  FQuery.DataSet.DisableControls;
  FQuery.Open(aSQL);
  TSimpleRTTI<T>.New(nil).DataSetToEntityList(FQuery.DataSet, FList);
  FSQLAttribute.Clear;
  FQuery.DataSet.EnableControls;
end;

function TSimpleDAO<T>.Find(aId: Integer): T;
var
  aSQL : String;
begin
  Result := T.Create;
  TSimpleSQL<T>.New(nil).SelectId(aSQL);
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  Self.FillParameter(Result, aId);
  FQuery.Open;
  TSimpleRTTI<T>.New(nil).DataSetToEntity(FQuery.DataSet, Result);
end;

{$IFNDEF CONSOLE}
function TSimpleDAO<T>.Insert: iSimpleDAO<T>;
var
  aSQL : String;
  Entity : T;
begin
  Result := Self;
  Entity := T.Create;
  try
    TSimpleSQL<T>.New(Entity).Insert(aSQL);
    FQuery.SQL.Clear;
    FQuery.SQL.Add(aSQL);
    TSimpleRTTI<T>.New(nil).BindFormToClass(FForm, Entity);
    Self.FillParameter(Entity);
    FQuery.ExecSQL;
  finally
    FreeAndNil(Entity);
  end;
end;

{$ENDIF}

function TSimpleDAO<T>.LastID: iSimpleDAO<T>;
var
  aDataBase : String;
  aGenId : String;
begin
  Result := Self;

  TSimpleRTTI<T>.New(nil).DataBaseType(aDataBase);

  if aDataBase = 'FB' then
  begin
    TSimpleRTTI<T>.New(nil).GeneratorName(aGenId);
    FQuery.Open('SELECT gen_id('+aGenId+',0) as ID from RDB$DATABASE');
  end
  else if aDataBase = 'MySQL' then
    FQuery.Open('SELECT LAST_INSERT_ID() as ID');
end;

function TSimpleDAO<T>.Find(var aList: TObjectList<T>): iSimpleDAO<T>;
var
  aSQL : String;
begin
  Result := Self;

  TSimpleSQL<T>
    .New(nil)
    .Fields(FSQLAttribute.Fields)
    .Join(FSQLAttribute.Join)
    .Where(FSQLAttribute.Where)
    .OrderBy(FSQLAttribute.OrderBy)
    .Select(aSQL);

  FQuery.Open(aSQL);
  TSimpleRTTI<T>.New(nil).DataSetToEntityList(FQuery.DataSet, aList);
  FSQLAttribute.Clear;
end;

function TSimpleDAO<T>.Insert(aValue: T): iSimpleDAO<T>;
var
  aSQL : String;
begin
  Result := Self;
  TSimpleSQL<T>.New(aValue).Insert(aSQL);
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  Self.FillParameter(aValue);
  FQuery.ExecSQL;
end;


class function TSimpleDAO<T>.New(aQuery : iSimpleQuery): iSimpleDAO<T>;
begin
  Result := Self.Create(aQuery);
end;

procedure TSimpleDAO<T>.OnDataChange(Sender: TObject; Field: TField);
begin
  if ( FList.Count > 0) and (FDataSource.DataSet.RecNo-1 <= FList.Count) then
  begin
    {$IFNDEF CONSOLE}
    if Assigned(FForm) then
     TSimpleRTTI<T>
      .New(nil)
      .BindClassToForm(FForm, FList[FDataSource.DataSet.RecNo-1]);
    {$ENDIF}
  end;
  if Assigned(FDataChange) then
    FDataChange(Sender, Field);
end;

function TSimpleDAO<T>.SQL: iSimpleDAOSQLAttribute<T>;
begin
  Result := FSQLAttribute;
end;

{$IFNDEF CONSOLE}
function TSimpleDAO<T>.Update: iSimpleDAO<T>;
var
  aSQL : String;
  Entity : T;
begin
  Result := Self;
  Entity := T.Create;
  try
    TSimpleSQL<T>.New(Entity).Update(aSQL);
    FQuery.SQL.Clear;
    FQuery.SQL.Add(aSQL);
    TSimpleRTTI<T>.New(nil).BindFormToClass(FForm, Entity);
    Self.FillParameter(Entity);
    FQuery.ExecSQL;
  finally
    FreeAndNil(Entity)
  end;
end;
{$ENDIF}

function TSimpleDAO<T>.Update(aValue: T): iSimpleDAO<T>;
var
  aSQL : String;
begin
  Result := Self;
  TSimpleSQL<T>.New(aValue).Update(aSQL);
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  Self.FillParameter(aValue);
  FQuery.ExecSQL;
end;

function TSimpleDAO<T>.FillParameter(aInstance: T): iSimpleDAO<T>;
var
  Key : String;
  DictionaryFields : TDictionary<String, Variant>;
  P : TParams;
begin
  DictionaryFields := TDictionary<String, Variant>.Create;
  TSimpleRTTI<T>.New(aInstance).DictionaryFields(DictionaryFields);
  try
    for Key in DictionaryFields.Keys do
    begin
      if FQuery.Params.FindParam(Key) <> nil then
        FQuery.Params.ParamByName(Key).Value := DictionaryFields.Items[Key];
    end;
  finally
    FreeAndNil(DictionaryFields);
  end;
end;

function TSimpleDAO<T>.FillParameter(aInstance: T;
  aId: Variant): iSimpleDAO<T>;
var
  I : Integer;
  ListFields : TList<String>;
begin
  ListFields := TList<String>.Create;
  TSimpleRTTI<T>.New(aInstance).ListFields(ListFields);
  try
    for I := 0 to Pred(ListFields.Count) do
    begin
      if FQuery.Params.FindParam(ListFields[I]) <> nil then
        FQuery.Params.ParamByName(ListFields[I]).Value := aId;
    end;
  finally
    FreeAndNil(ListFields);
  end;
end;

end.
