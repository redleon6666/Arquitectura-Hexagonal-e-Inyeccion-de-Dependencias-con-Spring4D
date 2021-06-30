unit AHAttribute;

interface

type

  TMyEventListener = class(TCustomAttribute)
  public
    procedure OnEvent(Event : TObject); virtual; abstract;
  end;

implementation

end.
