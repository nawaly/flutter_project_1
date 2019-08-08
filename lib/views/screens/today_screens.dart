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
      SliverList(
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: 'wed',
            day: 'today',
            padding: 20,
          )
        ]),
      ),
      SliverList(
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
        }, childCount: albums.length),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: '12',
            day: 'monday',
            padding: 20,
          )
        ]),
      ),
      SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: index.isEven ? 20 : 0, right: index.isOdd ? 20 : 0),
            child: ImageTextCard(
              album: albums[index],
            ),
          );
        }, childCount: albums.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: '17',
            day: 'sunday',
            padding: 20,
          )
        ]),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ImageTextCard(
              album: albums[index],
            ),
          );
        }, childCount: 1),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SideDetailedCard(album: albums[index]);
          },
          childCount: albums.length,
        ),
      ),
    ]);
  }
}
