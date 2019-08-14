import 'package:flutter/foundation.dart';
import 'package:pt_project_1/models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

//anything to be seen in the whole app, fetching album, editing album
//first class(mixin) extends on model others(mixins) implements on model
//mixin=class
mixin Team_AppConnectedModel on Model {}
mixin Album_Model on Team_AppConnectedModel {}
mixin Category_Model on Team_AppConnectedModel {}
mixin Utility_Model on Team_AppConnectedModel {
  bool _showSpinner = false;

  /// creating getters functions(declaring variables starts with small letters)
  bool get showSpinner => _showSpinner;

  ///creating setters
  toggoSpinner() {
    _showSpinner = !_showSpinner;
    notifyListeners(); //rebuild built methods,save or give changes made
  }
}

mixin User_Model on Team_AppConnectedModel {
  //all below should be inside this mixin
//function
  PublishSubject<bool> _userSubject = PublishSubject();
  final String _email = "nawal@gmail.com";
  final String _password = "12345";

  User _user;
  void login({
    //login method
    //async bcz used in fetching data from db
    @required String email,
    @required String password,
  }) async {
    //asynchronize
    final SharedPreferences pref = //SharedPreference stores data locally
        await SharedPreferences.getInstance(); //await is used with async
    if (email == _email && password == _password) { 
      _user = User(
          email: _email,
          id: 1,
          profile: null,
          token: 'howyhudoin',
          name: 'nawal');

      pref.setInt('id', _user.id); //sets or adds preference id=key & _user.id=value
      pref.setString('email', _user.email);
      pref.setString('name', _user.name);
      pref.setString('profile', _user.profile);
      pref.setString('token', _user.token);
      _userSubject.add(true); //true= user is logged in,calls usersubject
      notifyListeners(); 
    }
  }

  void logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _userSubject.add(false);
    pref.clear();
    notifyListeners();
  }

//getters
  PublishSubject get userSubject => _userSubject;
}
