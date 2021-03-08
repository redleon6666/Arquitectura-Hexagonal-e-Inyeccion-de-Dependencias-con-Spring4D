program AH;

uses
  Vcl.Forms,
  Spring.Container,
  uFormProxy in 'Source\FrontEnd\uFormProxy.pas' {FormProxy},
  uRegistrationConfiguration in 'Source\DependencyInjection\uRegistrationConfiguration.pas',
  uProxy in 'Source\Domain\Configuration\uProxy.pas',
  uProxyDTO in 'Source\Application\Configuration\Share\uProxyDTO.pas',
  uProxyGetter in 'Source\Application\Configuration\ProxyGetter\uProxyGetter.pas',
  uProxySetter in 'Source\Application\Configuration\ProxySetter\uProxySetter.pas',
  uIProxyRepository in 'Source\Domain\Configuration\uIProxyRepository.pas',
  uFromIniFileProxyRepository in 'Source\Infrastructure\Configuration\Proxy\uFromIniFileProxyRepository.pas',
  uApplicationResources in 'Source\Infrastructure\uApplicationResources.pas',
  EventBus.Core in 'Source\Infrastructure\EventBus\EventBus.Core.pas',
  EventBus.Helpers in 'Source\Infrastructure\EventBus\EventBus.Helpers.pas',
  EventBus in 'Source\Infrastructure\EventBus\EventBus.pas',
  EventBus.Subscribers in 'Source\Infrastructure\EventBus\EventBus.Subscribers.pas',
  uAggregateRoot in 'Source\Domain\Shared\uAggregateRoot.pas',
  uDomainEvent in 'Source\Domain\Shared\uDomainEvent.pas',
  uCourseCreator in 'Source\Application\Courses\CourseCreator\uCourseCreator.pas',
  uICourseRepository in 'Source\Domain\Courses\uICourseRepository.pas',
  uCourse in 'Source\Domain\Courses\uCourse.pas',
  uCourseCreatedDomainEvent in 'Source\Domain\Courses\uCourseCreatedDomainEvent.pas',
  uIDomainEventBus in 'Source\Domain\Shared\uIDomainEventBus.pas',
  uInMemoryDomainEventBus in 'Source\Infrastructure\DomainEventBus\uInMemoryDomainEventBus.pas',
  uFormCourseCreator in 'Source\FrontEnd\uFormCourseCreator.pas' {FormCourseCreator},
  uFormMain in 'Source\FrontEnd\uFormMain.pas' {FormMain},
  uInMemoryCourseRepository in 'Source\Infrastructure\Courses\uInMemoryCourseRepository.pas',
  uEvent in 'Source\Infrastructure\DomainEventBus\uEvent.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterClassesAnInterfacesConfiguration;
  GlobalContainer.Resolve<TApplicationResources>.IniFileConfiguration:='c:\ProgramData\MyProxyConfiguration.ini';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormProxy, FormProxy);
  Application.CreateForm(TFormCourseCreator, FormCourseCreator);
  Application.Run;
end.
