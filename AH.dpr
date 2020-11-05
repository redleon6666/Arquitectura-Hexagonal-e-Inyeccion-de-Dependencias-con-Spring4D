program AH;

uses
  Vcl.Forms,
  uFormProxy in 'Source\FrontEnd\uFormProxy.pas' {FormProxy},
  uRegistrationConfiguration in 'Source\DependencyInjection\uRegistrationConfiguration.pas',
  uProxy in 'Source\Domain\Configuration\uProxy.pas',
  uProxyDTO in 'Source\Application\Configuration\Share\uProxyDTO.pas',
  uProxyGetter in 'Source\Application\Configuration\ProxyGetter\uProxyGetter.pas',
  uProxySetter in 'Source\Application\Configuration\ProxySetter\uProxySetter.pas',
  uIProxyRepository in 'Source\Domain\Configuration\uIProxyRepository.pas',
  uFromIniFileProxyRepository in 'Source\Infrastructure\Configuration\Proxy\uFromIniFileProxyRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterClassesAnInterfacesConfiguration;
  Application.CreateForm(TFormProxy, FormProxy);
  Application.Run;
end.
