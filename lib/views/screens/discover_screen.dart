import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/views/components/cards/author_profile_card.dart';
import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
import 'package:pt_project_1/views/components/headers/simple_headers.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            )
          ]),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: DetailedNewsCard(
                  album: albums[index],
                  padding: 20,
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
              subtitle: 'Author',
              showTitle: false,
              showButton: true,
            )
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return AuthorProfileCard(
                album: albums[index],
              );
            },
            childCount: 3,
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
      ],
    );
  }
}
