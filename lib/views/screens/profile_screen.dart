import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
            color: Colors.brown,
            child: Center(
              child: RaisedButton(
                child: Text(
                  'log out',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  model.getAlbums();
                },
              ),
            ));
      },
    );
  }
}
