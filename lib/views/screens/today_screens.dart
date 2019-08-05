import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/views/components/cards/album_card.dart';

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (BuildContext context, int index) {
          return AlbumCard(album: albums[index]);
          
        },
      );
      
  
  }
}