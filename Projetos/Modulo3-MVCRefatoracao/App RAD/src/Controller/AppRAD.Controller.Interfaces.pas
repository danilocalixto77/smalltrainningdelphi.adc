unit AppRAD.Controller.Interfaces;

interface

uses
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CAIXA;

type
  iControllerEntity<T : Class> = interface;

  iController = interface
    ['{A6F88CB3-615E-4922-9CF9-CB6133C8E32D}']
    function CAIXA : iControllerEntity<TCAIXA>;
  end;

  iControllerEntity<T : Class> = interface
    ['{5B231B05-944D-47A7-BC57-2EFE81A6BCC4}']
    function DAO : iDAOGeneric<T>;
    function &End : iController;
  end;

implementation

end.
