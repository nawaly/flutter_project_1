import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';

// first image in grid images, text on top of image in today screen
class ImageTextCard extends StatelessWidget {
  //objects
  final Album album;
  final double padding;

  const ImageTextCard({
    Key key,
    @required this.album, this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //declaring variable height
    // double height = MediaQuery.of(context).size.height;

    return Container(
      //using declared variable:
      // height: height / 3,
      height: MediaQuery.of(context).size.height/2, //declaring and using at the same time
      padding: EdgeInsets.all(padding),
      //color should be in decoration
      //containers decorations
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height /2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(album.cover), fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container( //text container & decorations
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 9,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Text(
                'Soprano Announces His New Album',
                // album.title, keeping this will display album.dart titles
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
