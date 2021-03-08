unit uRegistrationConfiguration;

interface

procedure RegisterClassesAnInterfacesConfiguration;

implementation

uses
  Spring.Container, uIProxyRepository, uFromIniFileProxyRepository,
  uProxyGetter, uProxySetter, uApplicationResources,
  uICourseRepository, uInMemoryCourseRepository, uCourseCreator,
  uIDomainEventBus, uInMemoryDomainEventBus;

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

  GlobalContainer.RegisterType<ICourseRepository, TInMemoryCourseRepository>.AsSingleton;
  GlobalContainer.RegisterType<TCourseCreator>;

  GlobalContainer.RegisterType<IDomainEventBus, TInMemoryDomainEventBus>.AsSingleton;

  GlobalContainer.Build;
end;

end.
