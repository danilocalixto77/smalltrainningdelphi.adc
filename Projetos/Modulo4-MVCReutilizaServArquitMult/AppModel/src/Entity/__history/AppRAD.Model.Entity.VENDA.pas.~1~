unit AppRAD.Model.Entity.VENDA;

interface

{$M+}
{$TYPEINFO ON}

uses
  System.Generics.Collections, System.Classes, Rest.Json, System.JSON, SimpleAttributes;

type
  [Tabela('VENDA')]
[Database('FB')]
[Generator('gen_venda_id')]
  TVENDA = class
  private
    FID: integer;
    FCAIXA: string;
    FNUMERO: integer;
    FSERIE: integer;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: TDateTime;
    FCLIENTE: string;
    FSTATUS: integer;

  public
    constructor Create;
    destructor Destroy; override;

  published
    [Campo('ID'), PK, AutoInc]
    property ID: integer read FID write FID;
    [Campo('CAIXA')]
    property CAIXA: string read FCAIXA write FCAIXA;
    [Campo('NUMERO')]
    property NUMERO: integer read FNUMERO write FNUMERO;
    [Campo('SERIE')]
    property SERIE: integer read FSERIE write FSERIE;
    [Campo('DATAABERTURA')]
    property DATAABERTURA: TDateTime read FDATAABERTURA write FDATAABERTURA;
    [Campo('DATAFECHAMENTO')]
    property DATAFECHAMENTO: TDateTime read FDATAFECHAMENTO write FDATAFECHAMENTO;
    [Campo('CLIENTE')]
    property CLIENTE: string read FCLIENTE write FCLIENTE;
    [Campo('STATUS')]
    property STATUS: integer read FSTATUS write FSTATUS;

    function ToJSONObject: TJsonObject;
    function ToJsonString: string;

  end;

implementation

constructor TVENDA.Create;
begin

end;

destructor TVENDA.Destroy;
begin

  inherited;
end;

function TVENDA.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TVENDA.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
