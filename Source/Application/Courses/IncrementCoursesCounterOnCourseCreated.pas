unit IncrementCoursesCounterOnCourseCreated;

interface

uses
  uCourseCreatedDomainEvent, AHAttribute, Rtti, System.Classes;

type

  [TMyEventListener]
  TIncrementCoursesCounterOnCourseCreated = class (Tpersistent)//IUnknown
  public
    procedure OnEvent(CourseCreatedDomainEvent: TCourseCreatedDomainEvent);
  end;

implementation

uses
  Dialogs;

{ TIncrementCoursesCounterOnCourseCreated }

procedure TIncrementCoursesCounterOnCourseCreated.onEvent(CourseCreatedDomainEvent: TCourseCreatedDomainEvent);
begin
  showMessage('Couse Created:' + CourseCreatedDomainEvent.AggregateId);
end;

Initialization
  RegisterClass (TIncrementCoursesCounterOnCourseCreated);
Finalization
  Unregisterclass (TIncrementCoursesCounterOnCourseCreated);

end.
