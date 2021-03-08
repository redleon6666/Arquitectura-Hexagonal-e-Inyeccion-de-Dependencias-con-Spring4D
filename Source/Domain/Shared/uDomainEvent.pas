unit uDomainEvent;

interface

type
  TDomainEvent = class abstract
  private
    FAggregateId: String;
    FEventId: String;
    FOccurredOn: String;
  public
    constructor Create(AggregateId: String);
    property AggregateId: String read FAggregateId;
    property EventId: String read FEventId;
    property OccurredOn: String read FOccurredOn;

    function EventName: String; virtual; abstract;
    function ToPrimitive: String; virtual; abstract; //return body => HasMap
    function FromPrimitive(AggregateId, EventId, OccurredOn:String; body:String): TDomainEvent; virtual; abstract; //body => HasMap
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

end.
