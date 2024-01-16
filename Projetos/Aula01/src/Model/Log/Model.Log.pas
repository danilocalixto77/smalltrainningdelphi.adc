unit Model.Log;

interface

uses
  Model.Log.Interfaces, Model.Log.Texto, Model.Log.Csv, Model.Log.MongoDB;

type
  TLog = class(TInterfacedObject, iLog)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iLog;
      function Gravar ( aValue : String ) : iLog;
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
  Result := Self;

  TLogTexto
    .New(
      TLogCsv
        .New(
          TLogMongoDB.New
      )
  )
  .Gravar(aValue);
end;

class function TLog.New: iLog;
begin
    Result := Self.Create;
end;

end.
