unit MyClassIObj;

interface
uses
  LN.IObj, System.Classes, System.SysUtils;

type
  TMyclass = class
  private
    flst: TStringList; filst: IObj;
  public
    constructor Create;
    procedure execute;
  end;
implementation

constructor TMyclass.Create;
begin
  flst := TStringList.Create; filst := TObj.Create(flst);
end;

procedure TMyclass.execute;
begin
  // some logic
  flst.Add('hello world');
end;

end.
