import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
// import 'package:pt_project_1/models/album.dart';

class ImageTextCard extends StatelessWidget {
  //1
  //objects
  // final Album album;

  //const ImageTextCard({Key key, @required this.album}) : super(key: key); 1
final Album album;

  const ImageTextCard({Key key, @required this.album, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //here
    //declared variables
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Container(
      //declared variables used
      height: height / 3,
    

      
//color should be in decoration
//containers decorations
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: height / 3,
           
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(album.cover), fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(8),
              height: height/9,
              
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

      //2
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      // height: MediaQuery.of(context).size.height / 3,
      // margin: EdgeInsets.all(10),
      // child: Stack(
      //   children: <Widget>[
      //     Container(
      //       width: MediaQuery.of(context).size.width ,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage(album.cover), fit: BoxFit.cover),
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomLeft,
      //         child: Padding(
      //           padding: const EdgeInsets.only(left: 10, bottom: 20),
      //           child: Container(
      //             width: MediaQuery.of(context).size.width ,
      //             child: Text(album.author,maxLines: 3,
      //                 style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.white)),
      //           ),
      //         ))
      //   ],
      // ), 2
    );
  }
}
