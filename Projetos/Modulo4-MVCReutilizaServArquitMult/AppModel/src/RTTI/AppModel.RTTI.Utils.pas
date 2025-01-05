unit AppModel.RTTI.Utils;

interface

type
  TRTTIUtils<T> = class
    private
    public
      class function GetBaseURL : String;
  end;

implementation

uses
  System.TypInfo, System.Rtti, AppModel.RTTI.CustomAttributes;

{ TRTTIUtils<T> }

class function TRTTIUtils<T>.GetBaseURL: String;
var
  vInfo : PTypeInfo;
  ctxRTTI : TRttiContext;
  typRTTI : TRttiType;
  cusAttr : TCustomAttribute;
begin
  vInfo := System.TypeInfo(T);
  ctxRTTI := TRttiContext.Create;
  try
    typRTTI := ctxRTTI.GetType(vInfo);  
    for cusAttr in typRTTI.GetAttributes do
      if cusAttr is BaseURL then
        Result := BaseURL(cusAttr).BaseURL;
  finally
    ctxRTTI.Free;
  end;
end;

end.
