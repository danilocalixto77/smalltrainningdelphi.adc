unit AppRAD.Model.Entity.PRODUTO;

interface

{$M+}
{$TYPEINFO ON}

uses
  System.Generics.Collections, System.Classes, Rest.Json, System.JSON, SimpleAttributes;

type
  [Tabela('PRODUTO')]
[Database('FB')]
[Generator('gen_produto_id')]
  TPRODUTO = class
  private
    FID: integer;
    FCODIGO: string;
    FDESCRICAO: string;
    FPRECO: Currency;
    FNCM: integer;
    FALIQUOTA: Currency;
    FST: integer;
    FSTATUS: integer;
    FDATAALTERACAO: TDateTime;

  public
    constructor Create;
    destructor Destroy; override;

  published
    [Campo('ID'), PK, AutoInc]
    property ID: integer read FID write FID;
    [Campo('CODIGO')]
    property CODIGO: string read FCODIGO write FCODIGO;
    [Campo('DESCRICAO')]
    property DESCRICAO: string read FDESCRICAO write FDESCRICAO;
    [Campo('PRECO')]
    property PRECO: Currency read FPRECO write FPRECO;
    [Campo('NCM')]
    property NCM: integer read FNCM write FNCM;
    [Campo('ALIQUOTA')]
    property ALIQUOTA: Currency read FALIQUOTA write FALIQUOTA;
    [Campo('ST')]
    property ST: integer read FST write FST;
    [Campo('STATUS')]
    property STATUS: integer read FSTATUS write FSTATUS;
    [Campo('DATAALTERACAO')]
    property DATAALTERACAO: TDateTime read FDATAALTERACAO write FDATAALTERACAO;

    function ToJSONObject: TJsonObject;
    function ToJsonString: string;

  end;

implementation

constructor TPRODUTO.Create;
begin

end;

destructor TPRODUTO.Destroy;
begin

  inherited;
end;

function TPRODUTO.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TPRODUTO.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
