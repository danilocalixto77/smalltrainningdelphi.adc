unit Imposto.SimplesNacional;

interface

uses
  Produto.Interfaces;

type
  TSimpleNacional = class(TInterfacedObject, iImposto)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iImposto;
      function Calculo ( aValue : Currency ) : Currency;
  end;

implementation

{ TSimpleNacional }

function TSimpleNacional.Calculo(aValue: Currency): Currency;
begin
  Result := aValue + (aValue * 0.1)
end;

constructor TSimpleNacional.Create;
begin

end;

destructor TSimpleNacional.Destroy;
begin

  inherited;
end;

class function TSimpleNacional.New: iImposto;
begin
  Result := Self.Create;
end;

end.
