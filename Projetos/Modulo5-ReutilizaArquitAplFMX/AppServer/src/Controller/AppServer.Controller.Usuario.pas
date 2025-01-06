unit AppServer.Controller.Usuario;

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
  AppRAD.Model.Entity.USUARIO,
  AppRAD.Model.DAO.Factory,
  DataSet.Serialize.Config;

procedure Registry;
begin
  THorse
    .Use(Jhonson)
    .Get('/usuarios',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TUSUARIO>;
      begin
        FModel := TModelDAOFactory<TUSUARIO>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find.DataSet.ToJSONArray);
      end
    );
end;

end.
