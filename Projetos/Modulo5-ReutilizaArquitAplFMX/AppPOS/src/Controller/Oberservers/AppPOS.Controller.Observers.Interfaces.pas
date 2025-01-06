unit AppPOS.Controller.Observers.Interfaces;

interface

type
  iControllerSubjectTitle = interface;
  iControllerSubjectTotal = interface;

  iControllerObserverTitle = interface
    ['{61208D4D-E17D-42B6-A323-FC4271369EAE}']
    function Registry ( aValue : iControllerSubjectTitle) : iControllerObserverTitle;
    function UnRegistry ( aValue : iControllerSubjectTitle) : iControllerObserverTitle;
    function SendMessage ( aValue : String ) : iControllerObserverTitle;
  end;

  iControllerSubjectTitle = interface
    ['{4608E07A-0A27-4E16-AF62-A468FAFF5B2A}']
    function MessageTitle ( aValue : String ) : iControllerSubjectTitle;
  end;

  iControllerObserverTotal = interface
    ['{61208D4D-E17D-42B6-A323-FC4271369EAE}']
    function Registry ( aValue : iControllerSubjectTotal) : iControllerObserverTotal;
    function UnRegistry ( aValue : iControllerSubjectTotal) : iControllerObserverTotal;
    function SendMessage ( aValue : Currency ) : iControllerObserverTotal;
  end;

  iControllerSubjectTotal = interface
    ['{4608E07A-0A27-4E16-AF62-A468FAFF5B2A}']
    function MessageTotal ( aValue : Currency ) : iControllerSubjectTotal;
  end;

implementation

end.
