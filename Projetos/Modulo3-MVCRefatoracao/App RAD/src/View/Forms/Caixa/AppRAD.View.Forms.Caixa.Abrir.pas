unit AppRAD.View.Forms.Caixa.Abrir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, udmDados,
  Data.DB, Vcl.DBCtrls;

type
  TFormAbrirCaixa = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FGuuidCaixa: String;
    procedure SetGuuidCaixa(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property GuuidCaixa : String read FGuuidCaixa write SetGuuidCaixa;
  end;

var
  FormAbrirCaixa: TFormAbrirCaixa;

implementation

uses
  uClasses;

{$R *.dfm}

procedure TFormAbrirCaixa.Button1Click(Sender: TObject);
begin
  try
      dmDados.QueryCaixa.Close;
      dmDados.QueryCaixa.SQL.Clear;
      dmDados.QueryCaixa.SQL.Add('INSERT INTO caixa');
      dmDados.QueryCaixa.SQL.Add('(');
      dmDados.QueryCaixa.SQL.Add('dataabertura,');
      dmDados.QueryCaixa.SQL.Add('status,');
      dmDados.QueryCaixa.SQL.Add('valorabertura,');
      dmDados.QueryCaixa.SQL.Add('fiscal_abertura)');
      dmDados.QueryCaixa.SQL.Add('VALUES      ( ');
      dmDados.QueryCaixa.SQL.Add(':DATAABERTURA,');
      dmDados.QueryCaixa.SQL.Add(':STATUS,');
      dmDados.QueryCaixa.SQL.Add(':VALORABERTURA,');
      dmDados.QueryCaixa.SQL.Add(':FISCAL_ABERTURA)');

      dmDados.QueryCaixa.ParamByName('DATAABERTURA').Value := Now;
      dmDados.QueryCaixa.ParamByName('STATUS').Value := 1;
      dmDados.QueryCaixa.ParamByName('VALORABERTURA').Value := StrToCurr(Edit1.Text);
      dmDados.QueryCaixa.ParamByName('FISCAL_ABERTURA').Value := TOperador(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Guuid;

      dmDados.QueryCaixa.ExecSQL;

  finally
    Self.Close;
    dmDados.QueryCaixa.Open('SELECT gen_id(gen_caixa_id,0) as ID from RDB$DATABASE');
    FGuuidCaixa := dmDados.QueryCaixa.FieldByName('ID').AsString;
   end;
end;

procedure TFormAbrirCaixa.ComboBox1Change(Sender: TObject);
begin
  ShowMessage(
    TOperador(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Guuid
  )
end;

procedure TFormAbrirCaixa.FormCreate(Sender: TObject);
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

procedure TFormAbrirCaixa.SetGuuidCaixa(const Value: String);
begin
  FGuuidCaixa := Value;
end;

end.
