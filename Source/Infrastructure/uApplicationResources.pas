unit uApplicationResources;

interface

type
  TApplicationResources = class
  private
    FIniFileConfiguration: String;
    procedure SetIniFileConfiguration(const Value: String);
  public
    property IniFileConfiguration : String read FIniFileConfiguration write SetIniFileConfiguration;
  end;

implementation

{ TApplicationResources }

procedure TApplicationResources.SetIniFileConfiguration(const Value: String);
begin
  FIniFileConfiguration := Value;
end;

end.
