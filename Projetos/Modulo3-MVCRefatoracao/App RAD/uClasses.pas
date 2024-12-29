unit uClasses;

interface

type

TOperador = class
  private
    FGuuid: String;
    FNome: String;
    procedure SetGuuid(const Value: String);
    procedure SetNome(const Value: String);
  published
    property Nome : String read FNome write SetNome;
    property Guuid : String read FGuuid write SetGuuid;
  end;

TProduto = class
  private
    FPreco: Currency;
    FDescricao: String;
    FGuuid: String;
    procedure SetDescricao(const Value: String);
    procedure SetGuuid(const Value: String);
    procedure SetPreco(const Value: Currency);
  published
  property Guuid : String read FGuuid write SetGuuid;
  property Descricao : String read FDescricao write SetDescricao;
  property Preco : Currency read FPreco write SetPreco;
end;

implementation

{ TOperador }

procedure TOperador.SetGuuid(const Value: String);
begin
  FGuuid := Value;
end;

procedure TOperador.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TProduto }

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetGuuid(const Value: String);
begin
  FGuuid := Value;
end;

procedure TProduto.SetPreco(const Value: Currency);
begin
  FPreco := Value;
end;

end.
