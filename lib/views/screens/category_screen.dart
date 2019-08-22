import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/models/category.dart';
import 'package:pt_project_1/views/components/cards/category_card.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
import 'package:pt_project_1/views/components/headers/simple_headers.dart';
import 'package:scoped_model/scoped_model.dart';

// category tab
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Categoies',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
            SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index % 2 == 0 ? 20 : 0,
                      right: index % 2 != 0 ? 20 : 0),
                  child: CategoryCard(
                    category: categories[index],
                  ),
                );
              }, childCount: model.getAvailableAlbums().length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.4), //ratio of cross axis to main axis
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SimpleHeaders(
                  title: 'RECENT POSTS',
                  subtitle: 'Sports',
                  padding: 20,
                  showButton: true,
                  showTitle: true,
                  showStar: false,
                )
              ]),
            ),
            SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index.isEven ? 20 : 0, right: index.isOdd ? 20 : 0),
                  child: ImageTextCard(
                    album: model.getAvailableAlbums()[index],
                  ),
                );
              }, childCount: model.getAvailableAlbums().length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SimpleHeaders(
                  title: 'RECENT POSTS',
                  subtitle: 'Lifestyle',
                  padding: 20,
                  showButton: true,
                  showTitle: true,
                  showStar: false,
                )
              ]),
            ),
            SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index.isEven ? 20 : 0, right: index.isOdd ? 20 : 0),
                  child: ImageTextCard(
                    album: model.getAvailableAlbums()[index],
                  ),
                );
              }, childCount: model.getAvailableAlbums().length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
          ],
        );
      },
    );
  }
}
