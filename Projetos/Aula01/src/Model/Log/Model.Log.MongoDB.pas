unit Model.Log.MongoDB;

interface

uses
  Model.Log.Interfaces;

type
  TLogMongoDB = class(TInterfacedObject, iLog)
    private
      FDecorator : iLog;
    public
      constructor Create(Decorator : iLog = nil);
      destructor Destroy; override;
      class function New(Decorator : iLog = nil) : iLog;
      function Gravar ( aValue : String ) : iLog;
  end;

implementation

{ TLogMongoDB }

constructor TLogMongoDB.Create(Decorator : iLog = nil);
begin
  FDecorator := Decorator;
end;

destructor TLogMongoDB.Destroy;
begin

  inherited;
end;

function TLogMongoDB.Gravar(aValue: String): iLog;
begin
  Result := Self;

  if Assigned(FDecorator) then
    FDecorator.Gravar(aValue);

end;

class function TLogMongoDB.New(Decorator : iLog = nil) : iLog;
begin
    Result := Self.Create(Decorator);
end;

end.
