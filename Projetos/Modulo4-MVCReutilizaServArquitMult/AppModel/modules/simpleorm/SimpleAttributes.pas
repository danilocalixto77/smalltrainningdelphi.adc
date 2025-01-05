unit SimpleAttributes;

interface

{$M+}
{$TYPEINFO ON}

uses
  System.RTTI, System.Variants, System.Classes;

type
  Tabela = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(aName: string);
    property Name: string read FName;
  end;

  Generator = class(TCustomAttribute)
    private
    FGenerator: String;
    procedure SetGenerator(const Value: String);
    public
      Constructor Create( aGenerator : String);
      property Generator : String read FGenerator write SetGenerator;
  end;

  Database = class(TCustomAttribute)
    private
    FDatabase: String;
    procedure SetDatabase(const Value: String);
    public
      constructor Create ( aDatabase : String);
      property Database : String read FDatabase write SetDatabase;
  end;

  Campo = class(TCustomAttribute)
  private
    FName: string;
  public
    Constructor Create(aName: string);
    property Name: string read FName;
  end;

  PK = class(TCustomAttribute)
  end;

  FK = class(TCustomAttribute)
  end;

  NotNull = class(TCustomAttribute)
  end;

  Ignore = class(TCustomAttribute)
  end;

  AutoInc = class(TCustomAttribute)
  end;

  NumberOnly = class(TCustomAttribute)
  end;

  Bind = class(TCustomAttribute)
  private
    FField: String;
    procedure SetField(const Value: String);
  published
    constructor Create (aField : String);
    property Field : String read FField write SetField;
  end;

  Display = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const aName: string);
    property Name: string read FName write FName;
  end;

  Format = class(TCustomAttribute)
  private
    FMaxSize: integer;
    FPrecision: integer;
    FMask: string;
    FMinSize: integer;
  public
    property MaxSize: integer read FMaxSize write FMaxSize;
    property MinSize: integer read FMinSize write FMinSize;
    property Precision: integer read FPrecision write FPrecision;
    property Mask: string read FMask write FMask;
    function GetNumericMask: string;
    constructor Create(const aSize: Integer; const aPrecision: integer = 0); overload;
    constructor Create(const aMask: string); overload;
    constructor Create(const aRange: array of Integer); overload;
  end;

  Relationship = class abstract(TCustomAttribute)
  private
    FEntityName: string;
  public
    constructor Create(const aEntityName: string);
    property EntityName: string read FEntityName write FEntityName;
  end;

  HasOne = class(Relationship)
  end;

  BelongsTo = class(Relationship)
  end;
  
  HasMany = class(Relationship)
  end;

  BelongsToMany = class(Relationship)
  end;

implementation


{ Bind }

constructor Bind.Create(aField: String);
begin
  FField := aField;
end;

procedure Bind.SetField(const Value: String);
begin
  FField := Value;
end;

{ Tabela }

constructor Tabela.Create(aName: string);
begin
  FName := aName;
end;

{ Campo }

constructor Campo.Create(aName: string);
begin
  FName := aName;
end;

{ Display }

constructor Display.Create(const aName: string);
begin
  FName := aName;
end;

{ Formato }

constructor Format.Create(const aSize, aPrecision: integer);
begin
  FMaxSize := aSize;
  FPrecision := aPrecision;
end;

constructor Format.Create(const aMask: string);
begin
  FMask := aMask;
end;

constructor Format.Create(const aRange: array of Integer);
begin
  FMinSize := aRange[0];
  FMaxSize := aRange[High(aRange)];
end;

function Format.GetNumericMask: string;
var
  sTamanho, sPrecisao: string;
begin
  sTamanho := StringOfChar('0', FMaxSize - FPrecision);
  sPrecisao := StringOfChar('0', FPrecision);

  Result := sTamanho + '.' + sPrecisao;
end;

{ Relationship }

constructor Relationship.Create(const aEntityName: string);
begin
  FEntityName := aEntityName;
end;

{ Generator }

constructor Generator.create(aGenerator: String);
begin
  FGenerator := aGenerator;
end;

procedure Generator.SetGenerator(const Value: String);
begin
  FGenerator := Value;
end;

{ Database }

constructor Database.Create(aDatabase: String);
begin
  FDatabase := aDatabase;
end;

procedure Database.SetDatabase(const Value: String);
begin
  FDatabase := Value;
end;

end.
