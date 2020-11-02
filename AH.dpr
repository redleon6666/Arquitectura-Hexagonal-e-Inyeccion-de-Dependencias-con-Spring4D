program AH;

uses
  Vcl.Forms,
  uFormProxy in 'Source\Infrastructure\Configuration\Proxy\uFormProxy.pas' {FormProxy},
  uRegistrationConfiguration in 'Source\Infrastructure\DependencyInjection\uRegistrationConfiguration.pas',
  uProxy in 'Source\Domain\Configuration\Proxy\Entity\uProxy.pas',
  uProxyDTO in 'Source\Application\Configuration\Proxy\Entity\uProxyDTO.pas',
  uIProxyGetter in 'Source\Application\Configuration\Proxy\Getter\uIProxyGetter.pas',
  uProxyGetter in 'Source\Application\Configuration\Proxy\Getter\uProxyGetter.pas',
  uProxySetter in 'Source\Application\Configuration\Proxy\Setter\uProxySetter.pas',
  uIProxyRepository in 'Source\Domain\Configuration\Proxy\Repository\uIProxyRepository.pas',
  uFromIniFileProxyRepository in 'Source\Infrastructure\Configuration\Proxy\Repository\uFromIniFileProxyRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterClassesAnInterfacesConfiguration;
  Application.CreateForm(TFormProxy, FormProxy);
  Application.Run;
end.
