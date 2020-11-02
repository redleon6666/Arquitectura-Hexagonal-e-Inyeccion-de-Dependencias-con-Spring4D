unit uFromIniFileProxyRepository;

interface

uses
  uIProxyRepository, uProxy;

type
  TFromIniFileProxyRepository = class(TInterfacedObject, IProxyRepository)
  private
    FFileName: String;
    FCachedProxy: TProxy;
  public
    constructor Create(FileName: String);
    destructor Destroy; override;
    function Getter: TProxy;
    procedure Setter(const Proxy: TProxy);
  end;

implementation

uses
  IniFiles, SysUtils, Spring, Dialogs;

{ TFromIniFileProxyRepository }

constructor TFromIniFileProxyRepository.Create(FileName: String);
begin
  Self.FFileName := FileName;
  Self.FCachedProxy := nil;
  ShowMessage('TFromIniFileProxyRepository.Create(' + FileName + ')');
end;

destructor TFromIniFileProxyRepository.Destroy;
begin
  inherited;
  ShowMessage('TFromIniFileProxyRepository.Destroy');
end;

function TFromIniFileProxyRepository.Getter: TProxy;
var
  iniFile: TIniFile;
begin
  if (Self.FCachedProxy = nil) then
  begin
    iniFile := TIniFile.Create(Self.FFileName);
    Self.FCachedProxy := TProxy.Create(iniFile.ReadString('Section1', 'Value1',
      ''), iniFile.ReadString('Section1', 'Value2', '0').ToInteger,
      iniFile.ReadString('Section1', 'Value3', ''),
      iniFile.ReadString('Section1', 'Value4', ''));
    iniFile.Free;
  end;
  Result := Self.FCachedProxy;
end;

procedure TFromIniFileProxyRepository.Setter(const Proxy: TProxy);
var
  iniFile: TIniFile;
begin
  Guard.CheckNotNull(Proxy, 'Value in TFromIniFileProxyRepository.Setter');
  iniFile := TIniFile.Create(Self.FFileName);
  iniFile.WriteString('Section1', 'Value1', Proxy.Uri);
  iniFile.WriteString('Section1', 'Value2', Proxy.Port.ToString);
  iniFile.WriteString('Section1', 'Value3', Proxy.User);
  iniFile.WriteString('Section1', 'Value4', Proxy.Password);
  iniFile.Free;
  Self.FCachedProxy := Proxy;
end;

end.
