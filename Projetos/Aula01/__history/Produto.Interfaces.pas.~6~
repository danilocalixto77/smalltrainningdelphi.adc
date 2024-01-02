unit Produto.Interfaces;

interface

uses
  Vcl.Forms;
  type

    TRegrasFiscais = (SimplesNacional, LucroReal);

    iProduto = interface
      ['{96184445-BAB1-4A41-8032-5045C7ACFED3}']
      function Bind (aValue : TForm) : iProduto;
      function Valor (aValue : Currency ) : iProduto; overload;
      function Valor (aValue : String) : iProduto; overload;
      function Regra (aValue : TRegrasFiscais ) : iProduto; overload;
      function Regra (aValue : Integer ) : iProduto; overload;
      function Total : Currency;
    end;

implementation

end.
