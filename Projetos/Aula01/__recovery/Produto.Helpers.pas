unit Produto.Helpers;

interface

uses
  Vcl.StdCtrls,
  SysUtils,
  Produto.Interfaces;

type
  THelperEnumToCombo = class Helper for TComboBox

  procedure RegrasFiscais;
  end;

implementation

{THelperEnumToCombo}

{ THelperEnumToCombo }

procedure THelperEnumToCombo.RegrasFiscais;
var
  i: Integer;
begin
  Self.Items.Clear;
  for i := Ord(Low(TRegrasFiscais)) to Ord(High(TRegrasFiscais)) do
    Self.Items.Add(GetEnumName(TypeInfo(TRegrasFiscais))

end;

end.
