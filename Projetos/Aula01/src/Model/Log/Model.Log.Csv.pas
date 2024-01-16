unit Model.Log.Csv;

interface

uses
  Model.Log.Interfaces;

type
  TLogCsv = class(TInterfacedObject, iLog)
    private
      FDecorator : iLog;
    public
      constructor Create(Decorator : iLog = nil);
      destructor Destroy; override;
      class function New(Decorator : iLog = nil) : iLog;
      function Gravar ( aValue : String ) : iLog;
  end;

implementation

{ TLogCsv }

constructor TLogCsv.Create(Decorator : iLog = nil);
begin
  FDecorator := Decorator;
end;

destructor TLogCsv.Destroy;
begin

  inherited;
end;

function TLogCsv.Gravar(aValue: String): iLog;
begin
  Result := Self;

  if Assigned(FDecorator) then
    FDecorator.Gravar(aValue);
end;

class function TLogCsv.New(Decorator : iLog = nil) : iLog;
begin
    Result := Self.Create(Decorator);
end;

end.
