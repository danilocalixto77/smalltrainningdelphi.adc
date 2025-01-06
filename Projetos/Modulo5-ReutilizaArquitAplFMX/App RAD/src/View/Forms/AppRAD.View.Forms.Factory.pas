unit AppRAD.View.Forms.Factory;

interface

uses
  AppRAD.View.Forms.Interfaces,
  Vcl.Forms,
  AppRAD.View.Forms.Caixa.Abrir,
  AppRAD.View.Forms.Caixa.Operador,
  AppRAD.View.Forms.Venda.VenderItem,
  AppRAD.View.Forms.Cliente.Selecionar;

type
  TViewFormsFactory = class(TInterfacedObject, iViewFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iViewFactory;
      function CaixaAbrir(Owner : TForm) : TFormAbrirCaixa;
      function OperadorSelect(Owner : TForm) : TformOperador;
      function VendaVenderItem ( Owner : TForm ) : TformVenderItens;
      function ClienteSelect (Owner : TForm) : TSelecionarCliente;
  end;

implementation

{ TViewFormsFactory }

function TViewFormsFactory.CaixaAbrir(Owner: TForm): TFormAbrirCaixa;
begin
  FormAbrirCaixa := TFormAbrirCaixa.Create(Owner);
  Result := FormAbrirCaixa;
end;

function TViewFormsFactory.ClienteSelect(Owner: TForm): TSelecionarCliente;
begin
  SelecionarCliente := TSelecionarCliente.Create(Owner);
  Result := SelecionarCliente;
end;

constructor TViewFormsFactory.Create;
begin

end;

destructor TViewFormsFactory.Destroy;
begin

  inherited;
end;

class function TViewFormsFactory.New: iViewFactory;
begin
    Result := Self.Create;
end;

function TViewFormsFactory.OperadorSelect(Owner: TForm): TformOperador;
begin
  formOperador := TformOperador.Create(Owner);
  Result := formOperador;
end;

function TViewFormsFactory.VendaVenderItem(Owner: TForm): TformVenderItens;
begin
  formVenderItens := TformVenderItens.Create(Owner);
  Result := formVenderItens;
end;

end.
