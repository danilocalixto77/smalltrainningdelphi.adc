unit AppRAD.Model.Connection.Firedac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  AppRAD.Model.Connection.Interfaces;

type
  TModelConnectionFiredac = class(TInterfacedObject, iConnection<TFDConnection>)
    private
      FConnection : TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConnection<TFDConnection>;
      function Connection : TFDConnection;
  end;

var
  FInstance : iConnection<TFDConnection>;

implementation

uses
  System.SysUtils;

{ TModelConnectionFiredac }

function TModelConnectionFiredac.Connection: TFDConnection;
begin
  Result := FConnection;
end;

constructor TModelConnectionFiredac.Create;
begin
  FConnection := TFDConnection.Create(nil);
  try
    FConnection.DriverName := 'FB';
    FConnection.Params.DriverID := 'FB';
    FConnection.Params.Database := 'D:\Projetos\Cursos\SmallTrainning\MVC e Servidor de Aplicacao\Database\PDV.FDB';
    FConnection.Params.UserName := 'SYSDBA';
    FConnection.Params.Password := 'masterkey';
    FConnection.LoginPrompt := False;
    FConnection.Connected := True;
  except on e : Exception do
    raise Exception.Create(e.Message);
  end;
end;

destructor TModelConnectionFiredac.Destroy;
begin
  FConnection.Free;
  inherited;
end;

class function TModelConnectionFiredac.New: iConnection<TFDConnection>;
begin
  if not Assigned(FInstance) then
    FInstance := Self.Create;

  Result := FInstance;
end;

initialization
  FInstance := TModelConnectionFiredac.New;


end.
