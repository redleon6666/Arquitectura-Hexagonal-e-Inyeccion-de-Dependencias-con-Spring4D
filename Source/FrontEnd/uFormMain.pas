unit uFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    Button_ConfigurateProxy: TButton;
    Button_CreateCourse: TButton;
    procedure Button_ConfigurateProxyClick(Sender: TObject);
    procedure Button_CreateCourseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses uFormProxy, uFormCourseCreator;

procedure TFormMain.Button_ConfigurateProxyClick(Sender: TObject);
begin
  FormProxy.show;
end;

procedure TFormMain.Button_CreateCourseClick(Sender: TObject);
begin
  FormCourseCreator.Show;
end;

end.
