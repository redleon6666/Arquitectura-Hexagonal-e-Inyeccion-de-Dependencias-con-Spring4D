unit uEvent;

interface

type
  IEvent<T> = interface
    ['{79805D31-F3E5-4402-BCD4-9F0CF3E61F42}']
    function Event: T;
  end;

  TEvent<T> = class (TInterfacedObject, IEvent<T>)
  private
    FEvent: T;
  public
    constructor Create(Event : T);
    function Event: T;
  end;

implementation

{ TEvent<T> }

constructor TEvent<T>.Create(Event: T);
begin
  Self.FEvent := Event;
end;

function TEvent<T>.Event: T;
begin
  Result := Self.FEvent;
end;

end.
