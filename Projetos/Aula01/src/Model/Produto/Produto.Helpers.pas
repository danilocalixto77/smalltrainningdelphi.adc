unit Produto.Helpers;

interface

uses
  Vcl.StdCtrls,
  SysUtils,
  Produto.Interfaces,
  TypInfo, Imposto.LucroReal, Imposto.SimplesNacional, Imposto.LucroPresumido;

type
  THelperEnumToCombo = class Helper for TComboBox
    procedure RegrasFiscais;
  end;


  THelperRegrasFisicais = record Helper for TRegrasFiscais
    function This : iImposto;
  end;

implementation

{ THelperEnumToCombo }

procedure THelperEnumToCombo.RegrasFiscais;
var
  I: Integer;
begin
  Self.Items.Clear;
  for I := Ord(Low(TRegrasFiscais)) to Ord(High(TRegrasFiscais)) do
    Self.Items.Add(GetEnumName(TypeInfo(TRegrasFiscais), I));
end;

{ THelperRegrasFisicais }

function THelperRegrasFisicais.This: iImposto;
begin
  case Self of
    SimplesNacional: Result := TSimpleNacional.New;
    LucroReal: Result := TLucroReal.New;
    LucroPresumido : Result := TLucroPresumido.New;
  end;
end;

end.
