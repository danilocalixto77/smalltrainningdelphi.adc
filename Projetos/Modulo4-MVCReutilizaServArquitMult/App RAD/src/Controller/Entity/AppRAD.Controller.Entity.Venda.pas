unit AppRAD.Controller.Entity.Venda;

interface

uses
  System.Classes,
  AppRAD.Controller.Interfaces,
  AppRAD.Model.DAO.Intefaces,
  AppRAD.Model.Entity.Venda, Vcl.Forms;

type
  TControllerEntityVenda = class(TInterfacedObject, iControllerVenda)
    private
      [weak]
      FParent : iController;
      FModel : iDAOGeneric<TVENDA>;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerVenda;
      function Abrir(Owner : TForm) : iControllerVenda;
      function DAO : iDAOGeneric<TVENDA>;
      function &End : iController;
  end;

implementation

uses
  AppRAD.Model.DAO.Factory, AppRAD.View.Forms.Factory, System.SysUtils;

{ TControllerEntityVenda }

function TControllerEntityVenda.&End: iController;
begin
  Result := FParent;
end;

function TControllerEntityVenda.Abrir(Owner : TForm): iControllerVenda;
begin
  with FModel.NewObject do
  begin
    CAIXA := IntToStr(FParent.CAIXA.DAO.Current.ID);
    CLIENTE := TViewFormsFactory.New.ClienteSelect(Owner).Selecionar.ToString;
    SERIE := 1;
    DATAABERTURA := Now;
    STATUS := 0;
  end;
  FModel.Insert;
  TViewFormsFactory.New.VendaVenderItem(Owner).ExibirVendaItens(FModel.LastID.ToString);
end;

constructor TControllerEntityVenda.Create(Parent : iController);
begin
  FParent := Parent;
  FModel := TModelDAOFactory<TVenda>.New.DAO;
end;

function TControllerEntityVenda.DAO: iDAOGeneric<TVenda>;
begin
  Result := FModel;
end;

destructor TControllerEntityVenda.Destroy;
begin

  inherited;
end;

class function TControllerEntityVenda.New(Parent : iController) : iControllerVenda;
begin
    Result := Self.Create(Parent);
end;

end.
