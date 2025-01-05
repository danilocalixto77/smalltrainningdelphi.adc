unit AppServer.Controller.Produto;

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
  AppRAD.Model.Entity.PRODUTO,
  AppRAD.Model.DAO.Factory,
  DataSet.Serialize.Config;

procedure Registry;
begin
  THorse
    .Use(Jhonson)
    .Get('/produtos',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TPRODUTO>;
      begin
        TDataSetSerializeConfig.GetInstance.LowerCamelCase := False;
        FModel := TModelDAOFactory<TPRODUTO>.New.DAO;
        Res.Send<TJsonArray>(FModel.Find.DataSet.ToJSONArray);
      end
    )
    .Get('/produtos/:id',
      procedure (Req : THorseRequest; Res : THorseResponse; ANext : TProc)
      var
        FModel : iDAOGeneric<TPRODUTO>;
      begin
        FModel := TModelDAOFactory<TPRODUTO>.New.DAO;
        Res.Send<TJsonObject>(FModel.Find(Req.Params.Items['id']).DataSet.ToJSONObject);
      end
    );
end;

end.
