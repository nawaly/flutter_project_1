import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/views/components/cards/album_card.dart';
// import 'package:pt_project_1/views/components/cards/album_card.dart';
import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
import 'package:pt_project_1/views/components/cards/side_detailed_card.dart';
import 'package:pt_project_1/views/components/headers/Simple_header.dart';

// import 'package:pt_project_1/views/components/header.dart';
//today tab
class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: albums.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ImageTextCard(
    //         album: albums[index],
    //       );
    //     });

    return CustomScrollView(slivers: <Widget>[
      SliverList( //first sliverlist of day and date
        delegate: SliverChildListDelegate([ //SliverChildListDelegate is child of delegate
          SimpleHeader(
            date: '2019-08-08 04:33',
            day: 'Today',
            padding: 20,
          )
        ]),
      ),
      SliverList( // sliverist of first and third image from AlbumCard and second image from DetailedNewsCard
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return index.isEven
              ? AlbumCard(
                  album: albums[index],
                  padding: 20,
                )
              : DetailedNewsCard(
                  album: albums[index],
                  padding: 20,
                );
        }, childCount: 3),
      ),
      SliverList( //sliverist of second day and date
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: '18 MARCH',
            day: 'Monday',
            padding: 20,
          )
        ]),
      ),
      SliverGrid( //silvergrid of grid images
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            //padding not returned, it is wrapped ndo mana ipo juu
            padding: EdgeInsets.only(
                //space of left and right btn container which are grid
                left: index.isEven ? 20 : 0,
                right: index.isOdd ? 20 : 0),
            child: ImageTextCard(
              album: albums[index],
            ),
          );
        }, childCount: 3),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //number of images in grid
          crossAxisSpacing: 5, //space btn two images in grid up and down
          mainAxisSpacing: 5, //space btn two images in grid left and right
        ),
      ),
      SliverList( //sliverist of third day and date
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: '17 MARCH',
            day: 'Sunday',
            padding: 20,
          )
        ]),
      ),
      SliverList( //sliverlist of single image after grid of ImageTextCard
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ImageTextCard(
              album: albums[index],
            ),
          );
        }, childCount: 1),
      ),
      SliverList( //sliverlist of last card, SideDetailedCard
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SideDetailedCard(album: albums[index]);
          },
          childCount: 4,
        ),
      ),
    ]);
  }
}
