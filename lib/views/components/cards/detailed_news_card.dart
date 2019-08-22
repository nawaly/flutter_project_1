import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
//second image divided with image & text at the bottom in today screen
class DetailedNewsCard extends StatelessWidget {
  final Album album;
  final double padding;


  const DetailedNewsCard({Key key, @required this.album, @required this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding), //(padding)=value of padding will be passed here
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        
      ),
     
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(album.cover), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(album.title, style: TextStyle(color: Colors.grey,fontSize: 20),), //color stays before fontsize
                  Text(album.subtitle, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text(album.title, style: TextStyle(color: Colors.grey,fontSize: 20),)
                ]
              ),
              height: MediaQuery.of(context).size.height / 6, //declaring and initializing/using variable height
              width: MediaQuery.of(context).size.height ,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
               bottomRight: Radius.circular(15)),
               color: Colors.white,
             ),
            ),
          )
        ],
      ),
    );
  }
}
