import 'package:flutter/foundation.dart';

class Album{
final String cover;
final String title;
final String avatar;
final String subtitle;
final String author;
final int comments;
final bool isHot;

  Album(
     {@required this.cover, 
    @required this.title, 
    @required this.avatar, 
    @required this.subtitle, 
    @required this.author, 
    @required this.comments, 
    @required this.isHot});
   
}
List<Album> albums = <Album>[
Album (
 author: 'nawww',
 avatar: 'assets/icons/1.jpg', 
 comments: 10, 
 cover: 'assets/icons/2.jpg', 
 isHot: true, 
 subtitle: 'monday',
 title: 'this one'),

Album (
  author: 'nasss',
 avatar: 'assets/icons/2.jpg', 
 comments: 20, 
 cover: 'assets/icons/1.jpg', 
 isHot: false, 
 subtitle: 'tuesday',
 title: 'this two'),

 Album (
  author: 'navvv',
 avatar: 'assets/icons/1.jpg', 
 comments: 30, 
 cover: 'assets/icons/3.jpg', 
 isHot: false, 
 subtitle: 'wednesday',
 title: 'this three')
];