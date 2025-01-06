unit AppPOS.Controller.Observers.Title;

interface

uses
  System.Generics.Collections,
  AppPOS.Controller.Observers.Interfaces;

type
  TControllerObserverTitle = class(TInterfacedObject, iControllerObserverTitle)
    private
      FList : TList<iControllerSubjectTitle>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerObserverTitle;
      function Registry ( aValue : iControllerSubjectTitle) : iControllerObserverTitle;
      function UnRegistry ( aValue : iControllerSubjectTitle) : iControllerObserverTitle;
      function SendMessage ( aValue : String ) : iControllerObserverTitle;
  end;

var
  ControllerObserverTitle : iControllerObserverTitle;

implementation

{ TControllerObserverTitle }

constructor TControllerObserverTitle.Create;
begin
  FList := TList<iControllerSubjectTitle>.Create;
end;

destructor TControllerObserverTitle.Destroy;
begin
  FList.Free;
  inherited;
end;

class function TControllerObserverTitle.New: iControllerObserverTitle;
begin
  if not Assigned(ControllerObserverTitle) then
    ControllerObserverTitle := Self.Create;

  Result := ControllerObserverTitle;
end;

function TControllerObserverTitle.Registry(
  aValue: iControllerSubjectTitle): iControllerObserverTitle;
begin
  Result := Self;
  FList.Add(aValue);
end;

function TControllerObserverTitle.SendMessage(
  aValue: String): iControllerObserverTitle;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FList.Count) do
    FList[I].MessageTitle(aValue);
end;

function TControllerObserverTitle.UnRegistry(
  aValue: iControllerSubjectTitle): iControllerObserverTitle;
begin
  Result := Self;
  FList.Remove(aValue);
end;

end.
