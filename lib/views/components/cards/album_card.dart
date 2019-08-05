import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pt_project_1/models/album.dart';

class AlbumCard extends StatelessWidget {
  final Album album;

  const AlbumCard({Key key, @required this.album}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 20),
            child: Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(album.cover),
                            fit: BoxFit.cover)),
                  ),
                  album.isHot?
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: RaisedButton.icon(
                        label: Text(
                          'HOT',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.pinkAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.fire, color: Colors.white),
                      ),
                    ),
                  )
                  :Container(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              album.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              album.subtitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.white),
                                    image: DecorationImage(
                                        image: AssetImage(album.avatar),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      album.title,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.comment,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    album.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      
          
  }
}