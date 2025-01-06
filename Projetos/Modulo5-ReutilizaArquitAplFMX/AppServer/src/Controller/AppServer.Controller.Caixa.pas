unit AppServer.Controller.Caixa;

interface

uses
  System.JSON,
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  DataSet.Serialize,
  GBJSON.Helper,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.CAIXA,
  AppRAD.Model.DAO.Factory;

procedure Registry;

implementation

procedure Registry;
begin
  THorse
    .Use(Jhonson)
    .Use(CORS)
    .Get('/caixas',
      procedure (Req : THorseRequest; Res : THorseResponse; Next : TProc)
      var
        FModel : iDAOGeneric<TCAIXA>;
      begin
        FModel := TModelDAOFactory<TCAIXA>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find.DataSet.ToJSONArray);
      end
    )
    .Post('/caixas',
      procedure (Req : THorseRequest; Res : THorseResponse; Next : TProc)
      var
        FModel : iDAOGeneric<TCAIXA>;
      begin
        FModel := TModelDAOFactory<TCAIXA>.New.DAO;
        FModel.NewObject.fromJSONObject(Req.Body<TJSONObject>);
        FModel.Insert;
        Res.Status(200);
      end
    );
end;

end.
