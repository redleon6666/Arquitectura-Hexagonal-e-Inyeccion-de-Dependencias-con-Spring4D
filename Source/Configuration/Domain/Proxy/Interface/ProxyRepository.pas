unit ProxyRepository;

interface

uses
  Proxy;

type
  IProxyRepository = interface
    ['{EFB8DEE6-4B28-44B6-AD15-7E58E95A9149}']
    function Getter: TProxy;
    procedure Setter(const Proxy: TProxy);
  end;

implementation

end.
