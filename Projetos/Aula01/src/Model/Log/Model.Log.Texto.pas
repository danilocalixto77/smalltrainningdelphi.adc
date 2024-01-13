unit Model.Log.Texto;

interface

uses
  Model.Log.Interfaces, Model.Log;
type
  TLogTexto = class(TInterfacedObject, iLog)
    private
      FDecorator : iLog;
    public
    constructor Create(Decorator : iLog = nil);
    destructor Destroy; override;
    class function New(Decorator : iLog = nil) : iLog;
    function Gravar (aValue : String) : iLog;
  end;

implementation

{ TLogTexto }

constructor TLogTexto.Create(Decorator : iLog = nil);
begin
  FDecorator := Decorator;
end;

destructor TLogTexto.Destroy;
begin

  inherited;
end;

function TLogTexto.Gravar(aValue: String): iLog;
begin
  Result := Self;
  if Assigned then
    FDecorator.Gravar(aValue);
  //Gravar Texto
end;

class function TLogTexto.New(Decorator : iLog = nil) : iLog;
begin
  Result := Self.Create(Decorator);
end;

end.
