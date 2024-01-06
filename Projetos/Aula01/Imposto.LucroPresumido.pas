unit Imposto.LucroPresumido;

interface
type
  TLucroPresumido = class (TInterfacedObject, iImposto)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iImposto;

  end;

implementation

{ TLucroPresumido }

constructor TLucroPresumido.Create;
begin

end;

destructor TLucroPresumido.Destroy;
begin

  inherited;
end;

class function TLucroPresumido.New: iImposto;
begin
  Result := Self.Create;
end;

end.
