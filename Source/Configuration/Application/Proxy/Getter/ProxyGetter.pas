unit ProxyGetter;

interface

uses
  ProxyRepository, ProxyDTO, Proxy;

type
  TProxyGetter = class
  private
    FIProxyRepository: IProxyRepository;
    function ParseToDTO(Value: TProxy): TProxyDTO;
  public
    constructor Create(Value: IProxyRepository);
    function Invoke: TProxyDTO;
  end;

implementation

{ TProxyGetter }

constructor TProxyGetter.Create(Value: IProxyRepository);
begin
  Self.FIProxyRepository := Value;
end;

function TProxyGetter.Invoke: TProxyDTO;
begin
  Result := Self.ParseToDTO(Self.FIProxyRepository.Getter);
end;

function TProxyGetter.ParseToDTO(Value: TProxy): TProxyDTO;
begin
  Result := TProxyDTO.Create(Value.Uri, Value.Port, Value.User, Value.Password);
end;

end.
