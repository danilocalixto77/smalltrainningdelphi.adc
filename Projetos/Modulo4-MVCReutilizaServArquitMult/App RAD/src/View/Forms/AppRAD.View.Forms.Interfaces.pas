unit AppRAD.View.Forms.Interfaces;

interface

uses
  Vcl.Forms,
  AppRAD.View.Forms.Caixa.Abrir,
  AppRAD.View.Forms.Caixa.Operador,
  AppRAD.View.Forms.Venda.VenderItem,
  AppRAD.View.Forms.Cliente.Selecionar;

type
  iViewFactory = interface
    ['{10C37F52-EE19-4567-84ED-BBFB3B79019A}']
    function CaixaAbrir(Owner : TForm) : TFormAbrirCaixa;
    function OperadorSelect(Owner : TForm) : TformOperador;
    function VendaVenderItem ( Owner : TForm ) : TformVenderItens;
    function ClienteSelect (Owner : TForm) : TSelecionarCliente;
  end;

implementation

end.
