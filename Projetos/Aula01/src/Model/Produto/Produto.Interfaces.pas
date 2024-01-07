unit Produto.Interfaces;

interface

uses
  Vcl.Forms, System.SysUtils;
  type

    TRegrasFiscais = (SimplesNacional, LucroReal, LucroPresumido);

    iProduto = interface
      ['{96184445-BAB1-4A41-8032-5045C7ACFED3}']
      function Bind (aValue : TForm) : iProduto;
      function Valor (aValue : Currency ) : iProduto; overload;
      function Valor (aValue : String) : iProduto; overload;
      function Regra (aValue : TRegrasFiscais ) : iProduto; overload;
      function Regra (aValue : Integer ) : iProduto; overload;
      function Display ( aValue : TProc<String>) : iProduto;
      function Total : Currency;
    end;

    iImposto = Interface
      ['{06E04DD0-C0BB-4BCC-9A60-9572687B6A66}']
      function Calculo( aValue : Currency ) : Currency;
    End;

implementation

end.
