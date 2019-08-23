import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/views/components/cards/author_profile_card.dart';
import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
import 'package:pt_project_1/views/components/cards/side_detailed_card.dart';
import 'package:pt_project_1/views/components/headers/simple_headers.dart';
import 'package:scoped_model/scoped_model.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (BuildContext context, Widget child, MainModel model) {
      return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeaders(
              padding: 20,
              title: 'THIS WEEK',
              subtitle: 'Discover',
              showTitle: true,
              showButton: false,
              showStar: true,
            )
          ]),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: model.getAvailableAlbums().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ImageTextCard(
                  album: model.getAvailableAlbums()[index],
                  padding: 10, model: model, //declared and defined in ImageTextCard
                
                ),
              );
            },
          ),
        )),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.grey,
              ),
            )
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeaders(
              padding: 20,
              subtitle: 'Popular Author',
              showTitle: false,
              showButton: true,
              showStar: false,
            )
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return AuthorProfileCard(
                album: model.getAvailableAlbums()[index], model: model,
              );
            },
            childCount: model.getAvailableAlbums().length,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.grey,
              ),
            )
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeaders(
              padding: 10,
              subtitle: 'The Fashion Week',
              showTitle: false,
              showButton: false,
              showStar: false,
            )
          ]),
        ),
         SliverToBoxAdapter(
            child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: model.getAvailableAlbums().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: DetailedNewsCard(
                  album: model.getAvailableAlbums()[index], 
                  padding: 10, model: model, //bigness of the image from image
                
                ),
              );
            },
          ),
        )),
        
         SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.grey,
              ),
            )
          ]),
        ),
         SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeaders(
              padding: 20,
              subtitle: 'In Lifestyle',
              showTitle: false,
              showButton: true,
              showStar: false,
            )
          ]),
        ),
           SliverList( //sliverlist of last card, SideDetailedCard
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SideDetailedCard(album: model.getAvailableAlbums()[index], model: model,);
          },
          childCount: model.getAvailableAlbums().length,
        ),
      ),
       SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.grey,
              ),
            )
          ]),
        ),
         SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeaders(
              padding: 20,
              subtitle: 'Must See',
              showTitle: false,
              showButton: false,
              showStar: false,
            )
          ]),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: model.getAvailableAlbums().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ImageTextCard(
                  album: model.getAvailableAlbums()[index], model: model, padding: 10,
            
                ),
              );
            },
          ),
        )),
         SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeaders(
              padding: 20,
              subtitle: 'Popular last Week',
              showTitle: false,
              showButton: false,
              showStar: false,
            )
          ]),
        ),
        SliverList( //sliverlist of last card, SideDetailedCard
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SideDetailedCard(album: model.getAvailableAlbums()[index], model: model,);
          },
          childCount: model.getAvailableAlbums().length,
        ),
      ),
      ],
    );
    },);
  }
}
