unit Unit1;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ComboBox1.Text = 'SimplesNacional' then
  begin
    ShowMessage(
      CurrToStr(
      StrToCurr(Edit1.Text) + StrToCurr(Edit1.Text)  * 0.1
      )
    );
  end;

  if ComboBox1.Text = 'LucroReal' then
  begin
    ShowMessage(
      CurrToStr(
      StrToCurr(Edit1.Text) + StrToCurr(Edit1.Text)  * 0.4
      )
    );

  end;

end;

end.



