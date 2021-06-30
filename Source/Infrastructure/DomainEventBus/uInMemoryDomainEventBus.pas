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
  EventBus, uEvent, uCourseCreatedDomainEvent, Rtti;

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
  courseCreatedDomainEvent, test2:TEvent<TCourseCreatedDomainEvent>;
  body: TDictionary<string,TValue>;
  ev1, ev2: TCourseCreatedDomainEvent;
begin
  if Event is TCourseCreatedDomainEvent then
  begin
    ev1 := Event as TCourseCreatedDomainEvent;
    body := ev1.ToPrimitive();
    ev2 := TCourseCreatedDomainEvent.FromPrimitive(ev1.AggregateId, ev1.EventId, ev1.OccurredOn, body);
//    courseCreatedDomainEvent := TEvent<TCourseCreatedDomainEvent>.Create(Event as TCourseCreatedDomainEvent);
//    body := (Event as TCourseCreatedDomainEvent).FromPrimitive.ToPrimitive;
//    GlobalEventBus.Post(courseCreatedDomainEvent as IEvent<TCourseCreatedDomainEvent>);
    Exit;
  end;
end;

end.
