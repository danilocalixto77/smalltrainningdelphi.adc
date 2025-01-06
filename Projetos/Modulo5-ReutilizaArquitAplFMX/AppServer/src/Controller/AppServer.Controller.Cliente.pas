unit AppServer.Controller.Cliente;

interface

uses
  Horse,
  Horse.Jhonson,
  System.JSON;

procedure Registry;

implementation

uses
  DataSet.Serialize,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CLIENTE,
  AppRAD.Model.DAO.Factory,
  DataSet.Serialize.Config;

procedure Registry;
begin
  THorse
    .Use(Jhonson)
    .Get('/clientes',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TCLIENTE>;
      begin
        FModel := TModelDAOFactory<TCLIENTE>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find.DataSet.ToJSONArray);
      end
    );
end;

end.
