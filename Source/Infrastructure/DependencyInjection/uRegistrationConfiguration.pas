unit uRegistrationConfiguration;

interface

procedure RegisterClassesAnInterfacesConfiguration;

implementation

uses
  Spring.Container, uIProxyRepository, uFromIniFileProxyRepository,
  uProxyGetter, uIProxyGetter;

procedure RegisterClassesAnInterfacesConfiguration;
begin
  GlobalContainer.RegisterType<IProxyRepository,TFromIniFileProxyRepository>
    .AsSingleton.DelegateTo(
      function: TFromIniFileProxyRepository
      begin
        Result := TFromIniFileProxyRepository.Create('c:\ProgramData\MyProxyConfiguration.ini');
      end);
  GlobalContainer.RegisterType<IProxyGetter,TProxyGetter>.AsTransient;
  GlobalContainer.Build;
end;

end.
