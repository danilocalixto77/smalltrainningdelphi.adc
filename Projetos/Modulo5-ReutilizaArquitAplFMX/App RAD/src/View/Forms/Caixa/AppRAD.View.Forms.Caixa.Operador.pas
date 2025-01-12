unit AppRAD.View.Forms.Caixa.Operador;

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
  AppRAD.Controller.Interfaces;

type
  TformOperador = class(TForm)
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
    function SelecionarOperador : Integer;
  end;

var
  formOperador: TformOperador;

implementation

uses
  AppRAD.Controller;

{$R *.dfm}

procedure TformOperador.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TformOperador.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.USUARIO.DAO.Find;
  FController.USUARIO.ListComponent(ComboBox1.Items);
  ComboBox1.ItemIndex := 0;
end;

function TformOperador.SelecionarOperador : Integer;
begin
  Self.ShowModal;
  Result := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
end;

end.
