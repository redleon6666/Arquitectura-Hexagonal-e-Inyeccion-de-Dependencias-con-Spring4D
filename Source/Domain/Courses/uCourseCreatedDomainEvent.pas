unit uCourseCreatedDomainEvent;

interface

uses
  uDomainEvent;

type
  TCourseCreatedDomainEvent = class (TDomainEvent)
  private
    FName: String;
  public
    constructor Create(AggregateId: String; Name:String);

    function EventName: String;
    function ToPrimitive: String;  //return body => HasMap
    function FromPrimitive(AggregateId, EventId, OccurredOn:String; body:String): TCourseCreatedDomainEvent; //body => HasMap
  end;

implementation

uses
  SysUtils;

{ TCourseCreatedDomainEvent }

constructor TCourseCreatedDomainEvent.Create(AggregateId, Name: String);
begin
  inherited Create(AggregateId);
  Self.FName := Name;
end;

function TCourseCreatedDomainEvent.EventName: String;
begin
  Result := 'course.created';
end;

function TCourseCreatedDomainEvent.FromPrimitive(AggregateId, EventId,
  OccurredOn: String; body: String): TCourseCreatedDomainEvent;
begin
  Result := TCourseCreatedDomainEvent.Create(body,'');
  // todo: establecer resto de propiedades...
end;

function TCourseCreatedDomainEvent.ToPrimitive: String;
begin
  // HashMap().put('name', Self.FName);
  Result := Self.AggregateId;
end;

end.
