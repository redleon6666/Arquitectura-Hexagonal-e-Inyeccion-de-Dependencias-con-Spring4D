unit uProxySetter;

interface

uses
  uIProxyRepository, uProxyDTO, uProxy;

type
  TProxySetter = class
  private
    FIProxyRepository: IProxyRepository;
    function ParseToDomain(Value: TProxyDTO): TProxy;
  public
    constructor Create(Value: IProxyRepository);
    destructor Destroy; override;
    procedure Invoke(Value: TProxyDTO);
  end;

implementation

uses
  Dialogs;

{ TProxySetter }

constructor TProxySetter.Create(Value: IProxyRepository);
begin
  Self.FIProxyRepository := Value;
  ShowMessage('TProxySetter.Create');
end;

destructor TProxySetter.Destroy;
begin
  inherited;
  ShowMessage('TProxySetter.Destroy');
end;

procedure TProxySetter.Invoke(Value: TProxyDTO);
begin
  Self.FIProxyRepository.Save(Self.ParseToDomain(Value));
end;

function TProxySetter.ParseToDomain(Value: TProxyDTO): TProxy;
begin
  Result := TProxy.Create(Value.Uri, Value.Port, Value.User, Value.Password);
end;

end.
