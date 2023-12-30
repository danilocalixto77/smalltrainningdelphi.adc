unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Produto, Produto.Interfaces;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

  ShowMessage(
    CurrToStr(
      TProduto
        .New
          .Valor(StrToCurr(Edit1.Text))
          .Regra(TRegrasFiscais(ComboBox1.ItemIndex))
          .Total
    )
  )

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.



