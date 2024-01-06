unit Produto;

interface

uses
  Produto.Interfaces, Vcl.Forms, System.SysUtils, Produto.Helpers;

type
  TProduto = class(TInterfacedObject, iProduto)
    private
      FBind         : TForm;
      FValor        : Currency;
      FRegraFiscal  : TRegrasFiscais;
      FDisplay      : TProc<String>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iProduto;
      function Valor (aValue : Currency ) : iProduto; overload;
      function Valor (aValue : String) : iProduto; overload;
      function Regra (aValue : TRegrasFiscais ) : iProduto; overload;
      function Regra (aValue : Integer ) : iProduto; overload;
      function Bind (aValue : TForm) : iProduto;
      function Display ( aValue : TProc<String>) : iProduto;
      function Total : Currency;
  end;

implementation

uses
  System.Classes, Vcl.StdCtrls;

{ TProduto }

function TProduto.Bind(aValue: TForm): iProduto;
begin
  Result := Self;
  FBind := aValue;
end;

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

  inherited;
end;

function TProduto.Display(aValue: TProc<String>): iProduto;
begin
  Result := Self;
  FDisplay := aValue;
end;

class function TProduto.New: iProduto;
begin
  Result := Self.Create;
end;

function TProduto.Regra(aValue: Integer): iProduto;
begin
  Result := Self;
  FRegraFiscal := TRegrasFiscais(aValue);
end;

function TProduto.Regra(aValue: TRegrasFiscais): iProduto;
begin
  Result := Self;
  FRegraFiscal := aValue;
end;

function TProduto.Total: Currency;
begin
  Result := FRegraFiscal.This.Calculo(FValor);

  if Assigned(FDisplay) then
    FDisplay(CurrToStr(Result));
end;

function TProduto.Valor(aValue: String): iProduto;
var
  aComponent : TComponent;
begin
  Result := Self;
  FValor := StrToCurr(aValue);

  if FValor <= 0 then
  begin
    aComponent := FBind.FindComponent('edtValor');
    if Assigned(aComponent) then
      if aComponent is TEdit then
        TEdit(aComponent).SetFocus;
    raise Exception.Create('O valor não pode ser menor ou igual a zero.');
  end;

end;

function TProduto.Valor(aValue: Currency): iProduto;
begin
  Result := Self;
  FValor := aValue;
end;

end.
