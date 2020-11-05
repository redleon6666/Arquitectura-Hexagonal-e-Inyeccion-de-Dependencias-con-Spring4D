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
  uApplicationResources in 'Source\Infrastructure\uApplicationResources.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterClassesAnInterfacesConfiguration;
  GlobalContainer.Resolve<TApplicationResources>.IniFileConfiguration:='c:\ProgramData\MyProxyConfiguration.ini';
  Application.CreateForm(TFormProxy, FormProxy);
  Application.Run;
end.
