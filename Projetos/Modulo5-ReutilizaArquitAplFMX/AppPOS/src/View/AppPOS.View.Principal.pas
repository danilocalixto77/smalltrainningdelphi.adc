unit AppPOS.View.Principal;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Effects,
  FMX.Filter.Effects,
  FMX.Objects,
  FMX.Controls.Presentation,
  AppPOS.Controller.Interfaces,
  AppPOS.Controller.Observers.Interfaces, AppPOS.View.Form2Teste;

type
  TForm3 = class(TForm, iControllerSubjectTitle, iControllerSubjectTotal)
    Layout1: TLayout;
    Layout2: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Image7: TImage;
    FillRGBEffect4: TFillRGBEffect;
    Layout8: TLayout;
    Rectangle1: TRectangle;
    Layout9: TLayout;
    Rectangle2: TRectangle;
    Image6: TImage;
    FillRGBEffect3: TFillRGBEffect;
    Image8: TImage;
    FillRGBEffect5: TFillRGBEffect;
    SpeedButton1: TSpeedButton;
    Layout10: TLayout;
    Label2: TLabel;
    Layout3: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    FlowLayout1: TFlowLayout;
    Layout13: TLayout;
    Layout17: TLayout;
    Label3: TLabel;
    Image2: TImage;
    FillRGBEffect1: TFillRGBEffect;
    SpeedButton2: TSpeedButton;
    Layout14: TLayout;
    Layout18: TLayout;
    Label4: TLabel;
    Image3: TImage;
    FillRGBEffect2: TFillRGBEffect;
    Layout15: TLayout;
    Layout19: TLayout;
    Image4: TImage;
    Layout16: TLayout;
    Layout20: TLayout;
    Image5: TImage;
    Layout12: TLayout;
    VertScrollBox1: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
    function MessageTitle ( aValue : String ) : iControllerSubjectTitle;
    function MessageTotal ( aValue : Currency ) : iControllerSubjectTotal;
  end;

var
  Form3: TForm3;

implementation

uses
  AppPOS.Controller,
  AppPOS.Controller.Observers.Title,
  AppPOS.Controller.Observers.Total;

{$R *.fmx}

procedure TForm3.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  TControllerObserverTitle.New.Registry(Self);
  TControllerObserverTotal.New.Registry(Self);
end;

function TForm3.MessageTitle(aValue: String): iControllerSubjectTitle;
begin
  Label2.Text := aValue;
end;

function TForm3.MessageTotal(aValue: Currency): iControllerSubjectTotal;
begin
  Label1.Text := FormatCurr('R$ #,##0.00', aValue);
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  FController.CAIXA.ListarCaixas(VertScrollBox1);
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  Form2.Show;
end;

end.
