unit AppRAD.View.Forms.Caixa.Operador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udmDados, Data.DB;

type
  TformOperador = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FCaixa : String;
  public
    { Public declarations }
    procedure SelecionarOperador( aGuuidCaixa : String );
  end;

var
  formOperador: TformOperador;

implementation

uses
  uClasses;

{$R *.dfm}

procedure TformOperador.Button1Click(Sender: TObject);
begin
  dmDados.QueryAux.Close;
  dmDados.QueryAux.SQL.Clear;
  dmDados.QueryAux.SQL.Add('UPDATE CAIXA SET OPERADOR = :OPERADOR, DATAALTERACAO = :DATAALTERACAO WHERE ID = :ID');
  dmDados.QueryAux.ParamByName('OPERADOR').Value := TOperador(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Guuid;
  dmDados.QueryAux.ParamByName('ID').Value := FCaixa;
  dmDados.QueryAux.ParamByName('DATAALTERACAO').Value := Now;
  dmDados.QueryAux.ExecSQL;

  Self.Close;
end;

procedure TformOperador.FormCreate(Sender: TObject);
var
  Operador : TOperador;
begin
  dmDados.QueryUsuarios.Close;
  dmDados.QueryUsuarios.SQL.Clear;
  dmDados.QueryUsuarios.SQL.Add('SELECT * FROM USUARIO');
  dmDados.QueryUsuarios.Open;

  ComboBox1.Items.Clear;

  while not dmDados.QueryUsuarios.Eof do
  begin
    Operador := TOperador.Create;
    Operador.Nome := dmDados.QueryUsuarios.FieldByName('NOME').AsString;
    Operador.Guuid := dmDados.QueryUsuarios.FieldByName('ID').AsString;

    ComboBox1.Items.AddObject(Operador.Nome, Operador);

    dmDados.QueryUsuarios.Next;
  end;

  ComboBox1.ItemIndex := 0;

end;

procedure TformOperador.SelecionarOperador(aGuuidCaixa: String);
begin
  FCaixa := aGuuidCaixa;
  Self.ShowModal;
end;

end.
