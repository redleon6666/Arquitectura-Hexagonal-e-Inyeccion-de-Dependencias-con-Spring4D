unit uCourse;

interface

uses
  uAggregateRoot;

type
  TCourse = class (TAggregateRoot)
  private
    FId: Integer;
    FName: String;
    FDuration: TDateTime;
    constructor New(Id:Integer; Name:String; Duration: TDateTime); overload;
  public
    property Id: Integer read FId;
    property Name: String read FName;
    property Duration: TDateTime read FDuration;
    class function Create(Id:Integer; Name:String; Duration: TDateTime):TCourse; reintroduce;
  end;

implementation

uses
  uCourseCreatedDomainEvent, SysUtils;

{ TCourse }

constructor TCourse.New(Id: Integer; Name: String; Duration: TDateTime);
begin
  inherited Create();
  Self.FId := Id;
  Self.FName := Name;
  Self.FDuration := Duration;
end;

class function TCourse.Create(Id:Integer; Name:String; Duration: TDateTime): TCourse;
begin
  Result := Self.New(Id, Name, Duration);
  Result.RecordDomainEvent(TCourseCreatedDomainEvent.Create(Id.ToString, Name, Duration));
end;



end.
