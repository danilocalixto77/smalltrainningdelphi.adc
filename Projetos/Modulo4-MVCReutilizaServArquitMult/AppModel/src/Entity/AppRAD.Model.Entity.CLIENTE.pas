unit AppRAD.Model.Entity.CLIENTE;

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
  [Tabela('CLIENTE')]
  [Database('FB')]
  [Generator('gen_cliente_id')]
  [BaseURL('/clientes')]
  TCLIENTE = class
  private
    FID: integer;
    FNOME: string;
    FCPF: string;
    FLIMITE: Currency;
    FSTATUS: integer;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: TDateTime;

  public
    constructor Create;
    destructor Destroy; override;

  published
    [Campo('ID'), PK, AutoInc]
    property ID: integer read FID write FID;
    [Campo('NOME')]
    property NOME: string read FNOME write FNOME;
    [Campo('CPF')]
    property CPF: string read FCPF write FCPF;
    [Campo('LIMITE')]
    property LIMITE: Currency read FLIMITE write FLIMITE;
    [Campo('STATUS')]
    property STATUS: integer read FSTATUS write FSTATUS;
    [Campo('DATACADASTRO')]
    property DATACADASTRO: TDateTime read FDATACADASTRO write FDATACADASTRO;
    [Campo('DATAALTERACAO')]
    property DATAALTERACAO: TDateTime read FDATAALTERACAO write FDATAALTERACAO;

    function ToJSONObject: TJsonObject;
    function ToJsonString: string;

  end;

implementation

constructor TCLIENTE.Create;
begin

end;

destructor TCLIENTE.Destroy;
begin

  inherited;
end;

function TCLIENTE.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TCLIENTE.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
