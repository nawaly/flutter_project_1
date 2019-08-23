import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pt_project_1/api/api.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//anything to be seen in the whole app, fetching and editing album
//first class(mixin) extends on model & other mixins implements on model
//mixin=class that contains methods for use by other classes
mixin Team_AppConnectedModel on Model {
  //creating private list of type album called availableAlbums
  List<Album> _availableAlbums;
 }
mixin Album_Model on Team_AppConnectedModel { 
  // List<Album> get availableAlbum=>_availableAlbums; //getter

  List<Album> getAvailableAlbums(){
   if(_availableAlbums==null){
    return <Album> [];
  }
  return List<Album>.from(_availableAlbums);
  }
  //functions/methods
  Future<void> getAlbums() async {
    List<Album> _fetchedAlbums=[];
    try{
      http.Response response= await http.get(api+'albums'); //response from http ipo in json
   Map<String,dynamic> data = json.decode(response.body); 
   //print(data);
   data['albums'].forEach((albumData){ 
      final album=Album.fromMap(albumData);
      _fetchedAlbums.add(album);
   });
   print(_fetchedAlbums);
    } 
     catch(error){
      print(error);
    }
   _availableAlbums = _fetchedAlbums;
  }
  String getAlbumCover(int albumId){
    return api+'album/cover/'+ albumId.toString();
  }
}
mixin Category_Model on Team_AppConnectedModel {}
mixin Utility_Model on Team_AppConnectedModel { //utility model defines extra stuff details
  bool _showSpinner = false; //loading symbol

  /// creating getters functions(declaring variables starts with small letters)
  bool get showSpinner => _showSpinner;

  ///creating setters
  toggoSpinner() {
    _showSpinner = !_showSpinner; //variable declared=value
    notifyListeners(); //rebuild built methods,save or give changes made
  }
}

mixin User_Model on Team_AppConnectedModel {
  //all below should be inside this mixin
//function,, userSubject is type PublishSubject
  PublishSubject<bool> _userSubject = PublishSubject();
  final String _email = "nawal@gmail.com";
  final String _password = "12345";

  User _user;
  Future<bool> login({ 
    //login method
    //async bcz used in fetching data from db
    @required String email,
    @required String password,
  }) async {
    //asynchronize
    bool _isLoggedIn = false;
    final SharedPreferences pref = //SharedPreference stores data locally
        await SharedPreferences.getInstance(); //await is used with async
    if (email == _email && password == _password) {
      _user = User(
          email: _email,
          id: 1,
          profile: null,
          token: 'howyhudoin',
          name: 'nawal');

      //sets or adds preference (id=key , _user.id=value);
      pref.setInt('id', _user.id); 
      pref.setString('email', _user.email);
      pref.setString('name', _user.name);
      pref.setString('profile', _user.profile);
      pref.setString('token', _user.token);
      _userSubject.add(true); //true= user is logged in,calls usersubject
      _isLoggedIn = true;
      notifyListeners();
    }
    return _isLoggedIn;
  }

  void logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _userSubject.add(false);
    pref.clear();
    notifyListeners();
  }

  Future<void> autoAuthenticate() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String _token = pref.getString('token');
    if (_token.isNotEmpty) { //random statement that plays as active/logged in time
      _user = User(
          email: pref.getString('email'),
          id: pref.getInt('id'),
          name: pref.getString('name'),
          profile: pref.getString('profile'),
          token: pref.getString('token'));
      _userSubject.add(true);
      notifyListeners();
    } else {
      _userSubject.add(false);
      notifyListeners();
    }
  }

//getters
  PublishSubject get userSubject => _userSubject;
}
