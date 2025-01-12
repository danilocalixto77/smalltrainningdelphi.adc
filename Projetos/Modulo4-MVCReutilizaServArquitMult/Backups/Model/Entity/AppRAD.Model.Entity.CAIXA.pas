unit AppRAD.Model.Entity.CAIXA;

interface

{$M+}
{$TYPEINFO ON}

uses
  System.Generics.Collections,
  System.Classes,
  Rest.Json,
  System.JSON,
  SimpleAttributes;

type
  [Tabela('CAIXA')]
  [Database('FB')]
  [Generator('gen_caixa_id')]
  //[BaseURL('/caixa')]
  TCAIXA = class
  private
    FID: integer;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: TDateTime;
    FSTATUS: integer;
    FVALORABERTURA: Currency;
    FVALORFECHAMENTO: Currency;
    FFISCAL_ABERTURA: string;
    FFISCAL_FECHAMENTO: string;
    FOPERADOR: string;
    FDATAALTERACAO: TDateTime;
  public
    constructor Create;
    destructor Destroy; override;

  published
    [Campo('ID'), PK, AutoInc]
    property ID: integer read FID write FID;
    [Campo('DATAABERTURA')]
    property DATAABERTURA: TDateTime read FDATAABERTURA write FDATAABERTURA;
    [Campo('DATAFECHAMENTO')]
    property DATAFECHAMENTO: TDateTime read FDATAFECHAMENTO write FDATAFECHAMENTO;
    [Campo('STATUS')]
    property STATUS: integer read FSTATUS write FSTATUS;
    [Campo('VALORABERTURA')]
    property VALORABERTURA: Currency read FVALORABERTURA write FVALORABERTURA;
    [Campo('VALORFECHAMENTO')]
    property VALORFECHAMENTO: Currency read FVALORFECHAMENTO write FVALORFECHAMENTO;
    [Campo('FISCAL_ABERTURA')]
    property FISCAL_ABERTURA: string read FFISCAL_ABERTURA write FFISCAL_ABERTURA;
    [Campo('FISCAL_FECHAMENTO')]
    property FISCAL_FECHAMENTO: string read FFISCAL_FECHAMENTO write FFISCAL_FECHAMENTO;
    [Campo('OPERADOR')]
    property OPERADOR: string read FOPERADOR write FOPERADOR;
    [Campo('DATAALTERACAO')]
    property DATAALTERACAO: TDateTime read FDATAALTERACAO write FDATAALTERACAO;

    function ToJSONObject: TJsonObject;
    function ToJsonString: string;

  end;

implementation

constructor TCAIXA.Create;
begin

end;

destructor TCAIXA.Destroy;
begin

  inherited;
end;

function TCAIXA.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TCAIXA.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
