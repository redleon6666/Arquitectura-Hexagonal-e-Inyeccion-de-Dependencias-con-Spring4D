unit uIProxyGetter;

interface

uses
  uProxyDTO;

type
  IProxyGetter = interface ['{17F90378-6763-46F6-8A09-DE0D14A467A5}']
    function Invoke: TProxyDTO;
  end;

implementation

end.
