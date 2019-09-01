import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/views/components/cards/post_card.dart';
import 'package:scoped_model/scoped_model.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            title: Text('My Post'),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell( //shows open page
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: Colors.blue[700]),
                      radius: 25,
                    ),
                  ))
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: model.getAvailableAlbums().length,
                itemBuilder: (BuildContext context, int index) {
                  return PostCard(
                    album: model.getAvailableAlbums()[index],
                    model: model,
                  );
                },
              )),
        );
      },
    );
  }
}
