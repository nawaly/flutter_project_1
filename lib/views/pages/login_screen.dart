import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pt_project_1/contants/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  final _signformkey = GlobalKey<FormState>();
  bool _isObscure = true;
  // focus nodes grabs input written by user and sends to database
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
//texteditingcomtroller controls text field to be used somewhere else
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
            key: _signformkey,
            child: Column(
              children: <Widget>[
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurple,
                          onPressed: () {
                            if (_signformkey.currentState.validate())
                              Navigator.pushReplacementNamed(context, homepage);
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
                              border: Border.all(width: 2, color: Colors.grey)),
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
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
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
  }
}
