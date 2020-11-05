unit uRegistrationConfiguration;

interface

procedure RegisterClassesAnInterfacesConfiguration;

implementation

uses
  Spring.Container, uIProxyRepository, uFromIniFileProxyRepository,
  uProxyGetter, uProxySetter, uApplicationResources;

procedure RegisterClassesAnInterfacesConfiguration;
begin
  GlobalContainer.RegisterType<TApplicationResources>.AsSingleton();

  GlobalContainer.RegisterType<IProxyRepository,TFromIniFileProxyRepository>
    .AsSingleton.DelegateTo(
      function: TFromIniFileProxyRepository
      begin
        //Result := TFromIniFileProxyRepository.Create('c:\ProgramData\MyProxyConfiguration.ini');
        Result := TFromIniFileProxyRepository.Create(GlobalContainer.Resolve<TApplicationResources>.IniFileConfiguration);
      end);
  GlobalContainer.RegisterType<IProxyGetter,TProxyGetter>.AsTransient;
  GlobalContainer.RegisterType<TProxySetter>.AsTransient;
  GlobalContainer.Build;
end;

end.
