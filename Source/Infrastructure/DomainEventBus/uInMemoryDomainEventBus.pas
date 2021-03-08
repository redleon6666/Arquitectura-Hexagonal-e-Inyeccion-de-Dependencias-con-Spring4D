unit uInMemoryDomainEventBus;

interface

uses
  uIDomainEventBus, Generics.Collections, uDomainEvent;

type
  TInMemoryDomainEventBus = class (TInterfacedObject, IDomainEventBus)
  private
    FEvents: TList<TDomainEvent>;
    procedure Publish(Event: TDomainEvent); overload;
  public
    constructor Create();
    procedure Publish(Events: TList<TDomainEvent>); overload;
  end;

implementation

uses
  EventBus, uEvent, uCourseCreatedDomainEvent;

{ TInMemoryDomainEventBus }

constructor TInMemoryDomainEventBus.Create;
begin
  Self.FEvents := TList<TDomainEvent>.Create();
end;

procedure TInMemoryDomainEventBus.Publish(Events: TList<TDomainEvent>);
var
  event: TDomainEvent;
begin
  Self.FEvents.AddRange(Events);

  for event in Self.FEvents do
  begin
    Self.Publish(event);
    Self.FEvents.Remove(event);
  end;

  Events.Free;
end;

procedure TInMemoryDomainEventBus.Publish(Event: TDomainEvent);
var
  courseCreatedDomainEvent:TEvent<TCourseCreatedDomainEvent>;
begin
  if Event is TCourseCreatedDomainEvent then
  begin
    courseCreatedDomainEvent := TEvent<TCourseCreatedDomainEvent>.Create(Event as TCourseCreatedDomainEvent);
    GlobalEventBus.Post(courseCreatedDomainEvent as IEvent<TCourseCreatedDomainEvent>);
    Exit;
  end;
end;

end.
