unit AppModel.RTTI.CustomAttributes;

interface

type

  BaseURL = class(TCustomAttribute)
    private
      FBaseURL : String;
    public
      constructor Create(aBaseURL : String);
      property BaseURL : string read FBaseURL;
  end;

implementation

{ BaseURL }

constructor BaseURL.Create(aBaseURL: String);
begin
  FBaseURL := aBaseURL;
end;

end.
