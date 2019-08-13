import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';

class AuthorProfileCard extends StatelessWidget {
  final Album album;

  const AuthorProfileCard({Key key, @required this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListTile(
        leading: CircleAvatar(
           backgroundImage: AssetImage(album.cover),
          radius: 20,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(album.author),
            Text(album.title),
          ],
        ),
        trailing: Icon(Icons.star, color: Colors.yellow),
      ),
    );
  }
}
