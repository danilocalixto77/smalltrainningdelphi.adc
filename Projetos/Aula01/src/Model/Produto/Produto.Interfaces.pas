unit Produto.Interfaces;

interface

uses
  Vcl.Forms, System.SysUtils;

type

  TRegrasFiscais = (SimplesNacional, LucroReal, LucroPresumido);


  iProduto = interface
    ['{779EDEAA-F91B-4119-9894-96AC99A175AF}']
    function Bind ( aValue : TForm ) : iProduto;
    function Valor ( aValue : Currency ) : iProduto; overload;
    function Valor ( aValue : String ) : iProduto; overload;
    function Regra ( aValue : TRegrasFiscais ) : iProduto; overload;
    function Regra ( aValue : Integer ) : iProduto; overload;
    function Display ( aValue : TProc<String> ) : iProduto;
    function Total : Currency;
  end;

  iImposto = interface
    ['{3F9A5129-61F6-418C-94A8-9D34D265AA79}']
    function Calculo ( aValue : Currency ) : Currency;
  end;

implementation

end.
