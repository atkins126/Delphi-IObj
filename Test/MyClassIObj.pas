unit MyClassIObj;

interface
uses
  LN.IObj, System.Classes, System.SysUtils;

type
  TMyclass = class
  private
    flst: IObj<TStringList>;
  public
    constructor Create;
    procedure execute;
  end;
implementation

constructor TMyclass.Create;
begin
  flst := TObj.CreateInstance(TStringList.Create);
end;

procedure TMyclass.execute;
begin
  // some logic
  flst.Obj.Add('hello world');
end;

end.
