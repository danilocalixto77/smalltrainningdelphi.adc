unit AppRAD.View.Forms.Principal;

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
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  AppRAD.View.Forms.Caixa.Abrir,
  AppRAD.View.Forms.Venda.Abrir,
  AppRAD.View.Forms.Caixa.Operador,
  AppRAD.View.Forms.Venda.VenderItem,
  Vcl.Mask,
  Vcl.DBCtrls,
  AppRAD.Controller.Interfaces;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    Button2: TButton;
    Button4: TButton;
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private

    FController : iController;

    procedure CarregarVendasCaixa;
    procedure ListarCaixas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

{$R *.dfm}


implementation

uses
  AppRAD.Controller;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ListarCaixas;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FormAbrirCaixa.ShowModal;
  formOperador.SelecionarOperador(FormAbrirCaixa.GuuidCaixa);
  ListarCaixas;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FController.CAIXA.DAO.Find;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //formAbrirVenda.AbrirVenda(dmDados.QueryCaixa.FieldByName('ID').AsString);
  CarregarVendasCaixa;
  formVenderItens := TformVenderItens.Create(Self);
  formVenderItens.ExibirVendaItens(formAbrirVenda.GuuidVenda);
  CarregarVendasCaixa;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

  with FController.CAIXA.DAO.NewObject do
  begin
    DATAABERTURA := Now;
    DATAFECHAMENTO := Now;
    STATUS := 1;
    VALORABERTURA := 100;
  end;

  FController.CAIXA.DAO.Insert;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ShowMessage(
    DataSource3.DataSet.FieldByName('ID').AsString
  )
end;

procedure TForm1.CarregarVendasCaixa;
begin
//  dmDados.QueryVendas.Close;
//  dmDados.QueryVendas.SQL.Clear;
//  dmDados.QueryVendas.SQL.Add('SELECT * FROM VENDA WHERE CAIXA = :CAIXA');
//  dmDados.QueryVendas.ParamByName('CAIXA').Value := dmDados.QueryCaixa.FieldByName('ID').AsString;
//  dmDados.QueryVendas.Open;
end;

procedure TForm1.ListarCaixas;
begin
//  dmDados.QueryCaixa.Close;
//  dmDados.QueryCaixa.SQL.Clear;
//  dmDados.QueryCaixa.SQL.Add('SELECT * FROM CAIXA ORDER BY DATAABERTURA');
//  dmDados.QueryCaixa.Open;
end;

procedure TForm1.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  CarregarVendasCaixa;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.CAIXA.DAO.DataSource(DataSource3);
end;

end.
