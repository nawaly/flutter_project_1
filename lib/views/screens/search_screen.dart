import 'package:flutter/material.dart';
import 'package:pt_project_1/views/components/headers/simple_headers.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleHeaders(padding: 10, 
              subtitle: 'Search', showButton: false, showStar: false, showTitle: false,),
            )
          ]),
        )
        
      ],
    );
  }
}