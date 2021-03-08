unit uICourseRepository;

interface

uses
  uCourse;

type
  ICourseRepository = interface
    ['{1770B70E-6547-4100-A874-2524925E4363}']
    procedure Save(Course: TCourse);
  end;

implementation

end.
