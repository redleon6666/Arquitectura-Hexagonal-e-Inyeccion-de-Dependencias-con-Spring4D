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
  EventBus, uEvent, uCourseCreatedDomainEvent, Rtti, System.StrUtils,
  System.Classes, AHAttribute, Dialogs, IncrementCoursesCounterOnCourseCreated,
  Spring.Container;

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

//procedure TInMemoryDomainEventBus.Publish(Event: TDomainEvent);
//var
//  courseCreatedDomainEvent, test2:TEvent<TCourseCreatedDomainEvent>;
//  body: TDictionary<string,TValue>;
//  ev1, ev2: TCourseCreatedDomainEvent;
//
//  LContext: TRttiContext;
//  LField: TRttiField;
//
//  function FindEventListener(const EventClass: TClass): TClass;
//  var
//    ctx: TRttiContext;
//    typ: TRttiType;
//    list: TArray<TRttiType>;
//    a : TCustomAttribute;
//    m: TRttiMethod;
//    p: TRttiParameter;
//    listener: TValue;
//  begin
//    l:= TStringLIst.Create;
//    ctx := TRttiContext.Create;
//    list := ctx.GetTypes();
//    for typ in list do
//    begin
//      for a in typ.GetAttributes do
//      begin
//        if a is TDisplayLabelAttribute then
//        begin
//          for m in typ.GetMethods do
//          begin
//            if m.Name = 'OnEvent' then
//            begin
//              for p in m.GetParameters do
//              begin
//                if (p.ClassType = EventClass) then
//                begin
//                  listener := GlobalContainer.Resolve(typ.Handle);
//                  m.Invoke(listener, )
//                end;
//              end;
//            end;
//          end;
//
//
//        end;
//
//      end;
//      typ.GetMethods
//    end;
////     for a in p.GetAttributes do
////       if a is TLoggableProperty then begin
////         Value := p.GetValue(LoggableClass);
////         // log to db..
////         AddLogEntry(p.Name, TLoggableProperty(a).Description, Value.ToString);
////       end;
//// finally
////   c.Free;
//// end;
////
////
////      if typ.IsInstance and (EndsText(Name, typ.Name)) then
////        begin
////          Result := typ.AsInstance.MetaClassType;
////          break;
////        end;
////    end;
//    ctx.Free;
//  end;
//
//begin
//  FindEventListener(event.ClassType);
//
//  if Event is TCourseCreatedDomainEvent then
//  begin
//    ev1 := Event as TCourseCreatedDomainEvent;
//    body := ev1.ToPrimitive();
//    ev2 := TCourseCreatedDomainEvent.FromPrimitive(ev1.AggregateId, ev1.EventId, ev1.OccurredOn, body);
////    courseCreatedDomainEvent := TEvent<TCourseCreatedDomainEvent>.Create(Event as TCourseCreatedDomainEvent);
////    body := (Event as TCourseCreatedDomainEvent).FromPrimitive.ToPrimitive;
////    GlobalEventBus.Post(courseCreatedDomainEvent as IEvent<TCourseCreatedDomainEvent>);
//    Exit;
//  end;
//end;


procedure TInMemoryDomainEventBus.Publish(Event: TDomainEvent);
var
  ctx: TRttiContext;
  typ: TRttiType;
  types: TArray<TRttiType>;
  a : TCustomAttribute;
  m: TRttiMethod;
  p: TRttiParameter;
  listener: TValue;
  parameters: Array of TValue;
begin
  SetLength(parameters, 1);
  parameters[0] := Event;

  ctx := TRttiContext.Create;
  types := ctx.GetTypes(); //Todas las clases del proyecto

  for typ in types do
  begin
    for a in typ.GetAttributes do //Atributos customizados
    begin
      if a is TMyEventListener then
      begin
        for m in typ.GetMethods do
        begin
          if m.Name = 'OnEvent' then // ¿?¿?¿?
          begin
            for p in m.GetParameters do
            begin
              if (p.ParamType.ToString = event.ClassName) then
              begin
                listener := GlobalContainer.Resolve(typ.Handle); //Injector de dependencias
                m.Invoke(listener, parameters);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  ctx.Free;
end;

end.
