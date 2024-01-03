unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Produto.Helpers;

type
  TFormPrincipal = class(TForm)
    ComboBox1: TComboBox;
    edtValor: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirResultado ( aValue : String);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  Produto, Produto.Interfaces;

{$R *.dfm}

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  TProduto
    .New
      .Bind(Self)
      .Valor(edtValor.Text)
      .Regra(ComboBox1.ItemIndex)
      .Display(ExibirResultado)
      .Total
end;

procedure TFormPrincipal.ExibirResultado(aValue: String);
begin
  ShowMessage(aValue);
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  ComboBox1.RegrasFiscais;
end;

end.



