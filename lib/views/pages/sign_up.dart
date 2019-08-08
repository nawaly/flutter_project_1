import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pt_project_1/contants/constant.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text input focus nodes
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmpasswordFocusNode = FocusNode();

  //controll the input of each textfield
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _confirmpasswordTextEditingController =
      TextEditingController();

//keys
  final _signUpFormKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormFieldState>();

//variables
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _signUpFormKey,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 100,
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
                        left: 40, top: 40, right: 40, bottom: 10),
                    child: TextFormField(
                      focusNode: _emailFocusNode,
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty)
                          return 'email required';
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Email address',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, top: 5, right: 40, bottom: 10),
                    child: TextFormField(
                      key: _passwordKey,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, top: 5, right: 40, bottom: 10),
                    child: TextFormField(
                      focusNode: _confirmpasswordFocusNode,
                      controller: _confirmpasswordTextEditingController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Confirm password required';
                        else
                        if(value != _passwordKey.currentState.value){
                          return 'password not match';

                        }
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
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 10, right: 40, bottom: 10),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.deepPurple,
                            onPressed: () {
                              if (_signUpFormKey.currentState.validate())
                              Navigator.pushReplacementNamed(context, homepage);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ]))));
  }
}
