import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/views/pages/home_Page.dart';
import 'package:pt_project_1/views/pages/login_page.dart';
import 'package:pt_project_1/views/pages/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'contants/constant.dart';
import 'views/pages/sign_up.dart';

// This widget is the root of your application.
class App extends StatelessWidget {
  //object of _model that reference class MainModel
  final MainModel _model = MainModel();
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
      home: HomePage(), //start up page
      routes: {
        //navigations
        loginPage: (BuildContext context) => LoginPage(),
        signUp: (BuildContext context) => SignUpPage(),
        loginScreen: (BuildContext context) => LoginScreen(),
        homepage: (BuildContext context) => HomePage(),
      },
    ),
      model: _model,
    );
    
  }
}
