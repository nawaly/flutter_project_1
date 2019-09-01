import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/views/pages/home_Page.dart';
import 'package:pt_project_1/views/pages/login_page.dart';
import 'package:pt_project_1/views/pages/login_screen.dart';
import 'package:pt_project_1/views/pages/post_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'contants/constant.dart';
import 'views/pages/sign_up.dart';

// This widget is the root of your application.
class App extends StatefulWidget {
  //object of _model that reference class MainModel
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final MainModel _model = MainModel();
  bool _isAuthenticated= false;
  @override 
  //inistate is override,it is first method to be called, it excutes before build
  //userSubject is getter from Team_App_connected_models.dart
  void initState() {
    ///auth gets values from publishSubject
    _model.autoAuthenticate();
    _model.userSubject.listen((auth){ 
      setState(() { ///setState function from stateful widget
         _isAuthenticated=auth;
      });
      // _isAuthenticated=auth;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //<MainModel> typecasting ScopedModel to type MainModel
    return ScopedModel<MainModel>(
      child: MaterialApp(
      //material is android
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors
            .purple, //default color anything wanting color will give that if you dint assign
      ),
      // home: _isAuthenticated? HomePage():LoginPage(), //start up page
      routes: {
         '/':(BuildContext context) => _isAuthenticated? HomePage(model: _model,):LoginPage(),
        loginPage: (BuildContext context) => LoginPage(),
        signUp: (BuildContext context) => SignUpPage(),
        loginScreen: (BuildContext context) => LoginScreen(),
        homepage: (BuildContext context) => HomePage(model: _model,),
        
      },
    ),
      model: _model,
    );
    
  }
}
