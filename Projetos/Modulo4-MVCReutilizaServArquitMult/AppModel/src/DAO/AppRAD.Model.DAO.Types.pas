unit AppRAD.Model.DAO.Types;

interface

type
  TDAOEnumTypes = (dtSQL, dtREST);

  iDAOTypes = interface
    ['{B3C049AF-FF44-4582-BEFD-D7D188C57466}']
    function &Type ( aValue : TDAOEnumTypes ) : iDAOTypes; overload;
    function &Type : TDAOEnumTypes; overload;
  end;

  TDAOTypes = class(TInterfacedObject, iDAOTypes)
    private
      FDAOEnumType : TDAOEnumTypes;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOTypes;
      function &Type ( aValue : TDAOEnumTypes ) : iDAOTypes; overload;
      function &Type : TDAOEnumTypes; overload;
  end;

var
  DAOType : iDAOTypes;


implementation

{ TDAOTypes }

constructor TDAOTypes.Create;
begin

end;

destructor TDAOTypes.Destroy;
begin

  inherited;
end;

class function TDAOTypes.New: iDAOTypes;
begin
  if not Assigned(DAOType) then
    DAOType := Self.Create;

  Result := DAOType;
end;

function TDAOTypes.&Type(aValue: TDAOEnumTypes): iDAOTypes;
begin
  Result := Self;
  FDAOEnumType := aValue;
end;

function TDAOTypes.&Type: TDAOEnumTypes;
begin
  Result := FDAOEnumType;
end;

end.
