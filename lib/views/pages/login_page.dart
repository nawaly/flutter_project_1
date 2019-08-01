import 'package:flutter/material.dart';
import 'package:pt_project_1/contants/constant.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250,
            ),
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                child: Image(
                    image: AssetImage('assets/icons/diamond.png'), height: 120),
              ),
            ),
            SizedBox(
              height: 70,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, loginScreen);
                },
              ),
              FlatButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, signUp);
                },
              )
            ],
          ),),
    );
  }
}
