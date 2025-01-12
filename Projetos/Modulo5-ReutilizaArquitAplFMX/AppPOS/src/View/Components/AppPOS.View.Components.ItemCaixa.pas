unit AppPOS.View.Components.ItemCaixa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TComponentItemCaixa = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    lblID: TLabel;
    Layout3: TLayout;
    lblDataDesc: TLabel;
    lblAbertura: TLabel;
    lblFechamento: TLabel;
    Label3: TLabel;
    Layout4: TLayout;
    Label1: TLabel;
    lblValorAbertura: TLabel;
    lblValorFechamento: TLabel;
    Label5: TLabel;
    Line1: TLine;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Component : TFMXObject;
    function Id ( aValue : String ) : TComponentItemCaixa;
    function DataAbertura ( aValue : String ) : TComponentItemCaixa;
    function DataFechamento ( aValue : String ) : TComponentItemCaixa;
    function ValorAbertura ( aValue : Currency ) : TComponentItemCaixa;
    function ValorFechamento ( aValue : Currency ) : TComponentItemCaixa;
  end;

var
  ComponentItemCaixa: TComponentItemCaixa;

implementation

{$R *.fmx}

{ TComponentItemCaixa }

function TComponentItemCaixa.Component: TFMXObject;
begin
  Result := Layout1;
  Layout1.Align := TAlignLayout.Top;
end;

function TComponentItemCaixa.DataAbertura(aValue: String): TComponentItemCaixa;
begin
  Result := Self;
  lblAbertura.Text := aValue;
end;

function TComponentItemCaixa.DataFechamento(
  aValue: String): TComponentItemCaixa;
begin
  Result := Self;
  lblFechamento.Text := aValue;
end;

function TComponentItemCaixa.Id(aValue: String): TComponentItemCaixa;
begin
  Result := Self;
  lblID.Text := aValue;
end;

procedure TComponentItemCaixa.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage(lblID.Text);
end;

function TComponentItemCaixa.ValorAbertura(
  aValue: Currency): TComponentItemCaixa;
begin
  Result := Self;
  lblValorAbertura.Text := FormatCurr('R$ #,##0.00', aValue);
end;

function TComponentItemCaixa.ValorFechamento(
  aValue: Currency): TComponentItemCaixa;
begin
  Result := Self;
  lblValorFechamento.Text := FormatCurr('R$ #,##0.00', aValue);
end;

end.
