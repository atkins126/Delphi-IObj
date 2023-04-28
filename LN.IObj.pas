unit LN.IObj;

interface

uses
  System.Classes, System.SysUtils, Generics.Collections;

type
  {
    // declare and instantiate variable of type TMyObject
    var myObj := TObj.CreateInstance(TMyObject.Create..);

    // myObj.Obj refers to the created TMyObject
    myObj.Obj
  }

  {$IF CompilerVersion >= 20}
  IObj<T> = Interface(IInterface)
    ['{C71075DF-1BCE-4A7E-935B-643DE4C785D6}']
    function GetObj: T;
    property Obj: T read GetObj;
  end;

  TObj<T: class> = class(TInterfacedObject, IObj<T>)
  private
    FObj : T;
    function GetObj: T;
  public
    constructor Create(Obj: T); reintroduce;
    destructor Destroy; override;
  end;
  {$ENDIF}

  IObj = Interface(IInterface)
  ['{E60D7897-F083-411B-990D-C87523A80E41}']
    function GetObj : TObject;
    property Obj: TObject read GetObj;
  End;

  TObj = class(TInterfacedObject, IObj)
  private
    FObj : TObject;
    function GetObj : TObject;
  public
    property Obj : TObject read GetObj;
    constructor Create(Obj : TObject); reintroduce;
    destructor Destroy; override;

    {$IF CompilerVersion >= 20}
    class function CreateInstance<T:class>(Obj: T) : IObj<T>;
    class function CreateList<T:class>: IObj<TList<T>>;
    class function CreateIList<T:class>: IObj<TList<IObj<T>>>;

    class function ToList<T:class>(src: TList<IObj<T>>) : IObj<TList<T>>; overload;
    class function ToList<T:class>(src: array of T) : IObj<TList<T>>; overload;
    class function ToIList<T:class>(src: TList<T>) : IObj<TList<IObj<T>>>;
    {$ENDIF}
  end;

implementation

constructor TObj<T>.Create(Obj: T);
begin
  inherited Create;

  FObj := Obj;
end;

destructor TObj<T>.Destroy;
begin
  FObj.free;
  inherited;
end;

function TObj<T>.GetObj: T;
begin
  Result := FObj;
end;

{ TObj }

function TObj.GetObj: TObject;
begin
  result := FObj;
end;

constructor TObj.Create(Obj: TObject);
begin
  inherited Create;

  FObj := Obj;
end;

destructor TObj.Destroy;
begin
  FObj.free;
  inherited;
end;


{$IF CompilerVersion >= 20}
class function TObj.CreateInstance<T>(Obj: T): IObj<T>;
begin
  result := TObj<T>.Create(Obj);
end;

class function TObj.ToList<T>(src: TList<IObj<T>>): IObj<TList<T>>;
var
  item : IObj<T>;
begin
  result := TObj.CreateList<T>;

  for item in src do
    result.Obj.Add(item.Obj);
end;

class function TObj.ToList<T>(src: array of T): IObj<TList<T>>;
var
  item : T;
begin
  result := TObj.CreateList<T>;

  for item in src do
    result.Obj.Add(item);
end;

class function TObj.ToIList<T>(src: TList<T>): IObj<TList<IObj<T>>>;
var
  item : T;
begin
  result := TObj.CreateIList<T>;

  for item in src do
    result.Obj.Add(TObj.CreateInstance(item));
end;

class function TObj.CreateIList<T>: IObj<TList<IObj<T>>>;
begin
  result := TObj<TList<IObj<T>>>.Create(TList<IObj<T>>.Create);
end;

class function TObj.CreateList<T>: IObj<TList<T>>;
begin
  result := TObj<TList<T>>.Create(TList<T>.Create);
end;

{$IFEND}
end.
