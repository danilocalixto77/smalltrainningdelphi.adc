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
    procedure Button1Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

{$R *.dfm}


implementation

uses
  AppRAD.Controller,
  AppRAD.View.Forms.Factory;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FController.CAIXA.DAO.Find;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FController.CAIXA.AbrirCaixa(Self);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  FController.VENDA.Abrir(Self);
  //formAbrirVenda.AbrirVenda(dmDados.QueryCaixa.FieldByName('ID').AsString);
  //formVenderItens := TformVenderItens.Create(Self);
  //formVenderItens.ExibirVendaItens(formAbrirVenda.GuuidVenda);
end;

procedure TForm1.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  FController.CAIXA.CarregarVendas;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.CAIXA.DAO.DataSource(DataSource2);
  FController.VENDA.DAO.DataSource(DataSource1);
end;

end.
