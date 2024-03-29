unit Imposto.LucroReal;

interface

uses
  Produto.Interfaces;

type
  TLucroReal = class(TInterfacedObject, iImposto)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iImposto;
      function Calculo ( aValue : Currency ) : Currency;
  end;

implementation

{ TLucroReal }

function TLucroReal.Calculo(aValue: Currency): Currency;
begin
  Result := aValue + (aValue * 0.4);
end;

constructor TLucroReal.Create;
begin

end;

destructor TLucroReal.Destroy;
begin

  inherited;
end;

class function TLucroReal.New: iImposto;
begin
    Result := Self.Create;
end;

end.
