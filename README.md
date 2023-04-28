# Delphi-IObj
This library simplifies the way you write Delphi code that can avoid memory leaks

    // declare and instantiate variable of type TMyObject
    var myObj := TObj.CreateInstance(TMyObject.Create);
    var lst := TObj.CreateInstance(TStringList.Create);

    // myObj.Obj refers to the created TMyObject
    myObj.Obj
    
    // No need to call myObj.free at all
    // No need to call lst.free at all
