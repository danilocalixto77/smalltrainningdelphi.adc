unit AppRAD.Model.Entity.VENDAITENS;

interface

{$M+}
{$TYPEINFO ON}

uses
  System.Generics.Collections,
  System.Classes,
  Rest.Json,
  System.JSON,
  SimpleAttributes,
  AppModel.RTTI.CustomAttributes;

type
  [Tabela('VENDAITENS')]
  [Database('FB')]
  [Generator('gen_vendaitens_id')]
  [BaseURL('/vendaitens')]
  TVENDAITENS = class
  private
    FID: integer;
    FVENDA: string;
    FPRODUTO: string;
    FQUANTIDADE: Currency;
    FPRECO: Currency;
    FDATACADASTRO: TDateTime;
    FSTATUS: integer;
    FDATAALTERACAO: TDateTime;

  public
    constructor Create;
    destructor Destroy; override;

  published
    [Campo('ID'), PK, AutoInc]
    property ID: integer read FID write FID;
    [Campo('VENDA')]
    property VENDA: string read FVENDA write FVENDA;
    [Campo('PRODUTO')]
    property PRODUTO: string read FPRODUTO write FPRODUTO;
    [Campo('QUANTIDADE')]
    property QUANTIDADE: Currency read FQUANTIDADE write FQUANTIDADE;
    [Campo('PRECO')]
    property PRECO: Currency read FPRECO write FPRECO;
    [Campo('DATACADASTRO')]
    property DATACADASTRO: TDateTime read FDATACADASTRO write FDATACADASTRO;
    [Campo('STATUS')]
    property STATUS: integer read FSTATUS write FSTATUS;
    [Campo('DATAALTERACAO')]
    property DATAALTERACAO: TDateTime read FDATAALTERACAO write FDATAALTERACAO;

    function ToJSONObject: TJsonObject;
    function ToJsonString: string;

  end;

implementation

constructor TVENDAITENS.Create;
begin

end;

destructor TVENDAITENS.Destroy;
begin

  inherited;
end;

function TVENDAITENS.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TVENDAITENS.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
