unit AppRAD.View.Forms.Cliente.Selecionar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  AppRAD.Controller.Interfaces;

type
  TSelecionarCliente = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
    function Selecionar : Integer;
  end;

var
  SelecionarCliente: TSelecionarCliente;

implementation

uses
  AppRAD.Controller;

{$R *.dfm}

procedure TSelecionarCliente.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TSelecionarCliente.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.CLIENTE.DAO.Find;
  FController.CLIENTE.ListComponent(ComboBox1.Items);
  ComboBox1.ItemIndex := 0;
end;

function TSelecionarCliente.Selecionar: Integer;
begin
  Self.ShowModal;
  Result := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
end;

end.
