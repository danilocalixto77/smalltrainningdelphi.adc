unit Produto;

interface

uses
  Produto.Interfaces;

type
  TProduto = class(TInterfacedObject, iProduto)
    private
      FValor        : Currency;
      FRegraFiscal  : TRegrasFiscais;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iProduto;
      function Valor (aValue : Currency ) : iProduto; overload;
      function Valor (aValue : String) : iProduto; overload;
      function Regra (aValue : TRegrasFiscais ) : iProduto;
      function Total : Currency;
  end;

implementation

uses
  System.SysUtils;

{ TProduto }

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

  inherited;
end;

class function TProduto.New: iProduto;
begin
  Result := Self.Create;
end;

function TProduto.Regra(aValue: TRegrasFiscais): iProduto;
begin
  Result := Self;
  FRegraFiscal := aValue;
end;

function TProduto.Total: Currency;
begin

  case FRegraFiscal of
    SimplesNacional: Result := FValor + (FValor * 0.1);
    LucroReal: Result := FValor + (FValor * 0.4);
  end;

end;

function TProduto.Valor(aValue: String): iProduto;
begin
  Result := Self;
  FValor := StrToCurr(aValue);

  if FValor <= 0 then
    raise Exception.Create('O valor não pode ser menor ou igual a zero.');
end;

function TProduto.Valor(aValue: Currency): iProduto;
begin
  Result := Self;
  FValor := aValue;
end;

end.
