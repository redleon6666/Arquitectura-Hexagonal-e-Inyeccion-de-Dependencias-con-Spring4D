unit uCourseCreatedDomainEvent;

interface

uses
  uDomainEvent, Generics.Collections, Rtti;

type
  TCourseCreatedDomainEvent = class (TDomainEvent)
  private
    FName: String;
    FDuration: TDateTime;
  public
    constructor Create(AggregateId: String; Name:String; Duration: TDateTime); overload;
    constructor FromPrimitive(AggregateId, EventId, OccurredOn:String; body:TDictionary<string,TValue>); overload; override; //body => HasMap

    function EventName: String; override;
    function ToPrimitive: TDictionary<string,TValue>;  override;//return body => HasMap
  end;

implementation

uses
  SysUtils;

{ TCourseCreatedDomainEvent }

constructor TCourseCreatedDomainEvent.Create(AggregateId, Name: String; Duration: TDateTime);
begin
  inherited Create(AggregateId);
  Self.FName := Name;
  Self.FDuration := Duration;
end;

constructor TCourseCreatedDomainEvent.FromPrimitive(AggregateId: String; EventId: String; OccurredOn: String; Body: TDictionary<string,TValue>);
var
  LType: TRttiType;
  LContext: TRttiContext;
  key: String;
begin
  inherited Create(AggregateId, EventId, OccurredOn);
  LContext := TRttiContext.Create;
  LType := LContext.GetType(TCourseCreatedDomainEvent);
  for key in Body.Keys do
    LType.GetField(key).SetValue(Self, Body.Items[key]);
  LContext.Free;
end;

function TCourseCreatedDomainEvent.EventName: String;
begin
  Result := 'course.created';
end;

function TCourseCreatedDomainEvent.ToPrimitive: TDictionary<string,TValue>;
var
  LType: TRttiType;
  LContext: TRttiContext;
  LField: TRttiField;
  fieldName: string;
begin
  Result := TDictionary<string,TValue>.Create();
  LContext := TRttiContext.Create;
  LType := LContext.GetType(TCourseCreatedDomainEvent);
  Result.Add('FName', LType.GetField('FName').GetValue(Self));
  Result.Add('FDuration', LType.GetField('FDuration').GetValue(Self));
  LContext.Free;
end;

end.
