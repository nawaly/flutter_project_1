import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
//popular author card with avatar,text & star in discover screen
class AuthorProfileCard extends StatelessWidget {
  final Album album;

  const AuthorProfileCard({Key key, @required this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListTile( //
        leading: CircleAvatar( //leading bcz its first on the left
           backgroundImage: AssetImage(album.cover),
          radius: 20,
        ),
        title: Column( //name=author & down title
          crossAxisAlignment: CrossAxisAlignment.start, //start right after avatar
          children: <Widget>[
            Text('naw'), //text from file album.dart in model
            Text(album.title),
          ],
        ),
        trailing: Icon(Icons.star,color: Colors.red,),
      ),
    );
  }
}
