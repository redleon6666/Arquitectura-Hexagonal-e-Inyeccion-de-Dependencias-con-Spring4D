unit FromIniFileProxyRepository;

interface

uses
  ProxyRepository, Proxy;

type
  TFromIniFileProxyRepository = class(TInterfacedObject, IProxyRepository)
  private
    FFileName: String;
    FCachedProxy: TProxy;
  public
    constructor Create(FileName: String);
    function Getter: TProxy;
    procedure Setter(const Proxy: TProxy);
  end;

implementation

uses
  IniFiles, SysUtils, Spring;

{ TFromIniFileProxyRepository }

constructor TFromIniFileProxyRepository.Create(FileName: String);
begin
  Self.FFileName := FileName;
  Self.FCachedProxy := nil;
end;

function TFromIniFileProxyRepository.Getter: TProxy;
var
  iniFile: TIniFile;
begin
  if (Self.FCachedProxy = nil) then
  begin
    iniFile := TIniFile.Create(Self.FFileName);
    Self.FCachedProxy := TProxy.Create(
      iniFile.ReadString('Section1', 'Value1', ''),
      iniFile.ReadString('Section1', 'Value2', '0').ToInteger,
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
  Guard.CheckNotNull(proxy,'Value in TFromIniFileProxyRepository.Setter');
  iniFile := TIniFile.Create(Self.FFileName);
  iniFile.WriteString('Section1', 'Value1', Proxy.Uri);
  iniFile.WriteString('Section1', 'Value2', Proxy.Port.ToString);
  iniFile.WriteString('Section1', 'Value3', Proxy.User);
  iniFile.WriteString('Section1', 'Value4', Proxy.Password);
  iniFile.Free;
  self.FCachedProxy:=Proxy;
end;

end.
