unit FormTester;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    LabeledEdit_Uri: TLabeledEdit;
    LabeledEdit_Port: TLabeledEdit;
    LabeledEdit_User: TLabeledEdit;
    LabeledEdit_Password: TLabeledEdit;
    Button_Save: TButton;
    Button_Refresh: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button_RefreshClick(Sender: TObject);
    procedure Button_SaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadProxy;
    procedure SaveProxy;
    procedure ValidateValues;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ProxyGetter, ProxySetter, ProxyDTO, ProxyRepository,
  Spring.Container, Spring;

{$R *.dfm}

procedure TForm1.Button_RefreshClick(Sender: TObject);
begin
  self.LoadProxy;
end;

procedure TForm1.Button_SaveClick(Sender: TObject);
begin
  self.SaveProxy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.LoadProxy;
end;

procedure TForm1.LoadProxy;
var
  proxyGetter:TProxyGetter;
  proxyDTO:TProxyDTO;
begin
  proxyGetter:=TProxyGetter.Create(GlobalContainer.Resolve<IProxyRepository>);
  proxyDTO:=proxyGetter.Invoke;
  proxyGetter.Free;

  self.LabeledEdit_Uri.Text:=proxyDTO.Uri;
  self.LabeledEdit_Port.Text:=proxyDTO.Port.ToString;
  self.LabeledEdit_User.Text:=proxyDTO.User;
  self.LabeledEdit_Password.Text:=proxyDTO.Password;
  proxyDTO.Free;
end;

procedure TForm1.SaveProxy;
var
  proxyDTO:TProxyDTO;
  proxySetter:TProxySetter;
begin
  Self.ValidateValues;
  proxyDTO:=TProxyDTO.Create(
    self.LabeledEdit_Uri.Text,
    StrToInt(self.LabeledEdit_Port.Text),
    self.LabeledEdit_User.Text,
    self.LabeledEdit_Password.Text);
  proxySetter:=TProxySetter.Create(GlobalContainer.Resolve<IProxyRepository>);
  proxySetter.Invoke(proxyDTO);
  proxySetter.Free;
  proxyDTO.Free;
end;

procedure TForm1.ValidateValues;
var
  port:Integer;
begin
  if TryStrToInt(self.LabeledEdit_Port.Text,port) = false then
    raise Exception.Create('El valor introducido en el puerto es incorrecto');
end;

end.
