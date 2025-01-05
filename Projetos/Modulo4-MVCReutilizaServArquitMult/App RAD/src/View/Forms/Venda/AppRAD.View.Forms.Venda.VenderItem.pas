unit AppRAD.View.Forms.Venda.VenderItem;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  AppRAD.Controller.Interfaces;

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
    FController : iController;
  public
    { Public declarations }
    procedure ExibirVendaItens ( aGuuidVenda : String );
    procedure CarregarItens;
  end;

var
  formVenderItens: TformVenderItens;

implementation

uses
  AppRAD.Controller;

{$R *.dfm}

procedure TformVenderItens.Button1Click(Sender: TObject);
begin
  with FController.VENDAITENS.DAO.NewObject do
  begin
    VENDA := FVenda;
    PRODUTO := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).ToString;
    QUANTIDADE := StrToCurr(Edit1.Text);
    DATACADASTRO := Now;
    STATUS := 0;
  end;
  FController.VENDAITENS.DAO.Insert;
  CarregarItens;
end;

procedure TformVenderItens.Button2Click(Sender: TObject);
begin
  FController.VENDAITENS.DAO.Delete('ID', FController.VENDAITENS.DAO.Current.ID.ToString);
  CarregarItens;
end;

procedure TformVenderItens.Button3Click(Sender: TObject);
begin
  with FController.VENDA.DAO.Find(FVenda).NewObject do
  begin
    ID := FController.VENDA.DAO.Current.ID;
    CAIXA := FController.VENDA.DAO.Current.CAIXA;
    NUMERO := FController.VENDA.DAO.Current.NUMERO;
    SERIE := FController.VENDA.DAO.Current.SERIE;
    DATAABERTURA := FController.VENDA.DAO.Current.DATAABERTURA;
    CLIENTE := FController.VENDA.DAO.Current.CLIENTE;
    DATAFECHAMENTO := Now;
    STATUS := 1;
  end;
  FController.VENDA.DAO.Update;
  Self.Close;
end;

procedure TformVenderItens.CarregarItens;
var
  FTotal : Currency;
begin
  FTotal := 0;
  FController.VENDAITENS.DAO.Find('venda', FVenda);
  while not DataSource1.DataSet.Eof do
  begin
    FTotal := FTotal + (FController.VENDAITENS.DAO.Current.QUANTIDADE * FController.VENDAITENS.DAO.Current.PRECO);
    DataSource1.DataSet.Next;
  end;

  Label4.Caption := FormatCurr('R$ #,##0.00', FTotal);
end;

procedure TformVenderItens.Edit1Change(Sender: TObject);
begin
  Label5.Caption :=
    FormatCurr(
      'R$ #,##0.00',
      (
        StrToCurr(Edit1.Text) *
        FController.PRODUTO.DAO.Find('ID',
          Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).ToString
        ).Current.PRECO
      )
    );
end;

procedure TformVenderItens.ExibirVendaItens(aGuuidVenda: String);
begin
  FVenda := aGuuidVenda;
  CarregarItens;
  Self.ShowModal;
end;

procedure TformVenderItens.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.VENDAITENS.DAO.DataSource(DataSource1);
  FController.PRODUTO.DAO.Find;
  FController.PRODUTO.ListComponent(ComboBox1.Items);
  ComboBox1.ItemIndex := 0;
end;

end.
