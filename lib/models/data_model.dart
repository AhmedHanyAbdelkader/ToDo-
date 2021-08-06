import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';


class Data {

 String title;
 String description;
 bool   isComplete;

 Data({@required this.title ,@required this.description,@required this.isComplete});

}


class DataProvider extends ChangeNotifier{


  List<Data> _dataList = [];

  List<Data> get getData{
    return _dataList;
  }

  void addData(String title ,String description , bool isComplete ){
    Data dataobject = Data(title: title , description: description , isComplete: isComplete);
    _dataList.add(dataobject);
    notifyListeners();
  }

  void removeData(int index){
    _dataList.removeAt(index);
    notifyListeners();
  }

  void EditCheckBox(int index, bool val){

    final iss= _dataList.firstWhere((element) => element.title == _dataList[index].title);
    iss.isComplete=val ;

    notifyListeners();
  }


}


