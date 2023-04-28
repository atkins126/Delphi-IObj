unit MyClassStandard;

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
    destructor Destroy; override;
  end;
implementation

constructor TMyclass.Create;
begin
  flst := TStringList.Create;
end;

destructor TMyclass.Destroy;
begin
  flst.Free;
  inherited;
end;

procedure TMyclass.execute;
begin
  // some logic
  flst.Add('hello world');
end;

end.
