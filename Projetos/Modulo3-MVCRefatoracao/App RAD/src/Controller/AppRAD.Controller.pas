unit AppRAD.Controller;

interface

uses
  AppRAD.Controller.Interfaces,
  AppRAD.Model.Entity.CAIXA;

type
  TController = class(TInterfacedObject, iController)
    private
      FCAIXA : iControllerEntity<TCAIXA>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function CAIXA : iControllerEntity<TCAIXA>;
  end;

implementation

uses
  AppRAD.Controller.Generic;

{ TController }

function TController.CAIXA: iControllerEntity<TCAIXA>;
begin
  if not Assigned(FCAIXA) then
    FCAIXA := TControllerGeneric<TCAIXA>.New(Self);

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
