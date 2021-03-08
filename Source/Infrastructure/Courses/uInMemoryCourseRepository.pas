unit uInMemoryCourseRepository;

interface

uses
  uICourseREpository, uCourse, Generics.Collections;

type
  TInMemoryCourseRepository = class (TInterfacedObject, ICourseRepository)
  private
    FCourses: TList<TCourse>;
  public
    constructor Create();
    procedure Save(Course: TCourse);
  end;

implementation

{ TInMemoryCourseRepository }

constructor TInMemoryCourseRepository.Create;
begin
  Self.FCourses := TList<TCourse>.Create();
end;

procedure TInMemoryCourseRepository.Save(Course: TCourse);
begin
  Self.FCourses.Add(Course);
end;

end.
