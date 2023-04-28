unit ObjectAsPropertyIObj;

interface
uses
  LN.IObj, System.Classes, System.SysUtils, Dialogs;

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
  IPerson = IObj;
  TPersonArray = array of IPerson;
  IListPerson = IObj;

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
  ip1, ip2, ip3, ip4, ip5 : IObj;
  house1, house2 : THouse; iHouse1, iHouse2 : IObj;
begin
  ip1 := TObj.Create(TPerson.Create('P1', StrToDate('1/1/2000')));
  ip2 := TObj.Create(TPerson.Create('P2', StrToDate('2/2/2000')));
  ip3 := TObj.Create(TPerson.Create('P3', StrToDate('3/3/2000')));
  ip4 := TObj.Create(TPerson.Create('P4', StrToDate('4/4/2000')));
  ip5 := TObj.Create(TPerson.Create('P5', StrToDate('5/5/2000')));

  // p1 owns 2 house1 & house2.
  house1 := THouse.Create('address1', [ip1], [ip2, ip3], true); iHouse1 := TObj.Create(house1);
  house2 := THouse.Create('address2', [ip1], [ip1, ip4, ip5], true); iHouse2 := TObj.Create(house2);

  // do some logic
  showMessage('Property: ' + house1.Address + #13#10 +
              'Owner: ' + THouse.getNames(house1.Owners) + #13#10 +
              'Residents: ' + THouse.getNames(house1.Residents));

  showMessage('Property: ' + house2.Address + #13#10 +
              'Owner: ' + THouse.getNames(house2.Owners) + #13#10 +
              'Residents: ' + THouse.getNames(house2.Residents));
  Result := True;
end;

// returns a list of distinct people from the lists of owners and renters
function THouse.getAllPeople: IListPerson;
var
  lst : TList;
  person : IPerson;
begin
  lst := TList.Create;

  for person in fOwners do
    if (lst.IndexOf(person.Obj) < 0) then
      lst.Add(person);

  for person in fResidents do
    if (lst.IndexOf(person) < 0) then
      lst.Add(person);

  result := TObj.Create(lst);
end;

class function THouse.getNames(lst: TPersonArray): string;
var
  person : IPerson;
begin
  result := '';
  for person in lst do
  begin
    if result = '' then
      result := TPerson(person.Obj).Name
    else
      result := result + ', ' + TPerson(person.Obj).Name;
  end;
end;

{ TPerson }

constructor TPerson.Create(Name: string; DOB: TDate);
begin
  fName := Name;
  fDOB := DOB;
end;

end.
