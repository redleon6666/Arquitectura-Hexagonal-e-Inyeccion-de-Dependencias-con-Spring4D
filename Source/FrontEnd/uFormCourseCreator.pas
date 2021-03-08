unit uFormCourseCreator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, EventBus, uEvent, uCourseCreatedDomainEvent;

type
  TFormCourseCreator = class(TForm)
    LabeledEdit_Id: TLabeledEdit;
    LabeledEdit_Name: TLabeledEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    [Subscribe]
    procedure OnCourseCreatedDomainEvent(AEvent: IEvent<TCourseCreatedDomainEvent>);
  end;

var
  FormCourseCreator: TFormCourseCreator;

implementation

uses
  Spring.Container, uCourseCreator;

{$R *.dfm}

procedure TFormCourseCreator.Button1Click(Sender: TObject);
var
  creator: TCourseCreator;
begin
  GlobalEventBus.RegisterSubscriberForEvents(Self);

  creator:= GlobalContainer.Resolve<TCourseCreator>;
  creator.Invoke(StrToInt(Self.LabeledEdit_Id.Text), Self.LabeledEdit_Name.Text);
  creator.Free;
end;

procedure TFormCourseCreator.OnCourseCreatedDomainEvent(AEvent: IEvent<TCourseCreatedDomainEvent>);
begin
  showMessage('Course Created:' + AEvent.Event.AggregateId);
end;


end.
