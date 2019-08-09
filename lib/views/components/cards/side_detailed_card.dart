import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
//last 4 images
class SideDetailedCard extends StatelessWidget {
  final Album album;

  const SideDetailedCard({Key key, @required this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //variables
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 35),
        height: height / 4,
        //row doesnt have height
        child: Row(
            //dividing row into half
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: height / 4,
                  width: width * 2 / 5,

                  //image,border radius inside decoration
                  //fir=t inside image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(album.cover),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(album.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                          'Mozilla hasannounced a new version of its browser for augumented reality',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          
                          //simple way of designing avatar
                          CircleAvatar(
                            backgroundImage: AssetImage(album.avatar),
                            radius: 15,
                          ),
                          // Container(
                          //   // padding: EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     image: DecorationImage(
                          //       image: AssetImage('assets/icons/2.jpg'))
                          //   ),
                          // ),
                          Expanded(
                            //\n between names for next line

                            child: Text(album.author,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 18,
                                )),
                          )
                        ],
                      ),
                    Divider(color: Colors.grey)
                    ],
                  ),

                ),
              )
            ]));
  }
}
