import 'package:flutter/foundation.dart';
import 'package:youthlimbo2/data/user.dart';

class MyUserData extends ChangeNotifier{
  User _myUserData;

  User get data => _myUserData;
  void setuserData(User user){
    _myUserData = user;
    notifyListeners();
  }
}