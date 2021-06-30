unit uCourseCreator;

interface

uses
  uICourseRepository, uIDomainEventBus;

type
  TCourseCreator = class
  private
    FRepository: ICourseRepository;
    FEventBus: IDomainEventBus;
  public
    constructor Create(Repository: ICourseRepository; EventBus: IDomainEventBus);
    procedure Invoke(Id: Integer; Name: String; Duration: TDateTime);
  end;

implementation

uses
  uCourse;

{ TCourseCreator }

constructor TCourseCreator.Create(Repository: ICourseRepository; EventBus: IDomainEventBus);
begin
  Self.FRepository := Repository;
  Self.FEventBus := EventBus;
end;

procedure TCourseCreator.Invoke(Id: Integer; Name: String; Duration: TDateTime);
var
  course: TCourse;
begin
  course := TCourse.Create(Id, Name, Duration);
  Self.FRepository.Save(course);
  Self.FEventBus.Publish(course.PullDomainEvents);
end;

end.
