unit uProxyGetter;

interface

uses
  uIProxyRepository, uProxyDTO, uProxy, uIProxyGetter;

type
  TProxyGetter = class (TInterfacedObject, IProxyGetter)
  private
    FIProxyRepository: IProxyRepository;
    function ParseToDTO(Value: TProxy): TProxyDTO;
  public
    constructor Create(Value: IProxyRepository);
    destructor Destroy; override;
    function Invoke: TProxyDTO;
  end;

implementation

uses
  Dialogs;

{ TProxyGetter }

constructor TProxyGetter.Create(Value: IProxyRepository);
begin
  Self.FIProxyRepository := Value;
  ShowMessage('TProxyGetter.Create');
end;

destructor TProxyGetter.Destroy;
begin
  inherited;
  ShowMessage('TProxyGetter.Destroy');
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
