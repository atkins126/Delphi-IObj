unit MyClassLeaked;

interface
uses
  System.Classes, System.SysUtils;

type
  TMyclass = class
  private
    flst: TStringList;
  public
    constructor Create;
    procedure execute;
  end;
implementation

constructor TMyclass.Create;
begin
  flst := TStringList.Create;
end;

procedure TMyclass.execute;
begin
  // some logic
  flst.Add('hello world');
end;

end.
