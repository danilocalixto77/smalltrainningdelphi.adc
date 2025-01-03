unit AppRAD.View.Forms.Venda.VenderItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, udmDados;

type
  TformVenderItens = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    DataSource1: TDataSource;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FVenda : String;
  public
    { Public declarations }
    procedure ExibirVendaItens ( aGuuidVenda : String );
    procedure CarregarItens;
  end;

var
  formVenderItens: TformVenderItens;

implementation

uses
  uClasses;

{$R *.dfm}

procedure TformVenderItens.Button1Click(Sender: TObject);
begin
  dmDados.QueryAux.Close;
  dmDados.QueryAux.SQL.Clear;
  dmDados.QueryAux.SQL.Add('INSERT INTO VENDAITENS (VENDA, PRODUTO, QUANTIDADE, PRECO, DATACADASTRO, STATUS, DATAALTERACAO) VALUES (:VENDA, :PRODUTO, :QUANTIDADE, :PRECO, :DATACADASTRO, :STATUS, :DATAALTERACAO)');
  dmDados.QueryAux.ParamByName('VENDA').Value := FVenda;
  dmDados.QueryAux.ParamByName('PRODUTO').Value := TProduto(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Guuid;
  dmDados.QueryAux.ParamByName('QUANTIDADE').Value := StrToCurr(Edit1.Text);
  dmDados.QueryAux.ParamByName('PRECO').Value := TProduto(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Preco;
  dmDados.QueryAux.ParamByName('DATACADASTRO').Value := Now;
  dmDados.QueryAux.ParamByName('STATUS').Value := 0;
  dmDados.QueryAux.ParamByName('DATAALTERACAO').Value := Now;
  dmDados.QueryAux.ExecSQL;

  CarregarItens;
end;

procedure TformVenderItens.Button2Click(Sender: TObject);
begin
  dmDados.QueryAux.Close;
  dmDados.QueryAux.SQL.Clear;
  dmDados.QueryAux.SQL.Add('DELETE FROM VENDAITENS WHERE ID = :ID');
  dmDados.QueryAux.ParamByName('ID').Value := dmDados.QueryVendaItens.FieldByName('ID').AsString;
  dmDados.QueryAux.ExecSQL;
  CarregarItens;
end;

procedure TformVenderItens.Button3Click(Sender: TObject);
begin
  dmDados.QueryAux.Close;
  dmDados.QueryAux.SQL.Clear;
  dmDados.QueryAux.SQL.Add('UPDATE VENDA SET DATAFECHAMENTO = :DATAFECHAMENTO, STATUS = :STATUS WHERE ID = :ID');
  dmDados.QueryAux.ParamByName('ID').Value := dmDados.QueryVendas.FieldByName('ID').AsString;
  dmDados.QueryAux.ParamByName('DATAFECHAMENTO').Value := Now;
  dmDados.QueryAux.ParamByName('STATUS').Value := 1;
  dmDados.QueryAux.ExecSQL;
  Self.Close;
end;

procedure TformVenderItens.CarregarItens;
var
  FTotal : Currency;
begin
  FTotal := 0;
  dmDados.QueryVendaItens.Close;
  dmDados.QueryVendaItens.SQL.Clear;
  dmDados.QueryVendaItens.SQL.Add('SELECT * FROM VENDAITENS WHERE VENDA = :VENDA');
  dmDados.QueryVendaItens.ParamByName('VENDA').Value := FVenda;
  dmDados.QueryVendaItens.Open;


  while not dmDados.QueryVendaItens.Eof do
  begin
    FTotal := FTotal + (dmDados.QueryVendaItens.FieldByName('QUANTIDADE').AsCurrency * dmDados.QueryVendaItens.FieldByName('PRECO').AsCurrency);
    dmDados.QueryVendaItens.Next;
  end;

  Label4.Caption := FormatCurr('R$ #,##0.00', FTotal);
end;

procedure TformVenderItens.Edit1Change(Sender: TObject);
begin
  Label5.Caption := FormatCurr('R$ #,##0.00', (StrToCurr(Edit1.Text) * TProduto(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).Preco));
end;

procedure TformVenderItens.ExibirVendaItens(aGuuidVenda: String);
begin
  FVenda := aGuuidVenda;
  CarregarItens;
  Self.ShowModal;
end;

procedure TformVenderItens.FormCreate(Sender: TObject);
var
  Produto : TProduto;
begin
  dmDados.QueryProdutos.Close;
  dmDados.QueryProdutos.SQL.Clear;
  dmDados.QueryProdutos.SQL.Add('SELECT * FROM PRODUTO');
  dmDados.QueryProdutos.Open;

  ComboBox1.Items.Clear;

  while not dmDados.QueryProdutos.Eof do
  begin
    Produto := TProduto.Create;
    Produto.Descricao := dmDados.QueryProdutos.FieldByName('DESCRICAO').AsString;
    Produto.Guuid := dmDados.QueryProdutos.FieldByName('ID').AsString;
    Produto.Preco := dmDados.QueryProdutos.FieldByName('PRECO').AsCurrency;

    ComboBox1.Items.AddObject(Produto.Descricao, Produto);

    dmDados.QueryProdutos.Next;
  end;

  ComboBox1.ItemIndex := 0;

end;

end.
