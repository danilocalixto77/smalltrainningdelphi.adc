unit AppPOS.Controller.Observers.Total;

interface

uses
  System.Generics.Collections,
  AppPOS.Controller.Observers.Interfaces;

type
  TControllerObserverTotal = class(TInterfacedObject, iControllerObserverTotal)
    private
      FList : TList<iControllerSubjectTotal>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerObserverTotal;
      function Registry ( aValue : iControllerSubjectTotal) : iControllerObserverTotal;
      function UnRegistry ( aValue : iControllerSubjectTotal) : iControllerObserverTotal;
      function SendMessage ( aValue : Currency ) : iControllerObserverTotal;
  end;

var
  ControllerObserverTitle : iControllerObserverTotal;

implementation

{ TControllerObserverTotal }

constructor TControllerObserverTotal.Create;
begin
  FList := TList<iControllerSubjectTotal>.Create;
end;

destructor TControllerObserverTotal.Destroy;
begin
  FList.Free;
  inherited;
end;

class function TControllerObserverTotal.New: iControllerObserverTotal;
begin
  if not Assigned(ControllerObserverTitle) then
    ControllerObserverTitle := Self.Create;

  Result := ControllerObserverTitle;
end;

function TControllerObserverTotal.Registry(
  aValue: iControllerSubjectTotal): iControllerObserverTotal;
begin
  Result := Self;
  FList.Add(aValue);
end;

function TControllerObserverTotal.SendMessage(
  aValue: Currency): iControllerObserverTotal;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FList.Count) do
    FList[I].MessageTotal(aValue);
end;

function TControllerObserverTotal.UnRegistry(
  aValue: iControllerSubjectTotal): iControllerObserverTotal;
begin
  Result := Self;
  FList.Remove(aValue);
end;

end.
