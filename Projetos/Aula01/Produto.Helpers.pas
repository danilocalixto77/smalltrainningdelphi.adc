unit Produto.Helpers;

interface

uses
  Vcl.StdCtrls,
  SysUtils,
  Produto.Interfaces, Imposto.LucroPresumido;

type
  THelperEnumToCombo = class Helper for TComboBox

  procedure RegrasFiscais;
  end;

  THelperRegrasFiscais = record Helper for TRegrasFiscais
    function This : iImposto;
  end;

implementation

uses
  System.TypInfo, Imposto.SimplesNacional, Imposto.LucroReal;

{THelperEnumToCombo}

{ THelperEnumToCombo }

procedure THelperEnumToCombo.RegrasFiscais;
var
  i: Integer;
begin
  Self.Items.Clear;
  for i := Ord(Low(TRegrasFiscais)) to Ord(High(TRegrasFiscais)) do
    Self.Items.Add(GetEnumName(TypeInfo(TRegrasFiscais), i));

end;

{ THelperRegrasFiscais }

function THelperRegrasFiscais.This: iImposto;
begin
  case Self of
    SimplesNacional: Result := TSimplesNacional.New;
    LucroReal: Result := TLucroReal.New;
    LucroPresumido: Result := TLucroPresumido.New;
  end;
end;

end.
