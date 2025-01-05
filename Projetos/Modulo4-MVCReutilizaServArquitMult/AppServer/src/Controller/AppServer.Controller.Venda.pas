unit AppServer.Controller.Venda;

interface

uses
  System.JSON,
  Horse,
  Horse.Jhonson,
  DataSet.Serialize,
  GBJSON.Helper,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.VENDA,
  AppRAD.Model.DAO.Factory;

procedure Registry;

implementation

procedure Registry;
begin
  THorse
    .Use(Jhonson)
    .Get('/vendas',
      procedure (Req : THorseRequest; Res : THorseResponse; Next : TProc)
      var
        FModel : iDAOGeneric<TVENDA>;
      begin
        FModel := TModelDAOFactory<TVENDA>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find.DataSet.ToJSONArray);
      end
    ).Get('/vendas/:id',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDA>;
      begin
        FModel := TModelDAOFactory<TVENDA>.New.DAO;
        Res.Send<TJsonObject>(FModel.Find(Req.Params.Items['id']).DataSet.ToJSONObject);
      end
    ).Get('/vendas/caixa/:id',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDA>;
      begin
        FModel := TModelDAOFactory<TVENDA>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find('CAIXA', Req.Params.Items['id']).DataSet.ToJSONArray);
      end
    ).Get('/vendas/lastid',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDA>;
      begin
        FModel := TModelDAOFactory<TVENDA>.New.DAO;
        FModel.LastID;
        Res.Send<TJsonObject>(FModel.DataSet.ToJSONObject);
      end
    ).Post('/vendas',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDA>;
      begin
        FModel := TModelDAOFactory<TVENDA>.New.DAO;
        FModel.NewObject.fromJSONObject(Req.Body<TJSONObject>);
        FModel.Insert;
        Res.Status(200);
      end
    ).Put('/vendas',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDA>;
      begin
        FModel := TModelDAOFactory<TVENDA>.New.DAO;
        FModel.NewObject.fromJSONObject(Req.Body<TJSONObject>);
        FModel.Update;
        Res.Status(200);
      end
    );
end;

end.

