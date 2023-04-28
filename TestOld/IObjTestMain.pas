unit IObjTestMain;

interface

uses
  LN.IObj, System.Types,
  LocalVars, 
  MyClassLeaked, MyClassStandard, MyClassIObj,
  ObjectAsPropertyLeaked, ObjectAsPropertyStandard, ObjectAsPropertyIObj,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, 
  Vcl.ComCtrls, Vcl.WinXPanels;

type
  TfrmIObjTestMain = class(TForm)
    FlowPanel1: TFlowPanel;
    btnHome: TButton;
    CardPanel1: TCardPanel;
    CardCode: TCard;
    CardIObj: TCard;
    memoIObj: TMemo;
    pgCode: TPageControl;
    tbCodeLeaked: TTabSheet;
    memoLeaked: TMemo;
    btnLeaked: TButton;
    tbCodeStandard: TTabSheet;
    memoStandardFix: TMemo;
    btnStandardFix: TButton;
    tbCodeIObj: TTabSheet;
    btnIObjFix: TButton;
    memoIObjFix: TMemo;
    CardHome: TCard;
    btnIObj: TButton;
    btnLocalVariables: TButton;
    btnMyClass: TButton;
    btnLoopVariables: TButton;
    btnObjectAsProperty: TButton;
    cbLeaked: TCheckBox;
    cbStandardFix: TCheckBox;
    cbIObjFix: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbLineNumbers: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnLocalVariablesClick(Sender: TObject);
    procedure btnMyClassClick(Sender: TObject);
    procedure btnIObjClick(Sender: TObject);
    procedure btnLoopVariablesClick(Sender: TObject);
    procedure btnObjectAsPropertyClick(Sender: TObject);
    procedure cbLineNumbersClick(Sender: TObject);
  private
    function getFile(const resourceName: string): string;
    function getCode(src: TStrings; const tag: string): string;
    procedure showCode(const leaked, standard, iobj : string);
    procedure showLineNumbers(memos : Array of TStrings);
    procedure removeLineNumbers(memos : Array of TStrings);

    procedure btnLocalVarsLeakedClick(Sender: TObject);
    procedure btnLocalVarsStandardClick(Sender: TObject);
    procedure btnLocalVarsIObjClick(Sender: TObject);

    procedure btnMyClassLeakedClick(Sender: TObject);
    procedure btnMyClassStandardClick(Sender: TObject);
    procedure btnMyClassIObjClick(Sender: TObject);

    procedure btnLoopVarsLeakedClick(Sender: TObject);
    procedure btnLoopVarsStandardClick(Sender: TObject);
    procedure btnLoopVarsIObjClick(Sender: TObject);

    procedure btnObjectAsPropertyLeakedClick(Sender: TObject);
    procedure btnObjectAsPropertyStandardClick(Sender: TObject);
    procedure btnObjectAsPropertyIObjClick(Sender: TObject);

    procedure loadLocalVars;
    procedure loadMyClass;
    procedure loadLoopVars;
    procedure loadObjectAsProperty;
    procedure loadIObj;
  public
  end;

var
  frmIObjTestMain: TfrmIObjTestMain;

implementation

{$R *.dfm}

{ TfrmIObjTestMain }

procedure TfrmIObjTestMain.btnHomeClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := cardHome;
end;

// LocalVars
procedure TfrmIObjTestMain.btnLocalVarsIObjClick(Sender: TObject);
begin
  try
    TLocalVars.executeIObj;
  finally
    cbIObjFix.Checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnLocalVarsLeakedClick(Sender: TObject);
begin
  try
    TLocalVars.executeLeaked;
  finally
    cbLeaked.Checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnLocalVarsStandardClick(Sender: TObject);
begin
  try
    TLocalVars.executeStandard;
  finally
    cbStandardFix.Checked := true;
  end;
end;

// MyClass
procedure TfrmIObjTestMain.btnMyClassClick(Sender: TObject);
begin
  loadMyClass;
  CardPanel1.ActiveCard := cardCode;
end;

procedure TfrmIObjTestMain.btnMyClassIObjClick(Sender: TObject);
var
  myClass : IObj;
begin
  try
    myClass := TObj.Create(MyClassIObj.TMyclass.Create);
    TMyClass(myClass.Obj).execute;
  finally
    cbIObjFix.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnMyClassLeakedClick(Sender: TObject);
var
  myClass : IObj;
begin
  try
    myClass := TObj.Create(MyClassLeaked.TMyclass.Create);
    TMyClass(myClass.Obj).execute;
  finally
    cbLeaked.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnMyClassStandardClick(Sender: TObject);
var
  myClass : IObj;
begin
  try
    myClass := TObj.Create(MyClassStandard.TMyclass.Create);
    TMyClass(myClass.Obj).execute;
  finally
    cbStandardFix.checked := true;
  end;
end;

// LoopVariables
procedure TfrmIObjTestMain.btnLoopVariablesClick(Sender: TObject);
begin
  loadLoopVars;
  CardPanel1.ActiveCard := cardCode;
end;


procedure TfrmIObjTestMain.btnLoopVarsIObjClick(Sender: TObject);
begin
  try
    TLoopVars.executeIObj;
  finally
    cbIObjFix.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnLoopVarsLeakedClick(Sender: TObject);
begin
  try
    TLoopVars.executeLeaked;
  finally
    cbLeaked.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnLoopVarsStandardClick(Sender: TObject);
begin
  try
    TLoopVars.executeStandard;
  finally
    cbStandardFix.checked := true;
  end;
end;

// ObjectAsProperty
procedure TfrmIObjTestMain.btnObjectAsPropertyClick(Sender: TObject);
begin
  loadObjectAsProperty;
  CardPanel1.ActiveCard := cardCode;
end;

procedure TfrmIObjTestMain.btnObjectAsPropertyIObjClick(Sender: TObject);
begin
  try
    ObjectAsPropertyIObj.THouse.execute;
  finally
    cbIObjFix.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnObjectAsPropertyLeakedClick(Sender: TObject);
begin
  try
    ObjectAsPropertyLeaked.THouse.execute;
  finally
    cbLeaked.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnObjectAsPropertyStandardClick(Sender: TObject);
begin
  try
    ObjectAsPropertyStandard.THouse.execute;
  finally
    cbStandardFix.checked := true;
  end;
end;


procedure TfrmIObjTestMain.cbLineNumbersClick(Sender: TObject);
begin
  if cbLineNumbers.Checked then
    ShowLineNumbers([memoIObj.Lines, memoLeaked.Lines, memoStandardFix.Lines, memoIObjFix.Lines])
  else
    RemoveLineNumbers([memoIObj.Lines, memoLeaked.Lines, memoStandardFix.Lines, memoIObjFix.Lines]);
end;

procedure TfrmIObjTestMain.btnIObjClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := cardIObj;
end;

procedure TfrmIObjTestMain.btnLocalVariablesClick(Sender: TObject);
begin
  loadLocalVars;
  CardPanel1.ActiveCard := cardCode;

end;

procedure TfrmIObjTestMain.FormCreate(Sender: TObject);
begin
  CardPanel1.ActiveCard := cardHome;
  pgCode.ActivePageIndex := 0;
  loadIObj;
end;

function TfrmIObjTestMain.getCode(src: TStrings; const tag: string): string;
var
  lst : TStringList; ilst : IObj;
  tagBegin, tagEnd : Integer;
  i : Integer;
begin
  lst := TStringList.Create; ilst := TObj.Create(lst);

  tagBegin := src.IndexOf(format('//%s-begin', [tag]));
  tagEnd := src.IndexOf(format('//%s-end', [tag]));

  if (tagBegin > 0) and (tagEnd > tagBegin) then
  begin
    for i := tagBegin + 1 to tagEnd - 1 do
      lst.add(src[i]);
  end;

  result := lst.Text;
end;

function TfrmIObjTestMain.getFile(const resourceName: string): string;
var
  ss : TStringStream; iss : IObj;
  rs : TResourceStream; irs : IObj;
begin
  ss := TStringStream.Create; iss := TObj.Create(ss);
  rs := TResourceStream.Create(hInstance, resourceName, RT_RCDATA); irs := TObj.Create(rs);
  ss.LoadFromStream(rs);
  result := ss.DataString;
end;


procedure TfrmIObjTestMain.loadIObj;
begin
  memoIObj.Lines.Text := getFile('IObj');
end;

procedure TfrmIObjTestMain.loadLocalVars;
var
  lst : TStringList; ilst : IObj;
begin
  lst := TStringList.Create; ilst := TObj.Create(lst);
  lst.Text := getFile('LocalVars');

  showCode(
      getCode(lst, 'LocalVarsLeaked'),
      getCode(lst, 'LocalVarsStandard'),
      getCode(lst, 'LocalVarsIObj')
  );

  btnLeaked.OnClick := btnLocalVarsLeakedClick;
  btnStandardFix.OnClick := btnLocalVarsStandardClick;
  btnIObjFix.OnClick := btnLocalVarsIObjClick;
end;

procedure TfrmIObjTestMain.loadLoopVars;
var
  lst : TStringList; ilst : IObj;
begin
  lst := TStringList.Create; ilst := TObj.Create(lst);
  lst.Text := getFile('LocalVars');

  showCode(
      getCode(lst, 'LoopVarsLeaked'),
      getCode(lst, 'LoopVarsStandard'),
      getCode(lst, 'LoopVarsIObj')
  );

  btnLeaked.OnClick := btnLoopVarsLeakedClick;
  btnStandardFix.OnClick := btnLoopVarsStandardClick;
  btnIObjFix.OnClick := btnLoopVarsIObjClick;
end;

procedure TfrmIObjTestMain.loadMyClass;
begin
  showCode(
      getFile('MyClassLeaked'),
      getFile('MyClassStandard'),
      getFile('MyClassIObj')
  );

  btnLeaked.OnClick := btnMyClassLeakedClick;
  btnStandardFix.OnClick := btnMyClassStandardClick;
  btnIObjFix.OnClick := btnMyClassIObjClick;
end;

procedure TfrmIObjTestMain.loadObjectAsProperty;
begin
  showCode(
      getFile('ObjectAsPropertyLeaked'),
      getFile('ObjectAsPropertyStandard'),
      getFile('ObjectAsPropertyIObj')
  );

  btnLeaked.OnClick := btnObjectAsPropertyLeakedClick;
  btnStandardFix.OnClick := btnObjectAsPropertyStandardClick;
  btnIObjFix.OnClick := btnObjectAsPropertyIObjClick;
end;

procedure TfrmIObjTestMain.removeLineNumbers(memos: array of TStrings);
var
  memo : TStrings;
  i : Integer;
begin
  self.LockDrawing;
  try
    for memo in memos do
    begin
      for i := 0 to memo.Count - 1 do
        memo[i] := StringReplace(memo[i], intToStr(i+1) + #9, '', []);
    end;
  finally
    self.UnlockDrawing;
  end;
end;

procedure TfrmIObjTestMain.showCode(const leaked, standard, iobj: string);
begin
  memoLeaked.Lines.Text := leaked;
  memoStandardFix.Lines.Text := standard;
  memoIObjFix.Lines.Text := iobj;

  if cbLineNumbers.Checked then
    ShowLineNumbers([memoLeaked.Lines, memoStandardFix.Lines, memoIObjFix.Lines]);
end;

procedure TfrmIObjTestMain.showLineNumbers(memos: array of TStrings);
var
  memo : TStrings;
  i : Integer;
begin
  self.LockDrawing;
  try
    for memo in memos do
    begin
      for i := 0 to memo.Count - 1 do
        memo[i] := format('%d'#9'%s', [i+1, memo[i]]);
    end;

  finally
    self.UnlockDrawing;
  end;
end;

end.
