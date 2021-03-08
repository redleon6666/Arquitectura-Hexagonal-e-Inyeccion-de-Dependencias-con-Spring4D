unit uAggregateRoot;

interface

uses
  Generics.Collections, uDomainEvent;

type
  TAggregateRoot = class
  private
    FDomainEvents : TList<TDomainEvent>;
  protected
    procedure RecordDomainEvent(DomainEvent: TDomainEvent); //record //register
  public
    constructor Create();
    destructor Destroy(); override;
    function PullDomainEvents(): TList<TDomainEvent>;
  end;

implementation

{ TAggregateRoot }

constructor TAggregateRoot.Create;
begin
  Self.FDomainEvents := TList<TDomainEvent>.Create();
end;

destructor TAggregateRoot.Destroy;
begin
  inherited;
  Self.FDomainEvents.Free;
end;

procedure TAggregateRoot.RecordDomainEvent(DomainEvent: TDomainEvent);
begin
  Self.FDomainEvents.Add(DomainEvent);
end;

function TAggregateRoot.PullDomainEvents: TList<TDomainEvent>;
begin
  Result := TList<TDomainEvent>.Create();
  Result.AddRange(Self.FDomainEvents);
  Self.FDomainEvents.Clear;
end;

end.
