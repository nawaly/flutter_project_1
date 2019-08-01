import 'package:flutter/material.dart';
import 'package:pt_project_1/views/pages/home_Page.dart';
import 'package:pt_project_1/views/pages/login_page.dart';
import 'package:pt_project_1/views/pages/login_screen.dart';
import 'contants/constant.dart';
import 'views/pages/sign_up.dart';


class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.purple,
      ),
      home:LoginPage(),
      routes:{
        loginPage:(BuildContext context) => LoginPage(),
        signUp:(BuildContext context)=> SignUpPage(),
        loginScreen:(BuildContext context)=> LoginScreen(),
        homepage:(BuildContext context)=> HomePage(),
      } ,
    );
  }
}