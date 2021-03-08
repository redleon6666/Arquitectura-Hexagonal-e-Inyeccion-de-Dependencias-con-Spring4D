unit uCourse;

interface

uses
  uAggregateRoot;

type
  TCourse = class (TAggregateRoot)
  private
    FId: Integer;
    FName: String;
    constructor New(Id:Integer; Name:String); overload;
  public
    property Id: Integer read FId;
    property Name: String read FName;
    class function Create(Id:Integer; Name:String):TCourse; reintroduce;
  end;

implementation

uses
  uCourseCreatedDomainEvent, SysUtils;

{ TCourse }

constructor TCourse.New(Id: Integer; Name: String);
begin
  inherited Create();
  Self.FId := Id;
  Self.FName := Name;
end;

class function TCourse.Create(Id:Integer; Name:String): TCourse;
begin
  Result := Self.New(Id, Name);
  Result.RecordDomainEvent(TCourseCreatedDomainEvent.Create(Id.ToString, Name));
end;



end.
