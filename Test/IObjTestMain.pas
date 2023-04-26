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
    btnIObj: TButton;
    btnLocalVariables: TButton;
    btnMyClass: TButton;
    btnLoopVariables: TButton;
    btnObjectAsProperty: TButton;
    cbLeaked: TCheckBox;
    cbStandardFix: TCheckBox;
    cbIObjFix: TCheckBox;
    PageControl1: TPageControl;
    tsHome: TTabSheet;
    tsIObj: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tsCode: TTabSheet;
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
    procedure FormCreate(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnLocalVariablesClick(Sender: TObject);
    procedure btnMyClassClick(Sender: TObject);
    procedure btnIObjClick(Sender: TObject);
    procedure btnLoopVariablesClick(Sender: TObject);
    procedure btnObjectAsPropertyClick(Sender: TObject);
  private
    function getFile(const resourceName: string): string;
    function getCode(src: TStrings; const tag: string): string;

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
  PageControl1.ActivePage := tsHome;
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
  PageControl1.ActivePage := tsCode;
end;

procedure TfrmIObjTestMain.btnMyClassIObjClick(Sender: TObject);
var
  myClass : IObj<MyClassIObj.TMyclass>;
begin
  try
    myClass := TObj.CreateInstance(MyClassIObj.TMyclass.Create);
    myClass.Obj.execute;
  finally
    cbIObjFix.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnMyClassLeakedClick(Sender: TObject);
var
  myClass : IObj<MyClassLeaked.TMyclass>;
begin
  try
    myClass := TObj.CreateInstance(MyClassLeaked.TMyclass.Create);
    myClass.Obj.execute;
  finally
    cbLeaked.checked := true;
  end;
end;

procedure TfrmIObjTestMain.btnMyClassStandardClick(Sender: TObject);
var
  myClass : IObj<MyClassStandard.TMyclass>;
begin
  try
    myClass := TObj.CreateInstance(MyClassStandard.TMyclass.Create);
    myClass.Obj.execute;
  finally
    cbStandardFix.checked := true;
  end;
end;

// LoopVariables
procedure TfrmIObjTestMain.btnLoopVariablesClick(Sender: TObject);
begin
  loadLoopVars;
  PageControl1.ActivePage := tsCode;
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
  PageControl1.ActivePage := tsCode;
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


procedure TfrmIObjTestMain.btnIObjClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsIObj;
end;

procedure TfrmIObjTestMain.btnLocalVariablesClick(Sender: TObject);
begin
  loadLocalVars;
  PageControl1.ActivePage := tsCode;

end;

procedure TfrmIObjTestMain.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := tsHome;
  pgCode.ActivePageIndex := 0;
  loadIObj;
end;

function TfrmIObjTestMain.getCode(src: TStrings; const tag: string): string;
var
  lst : IObj<TStringList>;
  tagBegin : Integer;
  tagEnd : Integer;
  i : Integer;
begin
  lst := TObj.CreateInstance(TStringList.Create);

  tagBegin := src.IndexOf(format('//%s-begin', [tag]));
  tagEnd := src.IndexOf(format('//%s-end', [tag]));

  if (tagBegin > 0) and (tagEnd > tagBegin) then
  begin
    for i := tagBegin + 1 to tagEnd - 1 do
      lst.Obj.add(src[i]);
  end;

  result := lst.Obj.Text;
end;

function TfrmIObjTestMain.getFile(const resourceName: string): string;
var
  ss : IObj<TStringStream>;
  rs : IObj<TResourceStream>;
begin
  ss := TObj.CreateInstance(TStringStream.Create);
  rs := TObj.CreateInstance(TResourceStream.Create(hInstance, resourceName, RT_RCDATA));
  ss.Obj.LoadFromStream(rs.Obj);
  result := ss.Obj.DataString;
end;


procedure TfrmIObjTestMain.loadIObj;
begin
  memoIObj.Lines.Text := getFile('IObj');
end;

procedure TfrmIObjTestMain.loadLocalVars;
var
  lst : IObj<TStringList>;
begin
  lst := TObj.CreateInstance(TStringList.Create);
  lst.Obj.Text := getFile('LocalVars');

  memoLeaked.Lines.Text := getCode(lst.Obj, 'LocalVarsLeaked');
  memoStandardFix.Lines.Text := getCode(lst.Obj, 'LocalVarsStandard');
  memoIObjFix.Lines.Text := getCode(lst.Obj, 'LocalVarsIObj');

  btnLeaked.OnClick := btnLocalVarsLeakedClick;
  btnStandardFix.OnClick := btnLocalVarsStandardClick;
  btnIObjFix.OnClick := btnLocalVarsIObjClick;
end;

procedure TfrmIObjTestMain.loadLoopVars;
var
  lst : IObj<TStringList>;
begin
  lst := TObj.CreateInstance(TStringList.Create);
  lst.Obj.Text := getFile('LocalVars');

  memoLeaked.Lines.Text := getCode(lst.Obj, 'LoopVarsLeaked');
  memoStandardFix.Lines.Text := getCode(lst.Obj, 'LoopVarsStandard');
  memoIObjFix.Lines.Text := getCode(lst.Obj, 'LoopVarsIObj');

  btnLeaked.OnClick := btnLoopVarsLeakedClick;
  btnStandardFix.OnClick := btnLoopVarsStandardClick;
  btnIObjFix.OnClick := btnLoopVarsIObjClick;
end;

procedure TfrmIObjTestMain.loadMyClass;
begin
  memoLeaked.Lines.Text := getFile('MyClassLeaked');
  memoStandardFix.Lines.Text := getFile('MyClassStandard');
  memoIObjFix.Lines.Text := getFile('MyClassIObj');

  btnLeaked.OnClick := btnMyClassLeakedClick;
  btnStandardFix.OnClick := btnMyClassStandardClick;
  btnIObjFix.OnClick := btnMyClassIObjClick;
end;

procedure TfrmIObjTestMain.loadObjectAsProperty;
begin
  memoLeaked.Lines.Text := getFile('ObjectAsPropertyLeaked');
  memoStandardFix.Lines.Text := getFile('ObjectAsPropertyStandard');
  memoIObjFix.Lines.Text := getFile('ObjectAsPropertyIObj');

  btnLeaked.OnClick := btnObjectAsPropertyLeakedClick;
  btnStandardFix.OnClick := btnObjectAsPropertyStandardClick;
  btnIObjFix.OnClick := btnObjectAsPropertyIObjClick;
end;

end.
