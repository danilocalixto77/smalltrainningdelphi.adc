unit AppPOS.Controller;

interface

uses
  AppPOS.Controller.Interfaces;

type
  TController = class(TInterfacedObject, iController)
    private
      FCAIXA : iControllerCaixa;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function CAIXA : iControllerCaixa;
  end;

implementation

uses
  AppPOS.Controller.Entity.CAIXA;

{ TController }

function TController.CAIXA: iControllerCaixa;
begin
  if not Assigned(FCAIXA) then
    FCAIXA := TControllerEntityCaixa.New(Self);

  Result := FCAIXA;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
    Result := Self.Create;
end;

end.
