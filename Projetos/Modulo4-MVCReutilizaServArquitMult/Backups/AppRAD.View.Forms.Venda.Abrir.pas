unit AppRAD.View.Forms.Venda.Abrir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udmDados;

type
  TformAbrirVenda = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCaixa : String;
    FGuuidVenda: String;
    procedure SetGuuidVenda(const Value: String);
  public
    { Public declarations }
    procedure AbrirVenda ( aGuuidCaixa : String );
    property GuuidVenda : String read FGuuidVenda write SetGuuidVenda;
  end;

var
  formAbrirVenda: TformAbrirVenda;

implementation

uses
  uClasses;

{$R *.dfm}

{ TForm2 }

procedure TformAbrirVenda.AbrirVenda(aGuuidCaixa: String);
begin
  FCaixa := aGuuidCaixa;
  Self.ShowModal;
end;

procedure TformAbrirVenda.Button1Click(Sender: TObject);
begin
  FGuuidVenda := TGUID.NewGuid.ToString;
  dmDados.QueryAux.Close;
  dmDados.QueryAux.SQL.Clear;
  dmDados.QueryAux.SQL.Add('INSERT INTO VENDA (CLIENTE, CAIXA, SERIE, DATAABERTURA, STATUS) VALUES (:CLIENTE, :CAIXA, :SERIE, :DATAABERTURA, :STATUS)');
  dmDados.QueryAux.ParamByName('CAIXA').Value := dmDados.QueryCaixa.FieldByName('ID').AsString;
  dmDados.QueryAux.ParamByName('CLIENTE').Value := TOperador(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Guuid;
  dmDados.QueryAux.ParamByName('SERIE').Value := 1;
  dmDados.QueryAux.ParamByName('DATAABERTURA').Value := Now;
  dmDados.QueryAux.ParamByName('STATUS').Value := 0;
  dmDados.QueryAux.ExecSQL;

  Self.Close;
end;

procedure TformAbrirVenda.FormCreate(Sender: TObject);
var
  Operador : TOperador;
begin
  dmDados.QueryClientes.Close;
  dmDados.QueryClientes.SQL.Clear;
  dmDados.QueryClientes.SQL.Add('SELECT * FROM CLIENTE');
  dmDados.QueryClientes.Open;

  ComboBox1.Items.Clear;

  while not dmDados.QueryClientes.Eof do
  begin
    Operador := TOperador.Create;
    Operador.Nome := dmDados.QueryClientes.FieldByName('NOME').AsString;
    Operador.Guuid := dmDados.QueryClientes.FieldByName('ID').AsString;

    ComboBox1.Items.AddObject(Operador.Nome, Operador);

    dmDados.QueryClientes.Next;
  end;

  ComboBox1.ItemIndex := 0;
end;

procedure TformAbrirVenda.SetGuuidVenda(const Value: String);
begin
  FGuuidVenda := Value;
end;

end.
