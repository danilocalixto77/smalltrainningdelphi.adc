unit Model.Log.Csv;

interface

uses
  Model.Log.Interfaces, Model.Log;

type
  TModelCsv = class (TInterfacedObject, iLog)
  private
    FDecorator : iLog;
  public
    constructor Create(Decorator : iLog = nil);
    destructor Destroy;override;
    class function New(Decorator : iLog = nil) : iLog;
    function Gravar (aValue : String) : iLog;

  end;


implementation

{ TModelCsv }

constructor TModelCsv.Create(Decorator: iLog);
begin
  FDecorator := Decorator;
end;

destructor TModelCsv.Destroy;
begin

  inherited;
end;

function TModelCsv.Gravar(aValue: String): iLog;
begin
  Result := Self;

  if Assigned then
    FDecorator.Gravar(aValue);
end;

class function TModelCsv.New(Decorator: iLog): iLog;
begin
  Result := Self.Create(Decorator);
end;

end.
