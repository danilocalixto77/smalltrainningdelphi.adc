unit AppRAD.View.Forms.Caixa.Abrir;

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
  Vcl.StdCtrls,
  Vcl.Mask,
  Data.DB,
  Vcl.DBCtrls,
  AppRAD.Controller.Interfaces;

type
  TFormAbrirCaixa = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController : iController;
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
  AppRAD.Controller,
  AppRAD.View.Forms.Factory;

{$R *.dfm}

procedure TFormAbrirCaixa.Button1Click(Sender: TObject);
begin
  {
    FController
      .CAIXA
        .AbrirCaixa
          .Valor('')
          .Fiscal('')
        .Execute;
  }
  with FController.CAIXA.DAO.NewObject do
  begin
     DATAABERTURA := Now;
     STATUS := 1;
     VALORABERTURA := StrToCurr(Edit1.Text);
     FISCAL_ABERTURA := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).ToString;
     OPERADOR := TViewFormsFactory.New.OperadorSelect(Self).SelecionarOperador.ToString;
  end;
  FController.CAIXA.DAO.Insert;
  Close;
end;

procedure TFormAbrirCaixa.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.USUARIO.DAO.Find;
  FController.USUARIO.ListComponent(ComboBox1.Items);
  ComboBox1.ItemIndex := 0;
end;

procedure TFormAbrirCaixa.SetGuuidCaixa(const Value: String);
begin
  FGuuidCaixa := Value;
end;

end.
