unit uIProxyRepository;

interface

uses
  uProxy;

type
  IProxyRepository = interface
    ['{EFB8DEE6-4B28-44B6-AD15-7E58E95A9149}']
    function Load: TProxy;
    procedure Save(const Proxy: TProxy);
  end;

implementation

end.
