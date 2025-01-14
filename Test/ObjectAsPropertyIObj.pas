unit ObjectAsPropertyIObj;

interface
uses
  LN.IObj, System.Classes, Generics.Collections, System.SysUtils, Dialogs;

type
  TPerson = class(TComponent)
  private
    fName: string;
    fDOB: TDate;
  public
    property Name: string read fName write fName;
    property DOB: TDate read fDOB write fDOB;
    constructor Create(Name : string; DOB : TDate); reintroduce;
  end;
  IPerson = IObj<TPerson>;
  TPersonArray = array of IPerson;
  IListPerson = IObj<TList<IPerson>>;

  THouse= class(TComponent)
  private
    fOwners : TPersonArray;
    fResidents: TPersonArray;
    fOwnObjects: boolean;
    fAddress: string;
  public
    property Address : string read fAddress write fAddress;
    property Owners : TPersonArray read fOwners;
    property Residents : TPersonArray read fResidents;

    function getAllPeople : IListPerson;
    class function getNames(lst: TPersonArray): string;
    class function execute : boolean;

    constructor Create(const address: string; owners: TPersonArray; residents: TPersonArray; const OwnObjects: boolean); reintroduce;
  end;

implementation

{ THouse }

constructor THouse.Create(const address: string; owners: TPersonArray; residents: TPersonArray; const OwnObjects: boolean);
begin
  fAddress := address;
  fOwners := owners;
  fResidents := residents;
  fOwnObjects := OwnObjects;
end;

class function THouse.execute: boolean;
var
  p1, p2, p3, p4, p5 : IObj<TPerson>;
  house1, house2 : IObj<THouse>;
begin
  p1 := TObj.CreateInstance(TPerson.Create('P1', StrToDate('1/1/2000')));
  p2 := TObj.CreateInstance(TPerson.Create('P2', StrToDate('2/2/2000')));
  p3 := TObj.CreateInstance(TPerson.Create('P3', StrToDate('3/3/2000')));
  p4 := TObj.CreateInstance(TPerson.Create('P4', StrToDate('4/4/2000')));
  p5 := TObj.CreateInstance(TPerson.Create('P5', StrToDate('5/5/2000')));

  // p1 owns 2 house1 & house2.
  House1 := TObj.CreateInstance(THouse.Create('address1', [p1], [p2, p3], true));
  House2 := TObj.CreateInstance(THouse.Create('address2', [p1], [p1, p4, p5], true));

  // do some logic
  showMessage('Property: ' + house1.Obj.Address + #13#10 +
              'Owner: ' + THouse.getNames(house1.Obj.Owners) + #13#10 +
              'Residents: ' + THouse.getNames(house1.Obj.Residents));

  showMessage('Property: ' + house2.Obj.Address + #13#10 +
              'Owner: ' + THouse.getNames(house2.Obj.Owners) + #13#10 +
              'Residents: ' + THouse.getNames(house2.Obj.Residents));
  Result := True;
end;

// returns a list of distinct people from the lists of owners and renters
function THouse.getAllPeople: IListPerson;
var
  person : IPerson;
begin
  result := TObj.CreateInstance(TList<IPerson>.Create);

  for person in fOwners do
    if (result.Obj.IndexOf(person) < 0) then
      result.Obj.Add(person);

  for person in fResidents do
    if (result.Obj.IndexOf(person) < 0) then
      result.Obj.Add(person);
end;

class function THouse.getNames(lst: TPersonArray): string;
var
  person : IPerson;
begin
  result := '';
  for person in lst do
  begin
    if result = '' then
      result := person.Obj.Name
    else
      result := result + ', ' + person.Obj.Name;
  end;
end;

{ TPerson }

constructor TPerson.Create(Name: string; DOB: TDate);
begin
  fName := Name;
  fDOB := DOB;
end;

end.
