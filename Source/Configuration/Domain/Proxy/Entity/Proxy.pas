unit Proxy;

interface

type
  TProxy = class
  private
    FPort: Integer;
    FPassword: String;
    FUri: String;
    FUser: String;
  public
    constructor Create(Uri: String; Port: Integer; User: String;
      Password: String);
    property Uri: String read FUri;
    property Port: Integer read FPort;
    property User: String read FUser;
    property Password: String read FPassword;
  end;

implementation

{ TProxy }

constructor TProxy.Create(Uri: String; Port: Integer; User, Password: String);
begin
  self.FUri := Uri;
  self.FPort := Port;
  self.FUser := User;
  self.FPassword := Password;
end;

end.
