program AH;

uses
  Vcl.Forms,
  FormTester in 'Source\Frontend\FormTester.pas' {Form1},
  Proxy in 'Source\Configuration\Domain\Proxy\Entity\Proxy.pas',
  ProxyRepository in 'Source\Configuration\Domain\Proxy\Interface\ProxyRepository.pas',
  ProxyDTO in 'Source\Configuration\Application\Proxy\Entity\ProxyDTO.pas',
  ProxyGetter in 'Source\Configuration\Application\Proxy\Getter\ProxyGetter.pas',
  ProxySetter in 'Source\Configuration\Application\Proxy\Setter\ProxySetter.pas',
  FromIniFileProxyRepository in 'Source\Configuration\Infrastructure\Proxy\FromIniFileProxyRepository.pas',
  uRegistrationConfiguration in 'Source\DependencyInjection\uRegistrationConfiguration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterClassesAnInterfacesConfiguration;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
