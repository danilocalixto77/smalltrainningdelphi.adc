unit Model.Log;

interface

uses Model.Log.Interfaces, Model.Log.Texto;
type
  TLog = class (TInterfacedObject, iLog)
    private
      FDecorator : iLog;
    public
    constructor Create;
    destructor Destroy;override;
    //class function New : iLog;
    class function New(Decorator : iLog = nil) : iLog;
    function Gravar (aValue : String) : iLog;
  end;

implementation

{ TLog }

constructor TLog.Create;
begin

end;

destructor TLog.Destroy;
begin

  inherited;
end;

function TLog.Gravar(aValue: String): iLog;
begin
  TLogTexto.New.Gravar(aValue);

end;

class function TLog.New: iLog;
begin
  Result := Self.Create;
end;

end.
