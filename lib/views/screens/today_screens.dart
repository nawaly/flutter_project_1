import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/views/components/cards/album_card.dart';
import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
import 'package:pt_project_1/views/components/cards/side_detailed_card.dart';
import 'package:pt_project_1/views/components/headers/Simple_header.dart';
import 'package:scoped_model/scoped_model.dart';

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant(builder: (
      BuildContext context, 
      Widget child, MainModel model) { 

        return model.getAvailableAlbums().isNotEmpty ?
        CustomScrollView(slivers: <Widget>[
      SliverList(
        //sliverlist of first day and date
        delegate: SliverChildListDelegate([
          //SliverChildListDelegate is child of delegate
          SimpleHeader(
            date: '2019-08-08 04:33',
            day: 'Today',
            padding: 20,
          )
        ]),
      ),
      SliverList(
        // sliverist of images from AlbumCard and DetailedNewsCard
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return index.isEven
              ? AlbumCard(
                  album: model.getAvailableAlbums()[index],
                  padding: 20, model: model,
                )
              : DetailedNewsCard(
                  album: model.getAvailableAlbums()[index],
                  padding: 20, model: model,
                );
        }, childCount:  model.getAvailableAlbums().length,
        ),
      ),
      SliverList(
        //sliverist of second day and date
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: '18 MARCH',
            day: 'Monday',
            padding: 20,
          )
        ]),
      ),
      SliverGrid(
        //silvergrid of grid images
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            //padding not returned, it is wrapped ndo mana ipo juu
            padding: EdgeInsets.only(
                //space of left and right btn container which are grid
                left: index.isEven ? 20 : 0, //if even left=20
                right: index.isOdd ? 20 : 0), //if odd right=20
            child: ImageTextCard(
              
              album: model.getAvailableAlbums()[1], model: model, padding: 10,
            ),
          );
        }, childCount:  model.getAvailableAlbums().length,
        ),//number of images in grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 5, //space btn two images in grid up and down
          mainAxisSpacing: 5, //space btn two images in grid left and right
        ),
      ),
      SliverList(
        //sliverist of third day and date
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: '17 MARCH',
            day: 'Sunday',
            padding: 20,
          )
        ]),
      ),
      SliverList(
        //sliverlist of single image after grid of ImageTextCard
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ImageTextCard(
              album: model.getAvailableAlbums()[index], model: model, padding: 10,
            ),
          );
        }, childCount: model.getAvailableAlbums().length,
        ),
      ),
      SliverList(
        //sliverlist of last card, SideDetailedCard
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SideDetailedCard(album: model.getAvailableAlbums()[index], model: model,);
          },
          childCount:  model.getAvailableAlbums().length,
        ),
      ),
    ]):Center(child: 
    Text('album is empty'),);
      },);
  }
}
