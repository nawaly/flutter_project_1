import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pt_project_1/models/album.dart';
//first image and third image with text,avatar,comment, on top in today screen
class AlbumCard extends StatelessWidget {
  final Album album;
  final double padding;

  const AlbumCard({Key key, @required this.album, @required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      height: 450,
      child: Stack(
        children: <Widget>[
          Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(album.cover), fit: BoxFit.cover)),
          ),
          album.isHot
              ? Padding(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: RaisedButton.icon(
                      label: Text(
                        'HOT',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      color: Color(0xffD4AF37), //color: Color(0xff..)0xff must be there, .. color code
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.fire, color: Colors.red),
                    ),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //text to start leftmost
                  children: <Widget>[
                    Text(
                      album.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      album.subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.transparent),
                            image: DecorationImage(
                                image: AssetImage(album.cover),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              album.title,
                              style: TextStyle(color: Colors.white,fontSize: 17),
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
                            album.details.toString(), //converting int comments to string bcz of text
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
