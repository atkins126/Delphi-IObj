unit MyClass;

interface
uses
  System.Classes, System.SysUtils;

type
  TMyclassLeaked = class
  private
    flst: TStringList;
  public
    constructor Create;
  end;
implementation

constructor TMyClassLeaked.Create;
begin
  flst := TStringList.Create;
end;

end.
