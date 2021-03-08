unit uIDomainEventBus;

interface

uses
  uDomainEvent, Generics.Collections;

type
  IDomainEventBus = interface
  ['{106DDBDE-8949-4CD0-855F-9C42F915411C}']
    procedure Publish(Events: TList<TDomainEvent>);
  end;

implementation

end.
