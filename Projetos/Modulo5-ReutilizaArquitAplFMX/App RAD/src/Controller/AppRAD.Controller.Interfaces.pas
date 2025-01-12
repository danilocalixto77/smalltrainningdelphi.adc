unit AppRAD.Controller.Interfaces;

interface

uses
  System.Classes,
  Vcl.Forms,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CAIXA,
  AppRAD.Model.Entity.VENDA,
  AppRAD.Model.Entity.USUARIO,
  AppRAD.Model.Entity.CLIENTE,
  AppRAD.Model.Entity.PRODUTO, AppRAD.Model.Entity.VENDAITENS;

type
  iControllerEntity<T : Class> = interface;
  iControllerCaixa = interface;
  iControllerUsuario = interface;
  iControllerCliente = interface;
  iControllerVenda = interface;
  iControllerProduto = interface;

  iController = interface
    ['{A6F88CB3-615E-4922-9CF9-CB6133C8E32D}']
    function CAIXA : iControllerCaixa;
    function VENDA : iControllerVenda;
    function USUARIO : iControllerUsuario;
    function CLIENTE : iControllerCliente;
    function PRODUTO : iControllerProduto;
    function VENDAITENS : iControllerEntity<TVENDAITENS>;
  end;

  iControllerEntity<T : Class> = interface
    ['{5B231B05-944D-47A7-BC57-2EFE81A6BCC4}']
    function DAO : iDAOGeneric<T>;
    function &End : iController;
  end;

  iControllerCaixa = interface
    ['{7A396A42-7975-4D54-8066-CAFC3F6FBEB6}']
    function AbrirCaixa(Owner : TForm) : iControllerCaixa;
    function CarregarVendas : iControllerCaixa;
    function DAO : iDAOGeneric<TCAIXA>;
    function &End : iController;
  end;

  iControllerUsuario = interface
    ['{56826D53-780C-45EE-8FB6-82B98D65A798}']
    function DAO : iDAOGeneric<TUSUARIO>;
    function ListComponent ( aComponent : TStrings ) : iControllerUsuario;
    function &End : iController;
  end;

  iControllerCliente = interface
    ['{6BACD02D-74A5-4AC2-B58B-1D68C58DE8FD}']
    function DAO : iDAOGeneric<TCLIENTE>;
    function ListComponent ( aComponent : TStrings ) : iControllerCliente;
    function &End : iController;
  end;

  iControllerVenda = interface
    ['{B01CEA9E-AFE7-4092-A9D4-05F5AA013F03}']
    function Abrir (Owner : TForm) : iControllerVenda;
    function DAO : iDAOGeneric<TVENDA>;
    function &End : iController;
  end;

  iControllerProduto = interface
    ['{D83E7C59-3F5F-425A-A200-3E11494CF180}']
    function DAO : iDAOGeneric<TPRODUTO>;
    function ListComponent ( aComponent : TStrings ) : iControllerProduto;
    function &End : iController;
  end;

implementation

end.
