unit AppRAD.Model.DAO.Intefaces;

interface

uses
  Data.DB, System.Generics.Collections, SimpleInterface, System.SysUtils;

type

  iDAOGeneric<T : class> = interface
    ['{25965D53-16CD-46EA-91DF-01B129E0F555}']
    function Insert : iDAOGeneric<T>;
    function Update : iDAOGeneric<T>;
    function Find : iDAOGeneric<T>; overload;
    function Find (const aID : String ) : iDAOGeneric<T>; overload;
    function Find (var aList : TObjectList<T>) : iDAOGeneric<T> ; overload;
    function Delete : iDAOGeneric<T>;
    function DataSource ( aValue : TDataSource ) : iDAOGeneric<T>;
    function Current : T;
    function NewObject : T;
    function Query : ISimpleDAO<T>;
    function DataSet : TDataSet;
    function LastID : Integer;
    function DataChange( aValue : TProc<TObject, TField>) : iDAOGeneric<T>;
  end;

  iDAOFactory<T : class> = interface
    ['{691E3D49-FA6C-4EFD-BF92-077752F94710}']
    function DAO : iDAOGeneric<T>;
  end;

implementation

end.
