unit Produto.Interfaces;

interface
  type

    TRegrasFiscais = (SimplesNacional, LucroReal);

    iProduto = interface
      ['{96184445-BAB1-4A41-8032-5045C7ACFED3}']
      function Valor (aValue : Currency ) : iProduto;
      function Regra (aValue : TRegrasFiscais ) : iProduto;
      function Total : Currency;
    end;

implementation

end.
