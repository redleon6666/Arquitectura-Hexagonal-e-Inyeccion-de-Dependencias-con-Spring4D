unit uRegistrationConfiguration;

interface

procedure RegisterClassesAnInterfacesConfiguration;

implementation

uses
  Spring.Container, ProxyRepository, FromIniFileProxyRepository;

procedure RegisterClassesAnInterfacesConfiguration;
begin
  GlobalContainer.RegisterType<IProxyRepository,TFromIniFileProxyRepository>
    .AsSingleton.DelegateTo(
      function: TFromIniFileProxyRepository
      begin
        Result := TFromIniFileProxyRepository.Create('c:\ProgramData\MyProxyConfiguration.ini');
      end);
  GlobalContainer.Build;
end;

end.
