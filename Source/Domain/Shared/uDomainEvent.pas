unit uDomainEvent;

interface

uses
  Generics.Collections, Rtti;

type
  TDomainEvent = class abstract
  private
    FAggregateId: String;
    FEventId: String;
    FOccurredOn: String;
  protected
    constructor Create(AggregateId: String; EventId: String; OccurredOn: String); overload;
  public
    constructor Create(AggregateId: String); overload;
    constructor FromPrimitive(AggregateId, EventId, OccurredOn:String; body:TDictionary<string,TValue>); overload; virtual; abstract; //body => HasMap
    property AggregateId: String read FAggregateId;
    property EventId: String read FEventId;
    property OccurredOn: String read FOccurredOn;

    function EventName: String; virtual; abstract;

    function ToPrimitive: TDictionary<string,TValue>; virtual; abstract;

  end;

implementation

uses
  SysUtils;

{ TDomainEvent }

constructor TDomainEvent.Create(AggregateId: String);
var
  newGUID: TGUID;
begin
  Self.FAggregateId := AggregateId;
  SysUtils.CreateGUID(newGUID);
  Self.FEventId := GUIDToString(newGUID);
  Self.FOccurredOn := FormatDateTime('YYYY-MM-DD hh:mm:ss:zzz', Now);
end;

constructor TDomainEvent.Create(AggregateId, EventId, OccurredOn: String);
begin
  Self.FAggregateId := AggregateId;
  Self.FEventId := EventId;
  Self.FOccurredOn := OccurredOn;
end;

end.
