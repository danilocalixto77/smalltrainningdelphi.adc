unit Imposto.LucroPresumido;

interface

uses
  Produto.Interfaces;

type
  TLucroPresumido = class(TInterfacedObject, iImposto)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iImposto;
      function Calculo ( aValue : Currency ) : Currency;
  end;

implementation

{ TLucroPresumido }

function TLucroPresumido.Calculo(aValue: Currency): Currency;
begin
  Result := aValue + (aValue * 0.6)
end;

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
