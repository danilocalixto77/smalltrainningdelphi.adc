unit AppServer.Controller.VendaItens;

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
  AppRAD.Model.Entity.VENDAITENS,
  AppRAD.Model.DAO.Factory,
  DataSet.Serialize.Config,
  GBJSON.Helper;

procedure Registry;
begin
  THorse
    .Use(Jhonson)
    .Get('/vendaitens',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDAITENS>;
      begin
        TDataSetSerializeConfig.GetInstance.LowerCamelCase := False;
        FModel := TModelDAOFactory<TVENDAITENS>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find.DataSet.ToJSONArray);
      end
    )
    .Get('/vendaitens/venda/:id',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDAITENS>;
      begin
        FModel := TModelDAOFactory<TVENDAITENS>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find('VENDA', Req.Params.Items['id']).DataSet.ToJSONArray);
      end
    )
    .Post('/vendaitens',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDAITENS>;
      begin
        FModel := TModelDAOFactory<TVENDAITENS>.New.DAO;
        {Consulta se o Status da Venda Permite Inserir Item}
        FModel.NewObject.fromJSONObject(Req.Body<TJSONObject>);
        FModel.Insert;
        Res.Status(200);
      end
    ).Delete('/vendaitens/:id',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TVENDAITENS>;
      begin
        FModel := TModelDAOFactory<TVENDAITENS>.New.DAO;
        FModel.Delete('ID', Req.Params.Items['id']);
        Res.Status(200);
      end
    );
end;

end.
