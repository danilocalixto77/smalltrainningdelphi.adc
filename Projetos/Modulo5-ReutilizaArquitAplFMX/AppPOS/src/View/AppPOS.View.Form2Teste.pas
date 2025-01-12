unit AppPOS.View.Form2Teste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  AppPOS.Controller.Observers.Interfaces;

type
  TForm2 = class(TForm, iControllerSubjectTitle, iControllerSubjectTotal)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MessageTitle ( aValue : String ) : iControllerSubjectTitle;
    function MessageTotal ( aValue : Currency ) : iControllerSubjectTotal;
  end;

var
  Form2: TForm2;

implementation

uses
  AppPOS.Controller.Observers.Title, AppPOS.Controller.Observers.Total;

{$R *.fmx}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  TControllerObserverTitle.New.Registry(Self);
  TControllerObserverTotal.New.Registry(Self);
end;

function TForm2.MessageTitle(aValue: String): iControllerSubjectTitle;
begin
  Label1.Text := aValue;
end;

function TForm2.MessageTotal(aValue: Currency): iControllerSubjectTotal;
begin
  Label2.Text := FormatCurr('R$ #,##0.00', aValue);
end;

end.
