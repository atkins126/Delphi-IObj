unit LocalVars;

interface
uses
  LN.IObj, System.Classes, System.SysUtils;

type
  TLocalVars = class
  public
    class procedure executeLeaked;
    class procedure executeStandard;
    class procedure executeIObj;
  end;


  TLoopVars = class
  public
    class procedure executeLeaked;
    class procedure executeStandard;
    class procedure executeIObj;
  end;

implementation

{ TLocalVars }

//LocalVarsLeaked-begin
class procedure TLocalVars.executeLeaked;
var
  lst : TStringList;
begin
  lst := TStringList.Create;
  // some logic
  lst.Add('hello world');
end;
//LocalVarsLeaked-end

//LocalVarsStandard-begin
class procedure TLocalVars.executeStandard;
var
  lst : TStringList;
begin
  lst := TStringList.Create;
  try
    // some logic
    lst.Add('hello world');
  finally
    lst.free;
  end;
end;
//LocalVarsStandard-end

//LocalVarsIObj-begin
class procedure TLocalVars.executeIObj;
var
  lst : TStringList; ilst : IObj;
begin
  lst := TStringList.Create; ilst := TObj.Create(lst);
  // some logic
  lst.Add('hello world');
end;
//LocalVarsIObj-end


{ TLoopVars }

//LoopVarsIObj-begin
class procedure TLoopVars.executeIObj;
const
  n = 10;
var
  lst : TStringList; ilst : IObj;
  i : Integer;
begin
  for i := 0 to n-1 do
  begin
    lst := TStringList.Create; ilst := TObj.Create(lst);
    // some logic
    lst.Add('hello world');
  end;
end;
//LoopVarsIObj-end

//LoopVarsLeaked-begin
class procedure TLoopVars.executeLeaked;
const
  n = 10;
var
  lst : TStringList;
  i : Integer;
begin
  for i := 0 to n-1 do
  begin
    lst := TStringList.Create;
    // some logic
    lst.Add('hello world');
  end;
end;
//LoopVarsLeaked-end

//LoopVarsStandard-begin
class procedure TLoopVars.executeStandard;
const
  n = 10;
var
  lst : TStringList;
  i : Integer;
begin
  for i := 0 to n-1 do
  begin
    lst := TStringList.Create;
    try
      // some logic
      lst.Add('hello world');
    finally
      lst.Free;
    end;
  end;
end;
//LoopVarsStandard-end

end.
