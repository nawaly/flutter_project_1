import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  //stateless converted to stateful
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // declaring FocusNodes that grabs input written by user and sends to database
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  //declaring TextEditingComtroller that controls text field to be used somewhere else
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  //keys
  final _signformkey = GlobalKey<FormState>(); //to have access in form
  final _scaffoldKey = GlobalKey<ScaffoldState>(); //to have access in scaffold

  bool _isObscure = true; //boolean for eye to open or close

//variables
//temporary login credentials
  // final String _email = "nawal@gmail.com";
  // final String _password = "12345";

  //method authonticating email

  //bool _checkpassword() {
  //if (_password.compareTo(_passwordTextEditingController.text) == 0) {
  // return true;
  //} else
  // return false;
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      //scoped model has 3 classes; ScopedModel,ScopedModelDescendant,Model
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              //top bar where back button is located
              backgroundColor: Colors.transparent, //top bar color
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: Colors.deepPurple), //back arrow at the top left
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              //to scroll
              child: Form(
                //form to fill inputs
                key: _signformkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100, //height of everything from top
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Text('TeamUP',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('The app tagline goes here',
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          //padding for email and password input
                          left: 40,
                          top: 40,
                          right: 40,
                          bottom: 10),
                      child: TextFormField(
                        focusNode: _emailFocusNode,
                        controller: _emailTextEditingController,
                        keyboardType: TextInputType
                            .emailAddress, //keyboard to have .com and @
                        validator: (value) {
                          if (value.isEmpty) //if email blank
                            return 'email required';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                            hintText:
                                'Email address', //displays on start writting
                            labelText: 'Email', //seen on the input bar
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30) //radius of the side curves
                                )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40, top: 5, right: 40, bottom: 10),
                      child: TextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordTextEditingController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty)
                            return 'password required';
                          else
                            return null;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });

                                  print(_isObscure);
                                },
                                icon: Icon(_isObscure
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash)),
                            hintText: '*****',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Forgot your Password?',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                      onPressed: () {},
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40, top: 5, right: 40, bottom: 10),
                            child: RaisedButton(
                              padding:
                                  EdgeInsets.all(11), //raised button height
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),

                              child: model.showSpinner
                                  ? CircularProgressIndicator(
                                      //loading symbol
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white))
                                  : Text(
                                      'LOG IN',
                                      style: TextStyle(color: Colors.white),
                                    ),
                              color: Colors.deepPurple,
                              onPressed: () {
                                if (_signformkey.currentState.validate()) {
                                  model
                                      .login(
                                          email:
                                              _emailTextEditingController.text,
                                          password:
                                              _passwordTextEditingController
                                                  .text) //call back
                                      .then((auth) {
                                    print('auth');
                                    if (auth) {
                                      Navigator.pushReplacementNamed(
                                          context, '/');
                                    } else {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                              //pop up of incorrect email or password
                                              content: ListTile(
                                                //more than one lists
                                                leading: Icon(Icons.error,
                                                    color: Colors.red),
                                                title: Text(
                                                    'incorrect email or password'),
                                                trailing: Icon(Icons.error,
                                                    color: Colors.red),
                                              ),
                                              backgroundColor: Colors.purple,
                                              duration: Duration(seconds: 2)));
                                    }
                                  });
                                  model.toggoSpinner();
                                  int time = 0;
                                  var t = Timer(Duration(seconds: 3), () {
                                    model
                                        .toggoSpinner(); //to access loading symbol
                                    time = 3;
                                  });
                                  if (time == 3) {
                                    t.cancel();
                                  }
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                print('facebook');
                              },
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Colors.blue[900],
                                ),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[100],
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              print('twitter');
                            },
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100],
                                  border:
                                      Border.all(width: 2, color: Colors.grey)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                print('instagram');
                              },
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.pink[900],
                                ),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[100],
                                    border: Border.all(
                                        width: 2, color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
