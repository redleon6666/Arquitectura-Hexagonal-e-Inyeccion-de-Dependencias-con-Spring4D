unit uFormProxy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormProxy = class(TForm)
    LabeledEdit_Uri: TLabeledEdit;
    LabeledEdit_Port: TLabeledEdit;
    LabeledEdit_User: TLabeledEdit;
    LabeledEdit_Password: TLabeledEdit;
    Button_Save: TButton;
    Button_Load: TButton;
    procedure Button_LoadClick(Sender: TObject);
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
  FormProxy: TFormProxy;

implementation

uses
  uIProxyGetter, uProxySetter, uProxyDTO, uIProxyRepository,
  Spring.Container, Spring;

{$R *.dfm}

procedure TFormProxy.Button_LoadClick(Sender: TObject);
begin
  self.LoadProxy;
end;

procedure TFormProxy.Button_SaveClick(Sender: TObject);
begin
  self.SaveProxy;
end;

procedure TFormProxy.LoadProxy;
var
  proxyDTO:TProxyDTO;
begin
  proxyDTO:=GlobalContainer.Resolve<IProxyGetter>.Invoke;

  self.LabeledEdit_Uri.Text:=proxyDTO.Uri;
  self.LabeledEdit_Port.Text:=proxyDTO.Port.ToString;
  self.LabeledEdit_User.Text:=proxyDTO.User;
  self.LabeledEdit_Password.Text:=proxyDTO.Password;
  proxyDTO.Free;
end;

procedure TFormProxy.SaveProxy;
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

procedure TFormProxy.ValidateValues;
var
  port:Integer;
begin
  if TryStrToInt(self.LabeledEdit_Port.Text,port) = false then
    raise Exception.Create('El valor introducido en el puerto es incorrecto');
end;

end.
