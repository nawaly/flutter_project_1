import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:scoped_model/scoped_model.dart';

class PostCard extends StatefulWidget {
  final Album album;
  final MainModel model;
  const PostCard({Key key, @required this.album, @required this.model})
      : super(key: key);
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          height: height / 5,
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none), //removes black border
            elevation: 10, //darkness
            child: Row(
              children: <Widget>[
                Container(
                  width: width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(15)),
                    image: DecorationImage(
                        image: NetworkImageWithRetry(
                            model.getAlbumCover(widget.album.id)),

                        ///widget. bcs its stateful
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.album.title,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),

                        Text(widget.album.details,
                            style: TextStyle(
                              fontSize: 10,
                            )),

                        Spacer(), //space widget

                        Row(
                          children: <Widget>[
                            RaisedButton.icon(
                              icon: Icon(Icons.edit),
                              label: Text('EDIT'),
                              onPressed: () {
                                _onEditTapped(); //Calling Method of Edit
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RaisedButton.icon(
                              icon: Icon(Icons.delete),
                              label: Text('DELETE'),
                              onPressed: () {
                                widget.model
                                    .deleteAlbum(albumId: widget.album.id); //deletes directly
                              }, 
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _onEditTapped() {
    //Edit Method Called here
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.grey[600],
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text('Edit Album',
                        style:
                            TextStyle(color: Colors.deepPurple[900], fontSize: 25)),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Subtitle',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'details',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    RaisedButton(
                      child: Text('save'),
                      onPressed: () {},
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
