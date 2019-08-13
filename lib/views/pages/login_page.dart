import 'package:flutter/material.dart';
import 'package:pt_project_1/contants/constant.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //to be seen
      body: SingleChildScrollView( //to scroll up and down
        child: Column( //column bcs many stuffs going downwards and takes children only
          children: <Widget>[
            SizedBox(
              height: 250, // height of all children in column from the top
            ),
            Center( //for the diamond pic
              child: CircleAvatar( //circle for the picture on top
                radius: 70, //radius of the diamond
                backgroundColor: Colors.transparent, //color of the circle not to be seen
                child: Image(
                    image: AssetImage('assets/icons/diamond.png'), height: 120),
              ),
            ),
            SizedBox(
              height: 70, //height of TeamUp from the diamomd
            ),
            Text('TeamUP',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )),
            Text('The app tagline goes here',
                style: TextStyle(
                  fontSize: 10,
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        child: Row( //row bcs there are stuffs arranged side ways
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //to leave middle space open
          children: <Widget>[
            FlatButton(
              child: Text(
                'LOG IN',
                
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, loginScreen); //defines where to navigate on pressing log in
              },
            ),
            FlatButton(
              child: Text(
                'SIGN UP',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, signUp); //defines where to go on pressing sign up
              },
            )
          ],
        ),
      ),
    );
  }
}
