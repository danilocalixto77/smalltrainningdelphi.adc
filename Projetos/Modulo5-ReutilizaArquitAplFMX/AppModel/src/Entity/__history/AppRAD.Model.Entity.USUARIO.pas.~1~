unit AppRAD.Model.Entity.USUARIO;

interface

{$M+}
{$TYPEINFO ON}

uses
  System.Generics.Collections, System.Classes, Rest.Json, System.JSON, SimpleAttributes;

type
  [Tabela('USUARIO')]
[Database('FB')]
[Generator('gen_usuario_id')]
  TUSUARIO = class
  private
    FID: integer;
    FNOME: string;
    FSENHA: string;
    FTIPO: integer;
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
    [Campo('SENHA')]
    property SENHA: string read FSENHA write FSENHA;
    [Campo('TIPO')]
    property TIPO: integer read FTIPO write FTIPO;
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

constructor TUSUARIO.Create;
begin

end;

destructor TUSUARIO.Destroy;
begin

  inherited;
end;

function TUSUARIO.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TUSUARIO.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
