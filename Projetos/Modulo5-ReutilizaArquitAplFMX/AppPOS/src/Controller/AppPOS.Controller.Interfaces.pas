unit AppPOS.Controller.Interfaces;

interface

uses
  FMX.Forms,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CAIXA, FMX.Types;

type
  iControllerCaixa = interface;

  iController = interface
    ['{1245E198-2DFD-4084-98C3-DF6C6C94491F}']
    function CAIXA : iControllerCaixa;
  end;

  iControllerCaixa = interface
    ['{2522FE89-1FAE-446F-9D7B-96A459E9258B}']
    function ListarCaixas (Owner : TFMXObject) : iControllerCaixa;
    function AbrirCaixa(Owner : TForm) : iControllerCaixa;
    function CarregarVendas : iControllerCaixa;
    function DAO : iDAOGeneric<TCAIXA>;
    function &End : iController;
  end;


implementation

end.
