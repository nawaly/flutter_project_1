import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/models/album.dart';

//one of the last 4 images in today screen
class SideDetailedCard extends StatelessWidget {
  final Album album;
  final MainModel model;

  const SideDetailedCard({Key key, @required this.album, @required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 35),
        height: MediaQuery.of(context).size.height / 4,

        //row doesnt have height
        child: Row(
            //dividing into 2
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                //expands child so as image to fill available space
                child: Container(
                  //image container
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width * 2 / 5,

                  //image,border radius inside decoration & fit inside image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImageWithRetry(model.getAlbumCover(album.id)),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                //text to fill the space
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(album.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          )),
                           IconButton(icon: Icon(Icons.delete), onPressed: () {
                             model.deleteAlbum(albumId: album.id);
                           },),
                      SizedBox(
                        height: 14, //of text
                      ),
                      Text(
                        'Mozilla has announced a new version of its browser for augumented reality',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 11,
                      ), //height of avatar
                      Row(
                        children: <Widget>[
                          //simple way of designing avatar
                          CircleAvatar(
                            backgroundImage: AssetImage(album.cover),
                            radius: 15,
                          ),
                          //another way of designing avatar
                          // Container(
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     image: DecorationImage(
                          //       image: AssetImage('assets/icons/2.jpg'))
                          //   ),),
                          
                          Expanded(
                            child: Text(album.title,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 18,
                                )),
                          )
                        ],
                      ),
                      Divider(color: Colors.grey) //line divider
                    ],
                  ),
                ),
              )
            ]));
  }
}
